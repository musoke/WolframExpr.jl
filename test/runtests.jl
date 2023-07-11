using WolframExpr
using Test
using Documenter
using MathLink

# Prevent IOCapture from hanging within doctests
# See https://github.com/JuliaDocs/IOCapture.jl/issues/17
W`Sin`

doctest(WolframExpr)

@testset "WolframExpr.jl" begin
    include("basic.jl")
end

@testset "Aqua.jl" begin
    using Aqua

    Aqua.test_all(WolframExpr)
end
