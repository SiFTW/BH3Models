function fixSpecies(InputFileName,OutputFileName,index)
    outputArray=["#file edited by fixSpecies.jl to fix species:"*string(index)*"\n"]
    #go through input file and save each line to an output array
    #only change the line that starts with the index we're looking for
    open(InputFileName) do f
        for i in enumerate(eachline(f))
            thisLine=i[2]
            if startswith(strip(thisLine),"dy["*string(index)*"]=")
                #comment out existing line
                push!(outputArray,"\t#"*strip(thisLine))
                #add new line with =0
                push!(outputArray,"\tdy["*string(index)*"]=0\n")
            else
                push!(outputArray,thisLine)
            end
        end
    end
    #now write the output array to the output file
    open(OutputFileName,"w") do f
        for line in outputArray
            write(f, line*"\n")
        end
    end
end
