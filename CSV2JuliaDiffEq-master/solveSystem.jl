using DifferentialEquations, DataFrames
using Plots
using CSV
include("odeFileExample.jl")
include("variableNames.jl")
f=DDEFunction(ddeFile!,syms=syms)
#f=ODEFunction(odeFile!,syms=syms)
y0=ones(length(syms))
p=1
h(p,t)=ones(length(syms))
params=1
prob=DDEProblem(f,ones(length(syms)),h,(0.0,10.0))
#prob=ODEProblem(f,ones(length(syms)),(0.0,10.0))
print("Solving Equations \n")
@timev sol=solve(prob)
plot(sol)
png("testOut.png")
df=DataFrame(sol)
CSV.write("out.csv",df)

