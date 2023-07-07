using WolframExpr
using Documenter

DocMeta.setdocmeta!(WolframExpr, :DocTestSetup, :(using WolframExpr); recursive = true)

doctest = if haskey(ENV, "GITHUB_ACTIONS")
    @warn "Tests disabled in github actions"
    false
else
    true
end

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
    doctest = doctest,
)

deploydocs(; repo = "github.com/musoke/WolframExpr.jl", devbranch = "main")
