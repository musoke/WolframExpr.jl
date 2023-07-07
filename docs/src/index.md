```@meta
CurrentModule = WolframExpr
```

# WolframExpr

[WolframExpr](https://github.com/musoke/WolframExpr.jl) is a package for translating [Wolfram Language](https://www.wolfram.com/language/) expressions to [Julia](https://julialang.org/) functions.

_Mathematica, Wolfram, MathLink are all trademarks of Wolfram Research._

__Incomplete work in progress.__

The primary function is [`string_to_function`](@ref), which converts a string containing a Wolfram Language to a Julia function.
For example,

```@repl
using WolframExpr

f = string_to_function("A[x,y]+y", [:A, :x, :y]);

A(x, y) = x^2 + y^2;

f(A, 1, 2)
```

For best results using expressions from Mathematica, pass your expression through [FullForm](https://reference.wolfram.com/language/ref/FullForm.html) to remove special syntax.


## Installation

WolframExpr depends on [MathLink.jl](https://github.com/JuliaInterop/MathLink.jl), which requires an installation of either [Mathematica](http://www.wolfram.com/mathematica/) or the free [Wolfram Engine](https://www.wolfram.com/engine/).
See MathLink's install directions for installation and troubleshooting directions.

If you succeed in installing MathLink, the usual Julia installation methods will install WolframExpr:

```repl
] add WolframExpr
```


```@index
```

```@autodocs
Modules = [WolframExpr]
```
