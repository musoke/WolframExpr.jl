module WolframExpr

using MathLink
using SyntaxTree

export string_to_function
export string_to_expr
export string_to_wexpr
export wexpr_to_expr

"""
    string_to_function(string, symbols)

Convert a string to a Julia function with arguments in `symbols`.

The resulting method has signature matching `symbols`.

# Examples

```jldoctest
julia> using WolframExpr

julia> f = string_to_function("x+y", [:x, :y]);

julia> f(1, 2)
3

julia> f(1.2, 2)
3.2
```
"""
function string_to_function(string, symbols)
    expr = string |> string_to_wexpr |> wexpr_to_expr

    genfun(expr, symbols)
end

"""
    string_to_expr(string)

Convert a string to a Julia `Expr`.

# Examples

```jldoctest
julia> using WolframExpr

julia> string_to_expr("(x+y)/2")
:((x + y) * 2 ^ -1)
```
"""
function string_to_expr(string)
    string |> string_to_wexpr |> wexpr_to_expr
end

"""
    string_to_wexpr(wolfram)

Convert a string to a `MathLink.WExpr`.

Very shallow wrapper around `MathLink`'s parsing.

# Examples

```jldoctest
julia> using WolframExpr

julia> string_to_wexpr("Sin[1]")
W"Sin"(1)
```
"""
function string_to_wexpr(string)
    W`$string`
end

"""
    wexpr_to_expr(wolfram)

Convert a Wolfram expression from a `MathLink.WExpr` to a Julia expression.

# Examples

```jldoctest
julia> using MathLink, WolframExpr

julia> wexpr_to_expr(W`1. + 1`)
:(1.0 + 1)
```
"""
function wexpr_to_expr(symb::MathLink.WSymbol)
    Symbol(symb.name)
end

function wexpr_to_expr(num::Number)
    num
end

function wexpr_to_expr(expr::MathLink.WExpr)::Expr

    # Check if derivative
    if typeof(expr.head) == MathLink.WExpr &&
       typeof(expr.head.head) == MathLink.WExpr &&
       typeof(expr.head.head.head) == MathLink.WSymbol &&
       expr.head.head.head.name == "Derivative"

        # Get name of function whose derivative is taken
        derivand_list = expr.head.args
        @assert length(derivand_list) == 1
        derivand::MathLink.WSymbol = derivand_list[1]

        # Get order of derivative
        derivative_order = expr.head.head.args

        # Check integer derivatives
        @assert derivative_order isa Vector{Int}
        # Check positive derivatives
        @assert all(i -> i >= 0, derivative_order)
        derivative_order

        symbol = Symbol(
            "Derivative",
            map(i -> "_" * string(i), derivative_order)...,
            "_",
            derivand,
        )

        arguments = map(wexpr_to_expr, expr.args)

        @debug "Found derivative" expr dump(expr) derivand derivative_order arguments

        return Expr(:call, symbol, arguments...)
    end

    if expr.head.name == "Times"
        return Expr(:call, :*, map(wexpr_to_expr, expr.args)...)
    elseif expr.head.name == "Plus"
        return Expr(:call, :+, map(wexpr_to_expr, expr.args)...)
    elseif expr.head.name == "Power"
        return Expr(:call, :^, map(wexpr_to_expr, expr.args)...)
    elseif expr.head.name == "Rational"
        return Expr(:call, ://, map(wexpr_to_expr, expr.args)...)
    else
        return Expr(:call, Symbol(expr.head.name), map(wexpr_to_expr, expr.args)...)
    end
end

end  # module
