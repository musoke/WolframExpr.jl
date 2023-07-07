using WolframExpr
using Test
using Documenter

if haskey(ENV, "GITHUB_ACTIONS")
    @warn "Tests disabled in github actions"
    return
end

doctest(WolframExpr)

@testset "WolframExpr.jl" begin
    include("basic.jl")
end

@testset "Aqua.jl" begin
    using Aqua

    Aqua.test_all(WolframExpr)
end
