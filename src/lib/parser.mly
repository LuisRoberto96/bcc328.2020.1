// parser.mly

%token                 EOF
%token <int>           LITINT
%token <Symbol.symbol> ID
%token                 PLUS
(* %token                 MINUS *)
%token                 INT
%token                 BOOL
%token                 LPAREN
%token                 RPAREN
%token                 IF
%token                 THEN
%token                 ELSE
%token                 COMMA
%token                 LT
%token                 GT
%token                 EQ
%token                 LET
%token                 IN

%%
