(import) "Hellenna.lang"
(import) "Hellenna.stdio"
(import) "Hellenna.error"
(import) "Hellenna.stdtab"
(import) "Hellenna.var"
(import) "Hellenna.arr.arr"
(import) "Hellenna.arr.oper"
(import) "Hellenna.cast"
(import) "Hellenna.incr"
(import) "Hellenna.strings"
(import) "Hellenna.loops"
(import) "Hellenna.fn"
(import) "Hellenna.pkg"
(import) "Hellenna.mod"


namespace "main"
    (import_rust) "std::fs::File"
    (import_rust) "std::io::prelude::*"
    

    fn("main:void") >>
        (import_module) "main"

        let (|$msg:string|, "&world")
        Console.Write "&Hello "
        Console.WriteLine |$msg|


        let(|$x:string|, Cast.toString(|String.len("&Hallo Welt")|) )
        Console.WriteLine |$x|

        let(|$c:boolean|, |true|)
        Console.WriteLine( Cast.toString(|c|) )
    ..;

    
..?