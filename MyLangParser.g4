parser grammar MyLangParser;

options { tokenVocab=MyLangLexer; }

// Regra inicial do programa
program     : PROGRAM ID SEMI block DOT EOF ;

// Bloco de declara��es e comandos
block       : (varDecl | stmt)* ;

// Declara��o de vari�veis
varDecl     : VAR ID (COLON type)? SEMI ;

// Tipos b�sicos
type        : INTEGER | REAL_T | STRING_T | BOOLEAN ;

// Comandos poss�veis
stmt
    : assignStmt
    | incStmt
    | decStmt
    | ifStmt
    | whileStmt
    | forStmt
    | printStmt
    | blockStmt
    ;

// Atribui��o
assignStmt  : ID ASSIGN expr SEMI ;

// Incremento (x++;)
incStmt     : ID INCREMENT SEMI ;

// Decremento (x--;)
decStmt     : ID DECREMENT SEMI ;

// Estrutura condicional IF
ifStmt      : IF expr THEN stmt (ELSE stmt)? ;

// Estrutura de repeti��o WHILE
whileStmt   : WHILE expr DO stmt ;

// Estrutura de repeti��o FOR
forStmt     : FOR ID ASSIGN expr TO expr DO stmt ;

// Comando PRINT (extens�o criada)
printStmt   : PRINT LPAREN expr RPAREN SEMI ;

// Bloco BEGIN ... END
blockStmt   : BEGIN stmt* END ;

// Express�es matem�ticas, relacionais e if tern�rio
expr
    : expr op=MUL expr                    # MulExpr
    | expr op=DIV expr                    # DivExpr
    | expr op=PLUS expr                   # AddExpr
    | expr op=MINUS expr                  # SubExpr
    | expr op=(LT | LE | GT | GE | EQ | NEQ) expr  # RelExpr
    | expr QUESTION expr COLON expr       # TernaryExpr
    | LPAREN expr RPAREN                  # ParenExpr
    | ID                                  # IdExpr
    | INT                                 # IntExpr
    | REAL                                # RealExpr
    | STRING                              # StringExpr
    ;
