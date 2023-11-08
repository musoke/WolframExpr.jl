```@meta
CurrentModule = WolframExpr
```

# WolframExpr
__Incomplete work in progress__ building on work by [github.com/eswagel](https://github.com/AmplitudeGravity/usingMathLink/blob/06c6ddf6c8c133a832a25156d61d8c356e232e96/useMathLink.ipynb).
Open an [issue](https://github.com/musoke/WolframExpr.jl/issues/new/choose) or [pull request](https://github.com/musoke/WolframExpr.jl/compare) if you find bugs or have requests.

[WolframExpr](https://github.com/musoke/WolframExpr.jl) is a package for translating [Wolfram Language](https://www.wolfram.com/language/) expressions to [Julia](https://julialang.org/) functions.

_Mathematica, Wolfram, MathLink are all trademarks of Wolfram Research._

The primary function is [`string_to_function`](@ref), which converts a string containing a Wolfram Language expression to a Julia function.

For example,
```@repl
using WolframExpr

f = string_to_function("A[x,y]+y", [:A, :x, :y]);

A(x, y) = x^2 + y^2;

f(A, 1, 2)
```

For best results using expressions from Mathematica, pass your expression through [FullForm](https://reference.wolfram.com/language/ref/FullForm.html) to remove special syntax.

[SymbolicsMathLink.jl](https://github.com/eswagel/SymbolicsMathLink.jl) has related functionality.


## Installation

WolframExpr depends on [MathLink.jl](https://github.com/JuliaInterop/MathLink.jl), which requires an installation of either [Mathematica](http://www.wolfram.com/mathematica/) or the free [Wolfram Engine](https://www.wolfram.com/engine/).
If those exist, the usual Julia installation methods will install WolframExpr:
```repl
] add https://github.com/musoke/WolframExpr.jl
```

If this fails, the problem is likely with [MathLink.jl](https://github.com/JuliaInterop/MathLink.jl).
See its documentation for installation and troubleshooting directions.


## API

```@autodocs
Modules = [WolframExpr]
```
