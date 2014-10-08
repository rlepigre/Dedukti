module P = Parser.Make(Top)

let rec parse lb =
  try
    while true do
      print_string ">> "; flush stdout; P.line Lexer.token lb
    done
  with
    | Exit      -> parse lb
    | P.Error   ->
        Printf.eprintf "Unexpected token '%s'.\n" (Lexing.lexeme lb) ; parse lb
    | Tokens.EndOfFile -> exit 0

let  _ =
  print_string "Welcome in Dedukti\n";
  let v = Term.hstring "toplevel" in
    Env.init v ;
    parse (Lexing.from_channel stdin)