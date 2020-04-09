module Foo

using DataStructures
using DelimitedFiles
using Distributed
using FFTW
using InteractiveUtils
using KahanSummation
using Loess
using LinearAlgebra
using MacroTools
using Match
using Markdown
using Measurements
using Memoization
using Parameters
using Printf
using ProgressMeter
using Random
using Roots
using Requires
using Setfield 
using SparseArrays
using StaticArrays
using Statistics
using StatsBase
using Zygote


# the version that works
# @init @require PyCall = "438e738f-606a-5dbb-bf0a-cddfbfd45ab0" begin
#     @init @require PyPlot="d330b81b-6aea-500a-939a-2ce795aea3ee" begin
#         using .PyPlot
#         using .PyCall
#     end
# end

# the version that errors
@init @require PyPlot="d330b81b-6aea-500a-939a-2ce795aea3ee" begin
    using .PyPlot
    using .PyPlot.PyCall
end



end
