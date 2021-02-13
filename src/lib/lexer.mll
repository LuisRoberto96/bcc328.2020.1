{
  module L = Lexing

  type token = [%import: Parser.token] [@@deriving show]

  let illegal_character loc char =
    Error.error loc "illegal character '%c'" char
}

let spaces = [' ' '\t']+
let digit = ['0'-'9']
let integer = digit+
let strings = ['a'-'z' 'A'-'Z']['0'-'9''a'-'z''A'-'Z''_']*

(* add other definitions, if needed *)

rule token = parse
  | spaces            { token lexbuf }
  | '\n'              { L.new_line lexbuf; token lexbuf }
  | integer as lxm    { LITINT (int_of_string lxm) }
  | '+'               { PLUS }
  (*| '-'               { MINUS } *)
  | '('               { LPAREN }
  | ')'               { RPAREN }
  | ','               { COMMA }
  | '<'               { LT } 
  | '>'               { GT }
  | '='               { EQ }     
  | "int"             { INT }
  | "bool"            { BOOL }
  | "if"              { IF }
  | "then"            { THEN }
  | "else"            { ELSE }
  | "let"             { LET }
  | "in"              { IN }
  | strings as lxm    { ID (Symbol.symbol lxm)}
  (* add other lexical rules *)

  | eof               { EOF }
  | _                 { illegal_character (Location.curr_loc lexbuf) (L.lexeme_char lexbuf 0) }
