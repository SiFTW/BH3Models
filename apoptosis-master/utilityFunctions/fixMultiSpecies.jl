function is_index(thisLine::String, index::Vector{Int})
    is_id = false
    for id in index
        if startswith(strip(thisLine),"dy["*string(id)*"]=")
            is_id = true
            return (is_id,id)
        end
    end
    return (is_id,-1)
end

function fixSpecies(InputFileName,OutputFileName,index)
    outputArray=["#file edited by fixSpecies.jl to fix species:"*string(index)*"\n"]
    #go through input file and save each line to an output array
    #only change the line that starts with the index we're looking for
    open(InputFileName) do f

            for i in enumerate(eachline(f))
                thisLine=i[2]
                (is_id, id) = is_index(thisline, index)
                if is_id
                    #comment out existing line
                    push!(outputArray,"\t#"*strip(thisLine))
                    #add new line with =0
                    push!(outputArray,"\tdy["*string(id)*"]=0\n")
                else
                    push!(outputArray,thisLine)
                end
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
