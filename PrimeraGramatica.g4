grammar PrimeraGramatica;

@lexer::header{
package sencillolenguaje;
}
@parser::header{
package sencillolenguaje;
}

principal
	:	{System.out.println("Entra");}INICIO sentencias+ FIN{System.out.println("Sale");};

sentencias
	:	asignacion|condicional|ciclo|in|out;
	
in	:	INGRESAR IDENTIFICADOR;

out	:	MOSTRAR (IDENTIFICADOR|STRING);

condicional
	:	SI expresion ENTONCES sentencias+ (SINO ENTONCES sentencias+)? FIN;

ciclo	:	MIENTRAS expresion ENTONCES sentencias+ FIN;

asignacion
	:	expresion C_ASIGNACION IDENTIFICADOR;
	
expresion
	:	NO? exp_booleana;

exp_booleana
	:	comparacion ((Y|O) comparacion)*;

comparacion
	:	sumaresta ((MAYOR|MENOR|MAYORIGUAL|MENORIGUAL|IGUAL|DIFERENTE)sumaresta)*;

sumaresta
	:	multdivmod ((MAS|MENOS) multdivmod)*;
	
multdivmod
	:	atom ((POR|ENTRE|MODULO) atom)*;

atom	:	IDENTIFICADOR|LITERAL|PARENTECIS_ABRE expresion PARENTECIS_CIERRA;

INGRESAR:	'INGRESAR_VALOR_DE';

MOSTRAR	:	'MOSTRAR';

STRING	:	'"' ('a'..'z'|'A'..'Z'|'0'..'9'|' '|'-'|'_'|'?'|'!'|'.'|',')* '"';

INICIO	:	'INICIO';

FIN	:	'FIN';

SI	:	'SI';

ENTONCES:	'ENTONCES';

SINO	:	'SINO';

MIENTRAS:	'MIENTRAS';

C_ASIGNACION
	:	'ASIGNAR_A';
	
Y	:	'Y';

O	:	'O';

NO	:	'NO';

LITERAL
	:	'-'?('0'..'9')+;

IDENTIFICADOR
	:	('a'..'z'|'_')+;
	
PARENTECIS_ABRE
	:	'(';
	
PARENTECIS_CIERRA
	:	')';

MAS	:	'+';

MENOS	:	'-';
POR	:	'*';
ENTRE	:	'/';
MODULO	:	'%';
MAYOR	:	'>';
MENOR	:	'<';
MAYORIGUAL
	:	'>=';
MENORIGUAL
	:	'<=';
IGUAL	:	'=';
DIFERENTE
	:	'=/';

WS  :   ( ' '
        | '\t'
        | '\r'
        | '\n'
        ) {$channel=HIDDEN;}
    ;

