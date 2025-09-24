lexer grammar MyLangLexer;

// Palavras chave principais
PROGRAM     : 'program';
VAR         : 'var';
BEGIN       : 'begin';
END         : 'end';
IF          : 'if';
THEN        : 'then';
ELSE        : 'else';
WHILE       : 'while';
DO          : 'do';
FOR         : 'for';
TO          : 'to';
PRINT       : 'print';

// Tipos basicos
INTEGER     : 'integer';
REAL_T      : 'real';
STRING_T    : 'string';
BOOLEAN     : 'boolean';

// Literais numéricos
INT         : [0-9]+;
REAL        : [0-9]+ '.' [0-9]+;

// Strings com suporte a interpolação: "Ola ${nome}"
STRING      : '"' ( ~["\\] | '\\' . | Interp )* '"';
fragment Interp : '${' .*? '}';

// Identificadores com suporte a acentos
ID          : [\p{L}_][\p{L}\p{N}_]*;

// Operadores e simbolos
ASSIGN      : ':=';
PLUS        : '+';
MINUS       : '-';
MUL         : '*';
DIV         : '/';
EQ          : '=';
NEQ         : '<>';
LT          : '<';
LE          : '<=';
GT          : '>';
GE          : '>=';

// Extensões inventadas
INCREMENT   : '++';
DECREMENT   : '--';
QUESTION    : '?';
COLON       : ':';

// Delimitadores
SEMI        : ';';
COMMA       : ',';
DOT         : '.';
LPAREN      : '(';
RPAREN      : ')';

// Espaços e comentarios
WS          : [ \t\r\n]+ -> skip;
COMMENT     : '{' .*? '}' -> skip;
LINECOMMENT : '//' ~[\r\n]* -> skip;
