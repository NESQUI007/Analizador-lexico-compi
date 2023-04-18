package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n,"",“”]+
%{
    public String lexeme;
%}
%%
printf |
if |
else |
while |
for |
elseif  |
case    |
switch  |
break {lexeme=yytext(); return Reservada;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"=" {return Igual;}
"+" {return Suma;}
"-" {return Resta;}
"*" {return Multiplicacion;}
"/" {return Division;}
":" {return DosPuntos;}
";" {return Puntoycoma;}
"{" {return CorcheteAbre;}
"}" {return CorcheteCierre;}
"(" {return ParentesisAbre;}
")" {return ParentesisCierre;}
"," {return Separador;}
"%" {return Porcentaje;}

{L}({L}|{D})* {lexeme=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}
 . {return ERROR;}
