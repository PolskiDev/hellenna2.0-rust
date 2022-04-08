System = {}

function System.UnixExternal(bash, cmd)
    file:write("Command::new(\""..bash.."\").arg(\"-c\").arg(\""..cmd.."\").output().expect(\"Failure: Cannot execute input command ["..cmd.."]\")")
end
function System.MSDOS_External(cmd)
    file:write("Command::new(\"start\").arg(\""..cmd.."\").output().expect(\"Failure: Cannot execute input command ["..cmd.."]\")")
end


function System.ifwindows()
    file:write("if cfg!(windows) {")
    --  Close with:     ..;
end
function System.ifunix()
    file:write("if cfg!(unix) {")
    --  Close with:     ..;
end
function System.ifdarwin()
    file:write("if cfg!(target_os=\"macos\") {")
    --  Close with:     ..;
end