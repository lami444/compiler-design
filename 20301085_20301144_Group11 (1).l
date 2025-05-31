%option noyywrap

%{
#include<bits/stdc++.h>
using namespace std;

ofstream yyoutlog; //output filestream for log file

string loglist = ""; //list of tokens along with line numbers

// define necessary c++ variables and functions here (if any)
int line = 1;

%}

/* Regular Definitions */

delim [ \t\v\r]

/* write regular expressions for whitespace and newline */
ws delim+

newline \r?\n  
id [a-zA-Z_][a-zA-Z0-9_]*
letter_ [A-Za-z_]
digit [0-9]
int_digit [0-9]+
float [-+]?[0-9]*\.?[0-9]+
floats_scientific [+-]?[0-9]*\.[0-9]+([eE][+-]?[0-9]+)?


/* write regular expressions for id, float and integers */



%%

{ws} { /* ignore whitespace */ }

{newline} {
/* do necessary bookkeeping (line number tracking etc.) */
line+=1;
}


{floats_scientific} {
            loglist="Line No "+to_string(line)+": Token <CONST_FLOAT> Lexeme "+yytext+" found"+"\n"+"\n";
            yyoutlog<<loglist;
        }

{int_digit} {
            loglist="Line No "+to_string(line)+": Token <CONST_INT> Lexeme "+yytext+" found"+"\n"+"\n";
            yyoutlog<<loglist;
        }


if {
loglist="Line no "+to_string(line)+": Token <IF> Lexeme "+yytext+" found"+"\n"+"\n";
yyoutlog<<loglist;
}

else {
loglist="Line No "+to_string(line)+": Token <ELSE> Lexeme "+yytext+" found"+"\n"+"\n";
yyoutlog<<loglist;
}


break {
loglist="Line No "+to_string(line)+": Token <BREAK> Lexeme "+yytext+" found"+"\n"+"\n";
yyoutlog<<loglist;
}

return {
loglist="Line No "+to_string(line)+": Token <RETURN> Lexeme "+yytext+" found"+"\n"+"\n";
yyoutlog<<loglist;
}

for {
loglist="Line no "+to_string(line)+": Token <FOR> Lexeme "+yytext+" found"+"\n"+"\n";
yyoutlog<<loglist;
}

do {
loglist="Line no "+to_string(line)+": Token <DO> Lexeme "+yytext+" found"+"\n"+"\n";
yyoutlog<<loglist;
}

float {
loglist="Line no "+to_string(line)+": Token <FLOAT> Lexeme "+yytext+" found"+"\n"+"\n";
yyoutlog<<loglist;
}

int {
loglist="Line no "+to_string(line)+": Token <INT> Lexeme "+yytext+" found"+"\n"+"\n";
yyoutlog<<loglist;
}

void {
loglist="Line no "+to_string(line)+": Token <VOID> Lexeme "+yytext+" found"+"\n"+"\n";
yyoutlog<<loglist;
}

default {
loglist="Line no "+to_string(line)+": Token <DEFAULT> Lexeme "+yytext+" found"+"\n"+"\n";
yyoutlog<<loglist;
}

switch {
loglist="Line no "+to_string(line)+": Token <SWITCH> Lexeme "+yytext+" found"+"\n"+"\n";
yyoutlog<<loglist;
}

while {
loglist="Line no "+to_string(line)+": Token <WHILE> Lexeme "+yytext+" found"+"\n"+"\n";
yyoutlog<<loglist;
}

goto {
loglist="Line no "+to_string(line)+": Token <GOTO> Lexeme "+yytext+" found"+"\n"+"\n";
yyoutlog<<loglist;
}

printf {
loglist="Line No "+to_string(line)+": Token <PRINTF> Lexeme "+yytext+" found"+"\n"+"\n";
yyoutlog<<loglist;
}

continue {
loglist="Line No "+to_string(line)+": Token <CONTINUE> Lexeme "+yytext+" found"+"\n"+"\n";
yyoutlog<<loglist;
}

do {
loglist="Line No "+to_string(line)+": Token <DO> Lexeme "+yytext+" found"+"\n"+"\n";
yyoutlog<<loglist;
}

"+"|"-" { /* to match two same operators use | */
loglist="Line no "+to_string(line)+": Token <ADDOP> Lexeme "+yytext+" found"+"\n"+"\n";
yyoutlog<<loglist;
}

"*"|"/"|"%" { /* to match two same operators use | */
loglist="Line no "+to_string(line)+": Token <MULOP> Lexeme "+yytext+" found"+"\n"+"\n";
yyoutlog<<loglist;
}

"++"|"--" { /* to match two same operators use | */
loglist="Line no "+to_string(line)+": Token <INCOP> Lexeme "+yytext+" found"+"\n"+"\n";
yyoutlog<<loglist;
}

"<"|">"|"=="|"<="|">="|"!=" { /* to match two same operators use | */
loglist="Line no "+to_string(line)+": Token <RELOP> Lexeme "+yytext+" found"+"\n"+"\n";
yyoutlog<<loglist;
}

"=" { /* to match two same operators use | */
loglist="Line no "+to_string(line)+": Token <ASSIGNOP> Lexeme "+yytext+" found"+"\n"+"\n";
yyoutlog<<loglist;
}
"&&"|"||" { /* to match two same operators use | */
loglist="Line no "+to_string(line)+": Token <LOGICOP> Lexeme "+yytext+" found"+"\n"+"\n";
yyoutlog<<loglist;
}

"!" { /* to match two same operators use | */
loglist="Line no "+to_string(line)+": Token <NOT> Lexeme "+yytext+" found"+"\n"+"\n";
yyoutlog<<loglist;
}

"(" { /* to match two same operators use | */
loglist="Line no "+to_string(line)+": Token <LPAREN> Lexeme "+yytext+" found"+"\n"+"\n";
yyoutlog<<loglist;
}

")" { /* to match two same operators use | */
loglist="Line no "+to_string(line)+": Token <RPAREN> Lexeme "+yytext+" found"+"\n"+"\n";
yyoutlog<<loglist;
}

"{" { /* to match two same operators use | */
loglist="Line No "+to_string(line)+": Token <LCURL> Lexeme "+yytext+" found"+"\n"+"\n";
yyoutlog<<loglist;
}

"}" { /* to match two same operators use | */
loglist="Line No "+to_string(line)+": Token <RCURL> Lexeme "+yytext+" found"+"\n"+"\n";
yyoutlog<<loglist;
}

"[" { /* to match two same operators use | */
loglist="Line No "+to_string(line)+": Token <LTHIRD> Lexeme "+yytext+" found"+"\n"+"\n";
yyoutlog<<loglist;
}

"]" { /* to match two same operators use | */
loglist="Line No "+to_string(line)+": Token <RTHIRD> Lexeme "+yytext+" found"+"\n"+"\n";
yyoutlog<<loglist;
}

"," { /* to match two same operators use | */
loglist="Line No "+to_string(line)+": Token <COMMA> Lexeme "+yytext+" found"+"\n"+"\n";
yyoutlog<<loglist;
}

":" { /* to match two same operators use | */
loglist="Line No "+to_string(line)+": Token <COLON> Lexeme "+yytext+" found"+"\n"+"\n";
yyoutlog<<loglist;
}

";" { /* to match two same operators use | */
loglist="Line No "+to_string(line)+": Token <SEMICOLON> Lexeme "+yytext+" found"+"\n"+"\n";
yyoutlog<<loglist;
}

{id} {
loglist="Line no "+to_string(line)+": Token <ID> Lexeme "+yytext+" found"+"\n"+"\n";
yyoutlog<<loglist;
}


%%

int main(int argc, char *argv[])
{

if(argc != 2) //check if file name is given
{
cout<<"Please input file name"<<endl;
return 0;
}

yyin = fopen(argv[1], "r"); //the file to be read must be assigned to yyin

yyoutlog.open("20301085_20301144_Group11.txt", ios::trunc); // remember to rename the log file as mentioned in the spec

if(yyin == NULL) // file does not exist
{
// print error message and exit
}

yylex(); // start reading the input file in a loop

//print total number of lines found in the input file
yyoutlog<<"Total Lines "<< line;

yyoutlog.close();  // close the log file

fclose(yyin); // close the input file
}