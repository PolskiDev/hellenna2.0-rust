Oper = {}

--@ New array with *size positions
--@ Oper.new(|vetor:string|, {{"Gabriel","Mike","Roberto"}} )
--@ Oper.new(|vetor:int|, {{2,4,6,8,10,12,14,16, ...}} )
function Oper.new(name,sequence)    --Duplicated from (FreeArray.new)
    local t = name:sub(name:find(":")+1)      --var (type)
    local n = name:sub(1,name:find(":")-1)    --var (name)

    file:write("let mut "..n.." = ["..sequence.."];")
end


--@ Add new value to an existing or new (index) in array
--@ Oper.set(|vetor:3|, "Gabriel")
function Oper.set(func_ret, name, value)
    local pos = name:sub(name:find(":")+1)      --var (type)
    local n = name:sub(1,name:find(":")-1)    --var (name)
    file:write("let mut "..func_ret:sub(2).." = "..n.."["..(pos).."] = "..value)
end

--@ Get value from an existing (index) in array
--@ Oper.get(|vetor:3|)
function Oper.get(name)
    local pos = name:sub(name:find(":")+1)      --var (type)
    local n = name:sub(1,name:find(":")-1)    --var (name)
    file:write("let mut "..func_ret:sub(2).." = "..n.."["..(pos).."]")
end


--(NON-PORTABLE)
-- Oper.slice(name, begin,final) -> doesn't exist on Rust implementation
--@Oper.add(name, value) -> doesn't exist on Rust implementation