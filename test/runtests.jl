using WolframExpr
using Test
using Documenter

doctest(WolframExpr)

@testset "WolframExpr.jl" begin
    include("basic.jl")
end

@testset "Aqua.jl" begin
    using Aqua

    Aqua.test_all(WolframExpr)
end
