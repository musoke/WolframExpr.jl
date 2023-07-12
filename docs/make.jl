using WolframExpr
using Documenter
using MathLink

# Prevent IOCapture from hanging within doctests
# See https://github.com/JuliaDocs/IOCapture.jl/issues/17
W`Sin`

DocMeta.setdocmeta!(WolframExpr, :DocTestSetup, :(using WolframExpr); recursive = true)

makedocs(;
    modules = [WolframExpr],
    authors = "Nathan Musoke <nathan.musoke@gmail.com> and contributors",
    repo = "https://github.com/musoke/WolframExpr.jl/blob/{commit}{path}#{line}",
    sitename = "WolframExpr.jl",
    format = Documenter.HTML(;
        prettyurls = get(ENV, "CI", "false") == "true",
        canonical = "https://musoke.github.io/WolframExpr.jl",
        edit_link = "main",
        assets = String[],
    ),
    pages = ["Home" => "index.md"],
)

deploydocs(; repo = "github.com/musoke/WolframExpr.jl", devbranch = "main")
