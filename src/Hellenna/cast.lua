-- @REPLACE RULES:

--from:  (v)
--to:    (func_ret, v)

--from:  return 
--to:    file:write("let mut ".."let mut "..func_ret:sub(2).." = "..



Cast = {}
function Cast.toString(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("let mut "..func_ret:sub(2).." = ".."\""..v:sub(2).."\".to_string()")

    elseif v:sub(1,1) == "$" then
        file:write("let mut "..func_ret:sub(2).." = "..v:sub(2)..".to_string()")
    else
        file:write("let mut "..func_ret:sub(2).." = "..v..".to_string()")
    end
end
function Cast.toBoolean(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("let mut "..func_ret:sub(2).." = ".."\""..v:sub(2).."\" as bool")
    elseif v:sub(1,1) == "$" then
        file:write("let mut "..func_ret:sub(2).." = "..v:sub(2).." as bool")
    else
        file:write("let mut "..func_ret:sub(2).." = "..v.." as bool")
    end
end


--@FLOAT
function Cast.toFloat(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("let mut "..func_ret:sub(2).." = ".."\""..v:sub(2).."\" as f32")
    elseif v:sub(1,1) == "$" then
        file:write("let mut "..func_ret:sub(2).." = "..v:sub(2).." as f32")
    else
        file:write("let mut "..func_ret:sub(2).." = "..v.." as f32")
    end
end
function Cast.toDouble(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("let mut "..func_ret:sub(2).." = ".."\""..v:sub(2).."\" as f64")
    elseif v:sub(1,1) == "$" then
        file:write("let mut "..func_ret:sub(2).." = "..v:sub(2).." as f64")
    else
        file:write("let mut "..func_ret:sub(2).." = "..v.." as f64")
    end
end


--@INTEGER
function Cast.toInt(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("let mut "..func_ret:sub(2).." = ".."\""..v:sub(2).."\" as i32")
    elseif v:sub(1,1) == "$" then
        file:write("let mut "..func_ret:sub(2).." = "..v:sub(2).." as i32")
    else
        file:write("let mut "..func_ret:sub(2).." = "..v.." as i32")
    end
end
function Cast.toInt8(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("let mut "..func_ret:sub(2).." = ".."\""..v:sub(2).."\" as i8")
    elseif v:sub(1,1) == "$" then
        file:write("let mut "..func_ret:sub(2).." = "..v:sub(2).." as i8")
    else
        file:write("let mut "..func_ret:sub(2).." = "..v.." as i8")
    end
end
function Cast.toInt16(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("let mut "..func_ret:sub(2).." = ".."\""..v:sub(2).."\" as i16")
    elseif v:sub(1,1) == "$" then
        file:write("let mut "..func_ret:sub(2).." = "..v:sub(2).." as i16")
    else
        file:write("let mut "..func_ret:sub(2).." = "..v.." as i16")
    end
end
function Cast.toInt32(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("let mut "..func_ret:sub(2).." = ".."\""..v:sub(2).."\" as i32")
    elseif v:sub(1,1) == "$" then
        file:write("let mut "..func_ret:sub(2).." = "..v:sub(2).." as i32")
    else
        file:write("let mut "..func_ret:sub(2).." = "..v.." as i32")
    end
end
function Cast.toInt64(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("let mut "..func_ret:sub(2).." = ".."\""..v:sub(2).."\" as i64")
    elseif v:sub(1,1) == "$" then
        file:write("let mut "..func_ret:sub(2).." = "..v:sub(2).." as i64")
    else
        file:write("let mut "..func_ret:sub(2).." = "..v.." as i64")
    end
end

--@UNSIGNED INTEGER
function Cast.toUInt(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("let mut "..func_ret:sub(2).." = ".."\""..v:sub(2).."\" as u32")
    elseif v:sub(1,1) == "$" then
        file:write("let mut "..func_ret:sub(2).." = "..v:sub(2).." as u32")
    else
        file:write("let mut "..func_ret:sub(2).." = "..v.." as u32")
    end
end
function Cast.toUInt8(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("let mut "..func_ret:sub(2).." = ".."\""..v:sub(2).."\" as u8")
    elseif v:sub(1,1) == "$" then
        file:write("let mut "..func_ret:sub(2).." = "..v:sub(2).." as u8")
    else
        file:write("let mut "..func_ret:sub(2).." = "..v.." as u8")
    end
end
function Cast.toUInt16(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("let mut "..func_ret:sub(2).." = ".."\""..v:sub(2).."\" as u16")
    elseif v:sub(1,1) == "$" then
        file:write("let mut "..func_ret:sub(2).." = "..v:sub(2).." as u16")
    else
        file:write("let mut "..func_ret:sub(2).." = "..v.." as u16")
    end
end
function Cast.toUInt32(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("let mut "..func_ret:sub(2).." = ".."\""..v:sub(2).."\" as u32")
    elseif v:sub(1,1) == "$" then
        file:write("let mut "..func_ret:sub(2).." = "..v:sub(2).." as u32")
    else
        file:write("let mut "..func_ret:sub(2).." = "..v.." as u32")
    end
end
function Cast.toUInt64(func_ret, v)
    if v:sub(1,1) == "&" then
        file:write("let mut "..func_ret:sub(2).." = ".."\""..v:sub(2).."\" as u64")
    elseif v:sub(1,1) == "$" then
        file:write("let mut "..func_ret:sub(2).." = "..v:sub(2).." as u64")
    else
        file:write("let mut "..func_ret:sub(2).." = "..v.." as u64")
    end
end