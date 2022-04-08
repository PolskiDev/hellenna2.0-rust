String = {}

--@ return variables start with (@) instead of ($).

--@ let(|$variable:string|, "Hello World")
--@ Strings.replace(|@rep|, |$variable|, "Hello","Bye")
--@ Console.WriteLine(|@rep|)

function String.replace(func_ret, var, x,y)
    if x:sub(1,1) == "&" then
        if y:sub(1,1) == "&" then
            file:write("let mut "..func_ret:sub(2).." = "..var..".replace(\""..x:sub(2).."\",\""..y:sub(2).."\")")
        
        elseif y:sub(1,1) == "$" then
            file:write("let mut "..func_ret:sub(2).." = "..var..".replace(\""..x:sub(2).."\","..y:sub(2)..")")
        else
            file:write("let mut "..func_ret:sub(2).." = "..var..".replace(\""..x:sub(2).."\","..y..")")
        end
    
    elseif x:sub(1,1) == "$" then
       
        if y:sub(1,1) == "&" then
            file:write("let mut "..func_ret:sub(2).." = "..var..".replace("..x:sub(2)..",\""..y:sub(2).."\")")
        
        elseif y:sub(1,1) == "$" then
            file:write("let mut "..func_ret:sub(2).." = "..var..".replace("..x:sub(2)..","..y:sub(2)..")"
        else
            file:write("let mut "..func_ret:sub(2).." = "..var..".replace("..x:sub(2)..","..y..")")
        end

    else
        
        if y:sub(1,1) == "&" then
            file:write(func_ret:sub(2.." = "..var..".replace("..x:sub(2)..",\""..y:sub(2).."\")")
        
        elseif y:sub(1,1) == "$" then
            file:write("let mut "..func_ret:sub(2).." = "..var..".replace("..x:sub(2)..","..y:sub(2)..")")
        else
            file:write("let mut "..func_ret:sub(2).." = "..var..".replace("..x:sub(2)..","..y..")")
        end

    end
end



-- FIND CHAR IN STRING
--@ let (|$variable:string|, "&Hello world")
--@ String.find(|$variable|, "&w")

--@ let (|$variable:string|, "&Hello world")
--@ let (|$char:string|, "&w")
--@ String.find(|$variable|, |$char|)

--@ String.find("&Hello world", "&w")
function String.find(func_ret, s, substring)
    if s:sub(1, 1) == "&" then
        if substring:sub(1,1) == "&" then
           file:write(func_ret:sub(2).." = \""..s:sub(2).."\".find(\""..substring:sub(2).."\")")
            --return "strings.Index(\""..s:sub(2).."\", \""..substring:sub(2).."\")"

        elseif substring:sub(1,1) == "$" then
            file:write(func_ret:sub(2).." = \""..s:sub(2).."\".find("..substring:sub(2)..")")
            --return "strings.Index(\""..s:sub(2).."\", "..substring:sub(2)..")"
        else
            file:write(func_ret:sub(2).." = \""..s:sub(2)..".find("..substring..")")
            --return "strings.Index(\""..s:sub(2).."\", "..substring..")"
        end

    elseif s:sub(1, 1) == "$" then
        if substring:sub(1,1) == "&" then
            file:write("let mut "..func_ret:sub(2).." = "..s:sub(2)..".find(\""..substring:sub(2).."\")")
            --return "strings.Index("..s:sub(2)..", \""..substring:sub(2).."\")"

        elseif substring:sub(1,1) == "$" then
            file:write("let mut "..func_ret:sub(2).." = "..s:sub(2)..".find("..substring:sub(2)..")")
            --return "strings.Index("..s:sub(2)..", "..substring:sub(2)..")"
        else
            file:write("let mut "..func_ret:sub(2).." = "..s:sub(2)..".find("..substring..")")
            --return "strings.Index("..s:sub(2)..", "..substring..")"
        end
    else
        if substring:sub(1,1) == "&" then
            file:write("let mut "..func_ret:sub(2).." = "..s..".find(\""..substring:sub(2).."\")")
            --return "strings.Index("..s:sub(2)..", \""..substring:sub(2).."\")"

        elseif substring:sub(1,1) == "$" then
            file:write("let mut "..func_ret:sub(2).." = "..s..".find("..substring:sub(2)..")")
            --return "strings.Index("..s:sub(2)..", "..substring:sub(2)..")"
        else
            file:write("let mut "..func_ret:sub(2).." = "..s..".find("..substring..")")
            --return "strings.Index("..s:sub(2)..", "..substring..")"
        end
    end
    
end




--@ let(|$cadeia:string|, "Hello World")
--@ String.split(|replaced_var|, |cadeia|, "-")
--@ Console.WriteLine(|$replaced_var|)

function String.split(func_ret, sv,split_char)
    file:write("let "..func_ret:sub(2)..": Vec<&str> = "..sv..".split(\""..split_char.."\").collect();".."\n")
end

--@ Console.WriteLine(|String.uppercase("&hello world")|)
--@ Console.WriteLine(|String.uppercase(|$variable|)|)
--@ Console.WriteLine(|String.uppercase(|variable|)|)
function String.uppercase(func_ret, s)
    if s:sub(1,1) == "&" then
        file:write(func_ret:sub(2).." = \""..s:sub(2).."\".to_ascii_uppercase()")
    elseif s:sub(1,1) == "$" then
        file:write("let mut "..func_ret:sub(2).." = "..s:sub(2)..".to_ascii_uppercase()"
    else
        file:write("let mut "..func_ret:sub(2).." = "..s..".to_ascii_uppercase()")
    end
end


--@ Console.WriteLine(|String.lowercase("&HELLO WORLD")|)
--@ Console.WriteLine(|String.lowercase(|$variable|)|)
--@ Console.WriteLine(|String.lowercase(|variable|)|)

function String.lowercase(func_ret, s)
    if s:sub(1,1) == "&" then
        file:write("let mut "..func_ret:sub(2).." = ".."\""..s:sub(2).."\".to_lowercase()")
    elseif s:sub(1,1) == "$" then
        file:write("let mut "..func_ret:sub(2).." = "..s:sub(2)..".to_lowercase()")
    else
        file:write("let mut "..func_ret:sub(2).." = "..s..".to_lowercase()")
    end
end


--@ Console.WriteLine(|String.len("&HELLO WORLD")|)
--@ Console.WriteLine(|String.len(|$variable|)|)
--@ Console.WriteLine(|String.len(|variable|)|)
function String.len(func_ret, s)
    if s:sub(1,1) == "&" then
        file:write("let mut "..func_ret:sub(2).." = ".."\""..s:sub(2).."\".len()")

    elseif s:sub(1,1) == "$" then
        file:write("let mut "..func_ret:sub(2).." = "..s:sub(2)..".len()")
    else
        file:write("let mut "..func_ret:sub(2).." = "..s..".len()")
    end
end



-- STRING.INCLUDES
--@ Console.WriteLine( |String.includes("&HELLO WORLD", "&HELLO")| )

--@ Console.WriteLine( |String.includes(|$variable|,|$another|)| )
--@ Console.WriteLine( |String.includes(|variable|,|another|)| )

--@ Console.WriteLine( |String.includes(|variable|,"&HELLO")| )
--@ Console.WriteLine( |String.includes("&HELLO", |variable|)| )
function String.includes(func_ret, s,x)
    if s:sub(1,1) == "&" then
        --(s) is string
        if x:sub(1,1) == "&" then
            file:write("let mut "..func_ret:sub(2).." = ".."\""..s:sub(2).."\".contains(\""..x:sub(2).."\");")
        
        elseif x:sub(1,1) == "$" then
            file:write("let mut "..func_ret:sub(2).." = ".."\""..s:sub(2).."\".contains("..x:sub(2)..");")
        else
            file:write("let mut "..func_ret:sub(2).." = ".."\""..s:sub(2).."\".contains("..x..");")
        end

    elseif s:sub(1,1) == "$" then
        --(s) is variable
        if x:sub(1,1) == "&" then
            file:write("let mut "..func_ret:sub(2).." = "..s:sub(2)..".contains(\""..x:sub(2).."\");")
        
        elseif x:sub(1,1) == "$" then
            file:write("let mut "..func_ret:sub(2).." = "..s:sub(2)..".contains("..x:sub(2)..");")
        else
            file:write("let mut "..func_ret:sub(2).." = "..s:sub(2)..".contains("..x..");")
        end

    else
        --(s) is variable
        if x:sub(1,1) == "&" then
            file:write("let mut "..func_ret:sub(2).." = "..s..".contains(\""..x:sub(2).."\");")
        
        elseif x:sub(1,1) == "$" then
            file:write("let mut "..func_ret:sub(2).." = "..s..".contains("..x:sub(2)..");")
        else
            file:write("let mut "..func_ret:sub(2).." = "..s..".contains("..x..");")
        end
    end
end
