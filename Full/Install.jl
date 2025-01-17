using Pkg
# Jupyter
ENV["JUPYTER"] ="/usr/local/bin/jupyter"
ENV["PYTHON"] = "/usr/local/python"

Pkg.add(["IJulia"])
Pkg.build("IJulia")
# PyCall
Pkg.add(["PyCall"])
Pkg.build("PyCall")

using IJulia, PyCall
# Packages
Pkg.add(["Plots","Gadfly","GR","PyPlot","StatsPlots","Queryverse","DataFramesMeta","JuliaDB","CSV","CSVFiles","ZipFile","Pickle","XLSX","KernelDensity", "SpecialFunctions","MultivariateStats","Clustering","Turing","Statistics","StatsFuns","StatsKit","StatsModels","LinearAlgebra","ScikitLearn","Flux","Optim", "DifferentialEquations","Compose","SymPy","ODE","BenchmarkTools", "DataStructures","Random","MPI","ClusterManagers","Distributions", "Polynomials",])

using Plots, Gadfly,GR,PyPlot,StatsPlots,Queryverse,DataFramesMeta,JuliaDB,CSV,CSVFiles
using ZipFile,Pickle,XLSX,KernelDensity, SpecialFunctions,MultivariateStats,Clustering,Turing
using Statistics,StatsFuns,StatsKit,StatsModels,LinearAlgebra,ScikitLearn
using Flux,Optim, DifferentialEquations,Compose,SymPy,ODE
using BenchmarkTools, DataStructures,Random,MPI,ClusterManagers,Distributions, Polynomials