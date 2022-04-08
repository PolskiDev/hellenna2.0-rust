--@ fn("hello:string", ...)
function fn(name, arguments)
    local t = name:sub(name:find(":")+1)      --struct element (type)
    local n = name:sub(1,name:find(":")-1)    --struct element (name)


     -- @Micro embedded parser
     t = t:gsub("int","isize")
     t = t:gsub("uint","usize")
     t = t:gsub("rune","u8")    
     
     t = t:gsub("int8","i8")
     t = t:gsub("int16","i16")
     t = t:gsub("int32","i32")
     t = t:gsub("int64","i64")
     
     t = t:gsub("uint8","u8")
     t = t:gsub("uint16","u16")
     t = t:gsub("uint32","u32")
     t = t:gsub("uint64","u64")
     t = t:gsub("uintptr","u32")
     
     
     t = t:gsub("byte","u8")
     t = t:gsub("short","u16")
     t = t:gsub("long","u32")
     
     t = t:gsub("float","f32")
     t = t:gsub("double","f64")
     
     t = t:gsub("boolean","bool")
     t = t:gsub("string","&str")

    -- @logic
    if t ~= "void" then
        if arguments == nil then
            file:write("pub fn "..n.."() -> "..t.."{",'\n')
        else
            file:write("pub fn "..n.."("..arguments..") -> "..t.." {",'\n')
        end
    else
        if arguments == nil then
            file:write("pub fn "..n.."() {",'\n')
        else
            file:write("pub fn "..n.."("..arguments..") {",'\n')
        end
    end
    
end

function ret(val)
    if val:sub(1,1) == "&" then
        file:write("return \""..val:sub(2).."\"",'\n')
    
    elseif val:sub(1,1) == "$" then
        file:write("return "..val:sub(2))

    else
        file:write("return "..val,'\n')
    end
    
end

function Syscall(fun_name,arguments)

    if arguments ~= nil then
        if arguments:sub(1,1) == "&" then
            file:write(fun_name.."(\""..arguments:sub(2).."\")",'\n')

        elseif arguments:sub(1,1) == "$" then
            file:write(fun_name.."("..arguments:sub(2)..")",'\n')
        else
            file:write(fun_name.."("..arguments..")",'\n')
        end
        
    else
        file:write(fun_name.."()",'\n')
    end

end
