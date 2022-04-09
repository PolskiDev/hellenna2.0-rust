    -- let (|name:type|, "value")

    -- @STRING
    --   x  : string

    -- @BOOLEAN
    --   x  : boolean


    -- @SIGNED INT
    --   x  : int

    --   x  : int8
    --   x  : int16
    --   x  : int32     --  x  : rune
    --   x  : int64


    -- @UNSIGNED INT
    --   x  : uint

    --   x  : uint8     --  x  : byte
    --   x  : uint16
    --   x  : uint32
    --   x  : uint64

    --@ FLOAT
    --   x  : float32
    --   x  : float64

    --@ COMPLEX NUMBERS (6+2i)
    --   x  : complex64
    --   x  : complex128

function let(name,value)
    value = tostring(value)
    local n = name:sub(1,name:find(":")-1)    --var (name)
    local t = name:sub(name:find(":")+1)      --var (type)

    -- @Micro embedded parser
    t = t:gsub("int","isize")
    t = t:gsub("uint","uzise")
    t = t:gsub("rune","isize")    
    
    t = t:gsub("int8","i8")
    t = t:gsub("int16","i16")
    t = t:gsub("int32","i32")
    t = t:gsub("int64","i64")
    
    t = t:gsub("uint8","u8")
    t = t:gsub("uint16","u16")
    t = t:gsub("uint32","u32")
    t = t:gsub("uint64","u64")
    t = t:gsub("uintptr","u32")
    
    
    t = t:gsub("byte","i8")
    t = t:gsub("short","i16")
    t = t:gsub("long","i64")
    
    t = t:gsub("float","f32")
    t = t:gsub("double","f64")
    
    t = t:gsub("boolean","bool")
    t = t:gsub("string","&str")



    if name:find(":") ~= nil then
        --@exists explicit declaration
        if n:sub(1,1) == "$"
        or n:sub(1,1) == "@"
        then
            if value:sub(1,1) == "&" then
                --file:write("let mut "..n:sub(2)..":"..t.." = \""..value:sub(2).."\";\n")
                file:write("let mut "..n:sub(2).." = \""..value:sub(2).."\""..";\n")

            elseif value:sub(1,1) == "$" then
                file:write("let mut "..n:sub(2)..":"..t.." = "..value:sub(2)..";\n")
            else
                file:write("let mut "..n:sub(2)..":"..t.." = "..value..";\n")
            end

        else
            if value:sub(1,1) == "&" then
                --file:write("let mut "..n..":"..t.." = \""..value:sub(2)..";\"\n")
                file:write("let mut "..n:sub(2).." = \""..value:sub(2).."\""..";\n")

            elseif value:sub(1,1) == "$" then
                file:write("let mut "..n:sub(2)..":"..t.." = "..value:sub(2)..";\n")
            else
                file:write("let mut "..n:sub(2)..":"..t.." = "..value..";\n")
            end
            
        end

    else

        --@exists inference (NOT WORKING)
        if n:sub(1,1) == "$" then
            file:write(n:sub(2).." := "..t,';\n')
        else
            file:write(n.." := "..t,';\n')
        end

    end
end



function var(name,value)
    if value:sub(1,1) == "&"
    or value:sub(1,1) == "$"
    or value:sub(1,1) == "@"
    then
        -- String:      &Arnold
        file:write(name:sub(2).." = \""..value:sub(2).."\"",';\n')
    
    elseif value:sub(1,1) == "$" then
        -- Variable (or) function that returns a string
        file:write(name.." = "..value:sub(2),';\n')
    else
        -- Number:      136
        file:write(name.." = "..value,';\n')
    end
end