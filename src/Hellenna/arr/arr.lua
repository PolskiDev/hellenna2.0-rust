NumericArray = {}
FreeArray = {}

--@ FreeArray.new(|students:string|, "Julia, Mike, Jean")
--@ (Dynamic size of the array)
function FreeArray.new(name,sequence)
    local t = name:sub(name:find(":")+1)      --var (type)
    local n = name:sub(1,name:find(":")-1)    --var (name)

    file:write("let mut "..n.." = ["..sequence.."];")
end

--@ NumericArray.new(3, |students:string|, "Julia, Mike, Jean")
function NumericArray.new(size, name,sequence)
    local t = name:sub(name:find(":")+1)      --var (type)
    local n = name:sub(1,name:find(":")-1)    --var (name)

    file:write("let mut "..n..":["..t..";"..size.."] = ["..sequence.."];")
end