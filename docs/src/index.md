```@meta
CurrentModule = WolframExpr
```

# WolframExpr

Documentation for [WolframExpr](https://github.com/musoke/WolframExpr.jl).


The primary function is [`string_to_function`](@ref), which converts Wolfram Language string to a Julia function.
For example,

```@repl
using WolframExpr

f = string_to_function("A[x,y]+y", [:A, :x, :y]);

A(x, y) = x^2 + y^2;

f(A, 1, 2)
```

```@index
```

```@autodocs
Modules = [WolframExpr]
```
