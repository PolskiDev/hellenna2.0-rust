File = {}

-- STRING REFERENCE
--@ File.CreateFile("&text.txt")

-- VARIABLE REFERENCE
--@ let(|variable|, "text.txt")
--@ File.CreateFile(|$variable|)

-- VARIABLE REFERENCE
--@ let(|variable|, "text.txt")
--@ File.CreateFile(|variable|)

function File.CreateFile(file)
    if file:sub(1,1) == "&" then
        file:write("let mut xfile = File::create(\""..file:sub(2).."\").expect(\"File could not be created!\");")
    
    elseif file:sub(1,1) == "$" then
        file:write("let mut xfile = File::create("..file:sub(2)..").expect(\"File could not be created!\");")
    else
        file:write("let mut xfile = File::create("..file..").expect(\"File could not be created!\");")
    end
    
end


function File.WriteLine(file, text)
    File.CreateFile(file)
    
    if text:sub(1,1) == "&" then
        file:write("xfile.write_all(b\""..text:sub(2).."\").expect(\"FileWriter exited with errors!\");")
    
    elseif text:sub(1,1) == "$" then
        file:write("xfile.write_all(b"..text:sub(2)..").expect(\"FileWriter exited with errors!\");")
    else
        file:write("xfile.write_all(b"..text..").expect(\"FileWriter exited with errors!\");")
    end
    
end
function File.ReadLine(file, returned_string)
    --let mut xfile = File::open("info.txt").expect("File could not be opened!");
    --let mut contents = String::new();
    --xfile.read_to_string(&mut contents).expect("File could not be read!")

    if file:sub(1,1) == "&" then
        file:write("let mut xfile = File::open(\""..file:sub(2).."\").expect(\"File could not be opened!\");")
    elseif file:sub(1,1,) == "$" then
        file:write("let mut xfile = File::open("..file:sub(2)..").expect(\"File could not be opened!\");")
    else
        file:write("let mut xfile = File::open("..file..").expect(\"File could not be opened!\");")

    end
        
    file:write("let mut xcontents = String::new();")
    file:write("xfile.read_to_string(&mut xcontents).expect(\"File could not be read!\")")
end