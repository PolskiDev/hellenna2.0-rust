function declare_loop()
    file:write("loop {",'\n')
end

function declare_while(condition)
    file:write("for "..condition.." {",'\n')
end


function declare_for(i,min,max,step)
    if step == nil then step = 1 end
    file:write("for "..i.." in "..min..".."..max..'\n')
end
function declare_forin(i,condition)  --@NON-PORTABLE
    file:write("for "..i.." in "..condition.." {")
end
function times(i, max)
    declare_for(i, 0,max, 1)
end


function declare_if(condition)
    file:write("if "..condition.." {",'\n')
end
function declare_elseif(condition)
    file:write("} else if "..condition.." {",'\n')
end
function declare_else(condition)
    file:write("} else {",'\n')
end



function declare_end()
    file:write("}",'\n')
end
function declare_break()
    file:write("break;",'\n')
end
function declare_continue()
    file:write("continue;\n")
end