var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = WolframExpr","category":"page"},{"location":"#WolframExpr","page":"Home","title":"WolframExpr","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Incomplete work in progress building on work by github.com/eswagel. Open an issue or pull request if you find bugs or have requests.","category":"page"},{"location":"","page":"Home","title":"Home","text":"WolframExpr is a package for translating Wolfram Language expressions to Julia functions.","category":"page"},{"location":"","page":"Home","title":"Home","text":"Mathematica, Wolfram, MathLink are all trademarks of Wolfram Research.","category":"page"},{"location":"","page":"Home","title":"Home","text":"The primary function is string_to_function, which converts a string containing a Wolfram Language expression to a Julia function.","category":"page"},{"location":"","page":"Home","title":"Home","text":"For example,","category":"page"},{"location":"","page":"Home","title":"Home","text":"using WolframExpr\n\nf = string_to_function(\"A[x,y]+y\", [:A, :x, :y]);\n\nA(x, y) = x^2 + y^2;\n\nf(A, 1, 2)","category":"page"},{"location":"","page":"Home","title":"Home","text":"For best results using expressions from Mathematica, pass your expression through FullForm to remove special syntax.","category":"page"},{"location":"#Installation","page":"Home","title":"Installation","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"WolframExpr depends on MathLink.jl, which requires an installation of either Mathematica or the free Wolfram Engine. If those exist, the usual Julia installation methods will install WolframExpr:","category":"page"},{"location":"","page":"Home","title":"Home","text":"] add https://github.com/musoke/WolframExpr.jl","category":"page"},{"location":"","page":"Home","title":"Home","text":"If this fails, the problem is likely with MathLink.jl. See its documentation for installation and troubleshooting directions.","category":"page"},{"location":"#API","page":"Home","title":"API","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Modules = [WolframExpr]","category":"page"},{"location":"#WolframExpr.string_to_expr-Tuple{Any}","page":"Home","title":"WolframExpr.string_to_expr","text":"string_to_expr(string)\n\nConvert a string to a Julia Expr.\n\nExamples\n\njulia> using WolframExpr\n\njulia> string_to_expr(\"(x+y)/2\")\n:((x + y) * 2 ^ -1)\n\n\n\n\n\n","category":"method"},{"location":"#WolframExpr.string_to_function-Tuple{Any, Any}","page":"Home","title":"WolframExpr.string_to_function","text":"string_to_function(string, symbols)\n\nConvert a string to a Julia function with arguments in symbols.\n\nThe resulting method has signature matching symbols.\n\nExamples\n\njulia> using WolframExpr\n\njulia> f = string_to_function(\"x+y\", [:x, :y]);\n\njulia> f(1, 2)\n3\n\njulia> f(1.2, 2)\n3.2\n\n\n\n\n\n","category":"method"},{"location":"#WolframExpr.string_to_wexpr-Tuple{Any}","page":"Home","title":"WolframExpr.string_to_wexpr","text":"string_to_wexpr(wolfram)\n\nConvert a string to a MathLink.WExpr.\n\nVery shallow wrapper around MathLink's parsing.\n\nExamples\n\njulia> using WolframExpr\n\njulia> string_to_wexpr(\"Sin[1]\")\nW\"Sin\"(1)\n\n\n\n\n\n","category":"method"},{"location":"#WolframExpr.wexpr_to_expr-Tuple{MathLink.WSymbol}","page":"Home","title":"WolframExpr.wexpr_to_expr","text":"wexpr_to_expr(wolfram)\n\nConvert a Wolfram expression from a MathLink.WExpr to a Julia expression.\n\nExamples\n\njulia> using MathLink, WolframExpr\n\njulia> wexpr_to_expr(W`1. + 1`)\n:(1.0 + 1)\n\n\n\n\n\n","category":"method"}]
}
