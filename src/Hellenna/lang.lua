--[[
    Free Software License: (BSD 2-clause license)
    Copyright 2022 Gabriel Margarido

    Redistribution and use in source and binary forms,
    with or without modification, are permitted provided
    that the following conditions are met:

    1. Redistributions of source code must retain the above
    copyright notice, this list of conditions and the following
    disclaimer.

    2. Redistributions in binary form must reproduce the above
    copyright notice, this list of conditions and the following
    disclaimer in the documentation and/or other materials provided
    with the distribution.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
    "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
    LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS 
    FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
    COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
    INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
    BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
    LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
    CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
    LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
    ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
    POSSIBILITY OF SUCH DAMAGE.

]]


function namespace(main)
    file = io.open(main..".rs", "w")

    --[[
    
    local __LIBPATH = "Hellenna"
    
    file:write("require \""..__LIBPATH..".lang\"")
    file:write("require \""..__LIBPATH..".var\"")
    file:write("require \""..__LIBPATH..".loops\"")
    file:write("require \""..__LIBPATH..".fn\"")
    file:write("require \""..__LIBPATH..".pkg\"")
    file:write("require \""..__LIBPATH..".os\"")
    
    ]]

end
function interrupt()
    file:flush()
    file:close()
end