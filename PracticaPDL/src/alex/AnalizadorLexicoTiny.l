package alex;

%%
%line
%class AnalizadorLexicoTiny
%type  UnidadLexica
%unicode

%{
  private ALexOperations ops;
  public String lexema() {return yytext();}
  public int fila() {return yyline+1;}
%}

%eofval{
  return ops.unidadEof();
%eofval}

%init{
  ops = new ALexOperations(this);
%init}

letra  = ([A-Z]|[a-z])
digitoPositivo = [1-9]
caracter = '[^\n]'
digito = ({digitoPositivo}|0)
parteEntera = {digitoPositivo}{digito}*
parteDecimal = {digito}* {digitoPositivo}
separador = [ \t\r\b\n]
comentario = #[^\n]*
int = int
bool = bool
char = char
true = true
false = false
float = float
vector = vector
creaVector = creaVector
size = size
while = while
do = do
then = then
call = call
if = if
else = else
proc = proc
fun = fun
return = return
struct = struct
typedef = typedef
enum = enum
barrabaja = _
identificador = {letra}({letra}|{digito}|{barrabaja})*
numeroEntero = [\+,\-]?({parteEntera}|0)
numeroReal = [\+,\-]?{parteEntera}\.{parteDecimal}
operadorSuma = \+
operadorResta = \-
operadorMultiplicacion = \*
operadorDivisionReal = /
operadorDivisionEntera = div
operadorModulo = \%
operadorAnd = &&
operadorOr = \|\|
operadorNot = !
operadorMenor = <
operadorMayor = >
operadorMenorIgual = <=
operadorMayorIgual = >=
operadorIgualIgual = ==
operadorDistinto = !=
operadorPunto = \.
llavesApertura = \{
llavesCierre = \}
barra = \|
corcheteApertura = \[
corcheteCierre = \]
parentesisApertura = \(
parentesisCierre = \)
igual = \=
coma  = \,
puntoYComa = \;
%%
{separador}               {}
{comentario}              {}
{int}                     {return ops.unidadInt();}
{bool}                    {return ops.unidadBool();}
{char}                    {return ops.unidadChar();}
{true}                    {return ops.unidadTrue();}
{false}                   {return ops.unidadFalse();}
{float}                   {return ops.unidadFloat();}
{vector}                  {return ops.unidadVector();}
{creaVector}              {return ops.unidadCreaVector();}
{size}                    {return ops.unidadSize();}
{while}                   {return ops.unidadWhile();}
{do}                      {return ops.unidadDo();}
{then}                    {return ops.unidadThen();}
{if}                      {return ops.unidadIf();}
{call}                    {return ops.unidadCall();}
{else}                    {return ops.unidadElse();}
{proc}                    {return ops.unidadProc();}
{fun}                     {return ops.unidadFun();}
{return}                  {return ops.unidadReturn();}
{struct}                  {return ops.unidadStruct();}
{typedef}                 {return ops.unidadTypedef();}
{enum}                    {return ops.unidadEnum();}
{identificador}           {return ops.unidadId();}
{numeroEntero}            {return ops.unidadEnt();}
{numeroReal}              {return ops.unidadReal();}
{caracter}                {return ops.unidadCaracter();}
{operadorSuma}            {return ops.unidadSuma();}
{operadorResta}           {return ops.unidadResta();}
{operadorMultiplicacion}  {return ops.unidadMul();}
{operadorDivisionReal}    {return ops.unidadDivReal();}
{operadorDivisionEntera}  {return ops.unidadDivEnt();}
{operadorModulo}          {return ops.unidadModulo();}
{operadorAnd}             {return ops.unidadAnd();}
{operadorOr}              {return ops.unidadOr();}
{operadorNot}             {return ops.unidadNot();}
{operadorMenor}           {return ops.unidadMenor();}
{operadorMayor}           {return ops.unidadMayor();}
{operadorMenorIgual}      {return ops.unidadMenorIgual();}
{operadorMayorIgual}      {return ops.unidadMayorIgual();}
{operadorIgualIgual}      {return ops.unidadIgualIgual();}
{operadorDistinto}        {return ops.unidadDistinto();}
{operadorPunto}           {return ops.unidadPunto();}
{llavesApertura}          {return ops.unidadLlavesAp();}
{llavesCierre}            {return ops.unidadLlavesCierre();}
{barra}                   {return ops.unidadBarra();}
{corcheteApertura}        {return ops.unidadCorcheteAp();}
{corcheteCierre}          {return ops.unidadCorcheteCierre();}
{parentesisApertura}      {return ops.unidadPAp();}
{parentesisCierre}        {return ops.unidadPCierre();} 
{igual}                   {return ops.unidadIgual();} 
{coma}                    {return ops.unidadComa();}
{puntoYComa}              {return ops.unidadPuntoYComa();}
[^]                       {ops.error();}  