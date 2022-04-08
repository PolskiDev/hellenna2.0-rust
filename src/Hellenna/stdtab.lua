Std = {}


-- Std.table("Dog")
--      Std.def(|height:float|)
--      Std.def(|age:int|)
--      Std.def(|name:string|)
--
-- ..;

--@ Create new table -> Std.table("Name")
function Std.table(name)
    file:write("struct "..name.." {\n")
end
function Std.declare_end()
    file:write("}\n")
end

--@ Create new item/element inside the table -> Std.def(|name:type|)
function Std.def(name)
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

    file:write(n..": "..t..",\n")
end

--


--@ Create a new object -> Std.let(|object.Table|, |height, age, name|)
--@ -> Console.WriteLine |object.height|

function Std.let(name, arguments)
    local Class = name:sub(name:find("%.")+1)    --Class Table
    local object = name:sub(1,name:find("%.")-1)    --Object Element (name)
    
    file:write("let "..object.." = "..Class.."{"..arguments.."}\n")
end