using MathLink
using WolframExpr

@test string_to_wexpr("1.+1") == W"Plus"(1.0, 1)

@test wexpr_to_expr(W`1. + 1`) == :(1.0 + 1)

@test string_to_expr("1.+1") == :(1.0 + 1)

@test string_to_expr("I") == :im
@test string_to_expr("1 + 2 I") == :(1 + 2im)
@test eval(string_to_expr("Complex[1, 2]")) == eval(:(1 + 2im))

f = string_to_function("1.+1", [])
@test f() === 2.0

f = string_to_function("1.+2I", [])
@test f() === 1.0 + 2.0im

f = WolframExpr.string_to_function("x+y", [:x, :y])
@test f(1.2, 2) === 3.2

f = WolframExpr.string_to_function("Sqrt[x]", [:x])
@test f(2) === sqrt(2)

string_derivative = raw"""Derivative[0,1][f][x,y]"""
@test string_to_expr(string_derivative) == :(Derivative_0_1_f(x, y))
