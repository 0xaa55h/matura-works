#set text(font: "New Computer Modern", size: 12pt)
#set page(
  height: auto,
  margin: (
    left: 1cm,
    right: 1cm,
    top: 1cm,
    bottom: 1cm,
  ),
)
#import "@preview/zebraw:0.6.1": *
#show: zebraw

#align(center, [
  = Programování v C++ a C\#
  === Souhrn k maturitě
])

#outline(
  title: "Obsah",
)

= Základní řídící struktury

== Pojem algoritmus

*Algoritmus* je přesný návod (postup) jak řešit určitý problém. Jde o konečnou posloupnost jasně definovaných kroků, které vedou k vyřešení úlohy.

== Vlastnosti algoritmu

+ *Elementárnost* -- algoritmus se skládá z konečného počtu jednoduchých (elementárních) kroků
+ *Konečnost* (finitnost) -- algoritmus musí skončit v konečném počtu kroků
+ *Obecnost* -- algoritmus řeší celou třídu úloh, ne pouze jeden konkrétní případ
+ *Determinovanost* -- každý krok je jednoznačně definován, při opakovaném provedení se stejnými vstupními daty dostaneme stejné výsledky
+ *Rezultativnost* -- algoritmus vždy dospěje k výsledku

== Způsoby zápisu algoritmu

+ *Slovní popis* -- popis v přirozeném jazyce (čeština, angličtina)
+ *Vývojový diagram* -- grafické znázornění pomocí symbolů a šipek
+ *Strukturogram* (Nassi-Shneidermanův diagram) -- blokové schéma bez použití šipek
+ *Pseudokód* -- zápis podobný programovacímu jazyku, ale zjednodušený a srozumitelný
+ *Programovací jazyk* -- zápis v konkrétním programovacím jazyce (C++, C\#, Python...)

== Strukturované programování

Programovací paradigma, které klade důraz na:
- Přehlednost a čitelnost kódu
- Používání pouze tří základních řídicích struktur: *sekvence*, *selekce*, *iterace*
- Vyhýbání se příkazu GOTO
- Dekompozici problému na menší části (procedury, funkce)
- Jednodušší ladění a údržbu kódu

== Sekvence

*Sekvence* je základní řídicí struktura, kde se příkazy vykonávají postupně jeden za druhým v pořadí, jak jsou napsány.

```cpp
// C++
int a = 5;
int b = 10;
int soucet = a + b;
cout << soucet << endl;
```

```cs
// C#
int a = 5;
int b = 10;
int soucet = a + b;
Console.WriteLine(soucet);
```

== Selekce (větvení)

Umožňuje podmíněné vykonání příkazů na základě splnění podmínky.

=== Příkaz if

*C++:*
```cpp
if (podminka) {
    // kód, který se vykoná, když je podmínka splněna
}

if (podminka) {
    // kód pro splněnou podmínku
} else {
    // kód pro nesplněnou podmínku
}

if (podminka1) {
    // kód 1
} else if (podminka2) {
    // kód 2
} else {
    // kód 3
}
```

*C\#:*
```cs
if (podminka) {
    // kód, který se vykoná, když je podmínka splněna
}

if (podminka) {
    // kód pro splněnou podmínku
} else {
    // kód pro nesplněnou podmínku
}

if (podminka1) {
    // kód 1
} else if (podminka2) {
    // kód 2
} else {
    // kód 3
}
```

=== Příkaz switch

Používá se pro vícenásobné větvení na základě hodnoty výrazu.

*C++:*
```cpp
switch (promenna) {
    case hodnota1:
        // kód
        break;
    case hodnota2:
        // kód
        break;
    default:
        // kód pro ostatní případy
        break;
}
```

*C\#:*
```cs
switch (promenna) {
    case hodnota1:
        // kód
        break;
    case hodnota2:
        // kód
        break;
    default:
        // kód pro ostatní případy
        break;
}
```

== Iterace (cyklus)

Umožňuje opakované vykonávání bloku příkazů.

=== Cyklus while

Cyklus s podmínkou na začátku -- testuje podmínku před každou iterací.

*C++:*
```cpp
while (podminka) {
    // kód, který se opakuje, dokud je podmínka splněna
}
```

*C\#:*
```cs
while (podminka) {
    // kód, který se opakuje, dokud je podmínka splněna
}
```

=== Cyklus do-while

Cyklus s podmínkou na konci -- tělo cyklu se provede vždy alespoň jednou.

*C++:*
```cpp
do {
    // kód, který se vykoná alespoň jednou
} while (podminka);
```

*C\#:*
```cs
do {
    // kód, který se vykoná alespoň jednou
} while (podminka);
```

=== Cyklus for

Cyklus s řídicí proměnnou -- používá se, když známe počet opakování.

*C++:*
```cpp
for (int i = 0; i < 10; i++) {
    // kód, který se opakuje 10×
}
```

*C\#:*
```cs
for (int i = 0; i < 10; i++) {
    // kód, který se opakuje 10×
}
```

== Generování náhodných čísel

=== C++

```cpp
#include <cstdlib>  // pro rand() a srand()
#include <ctime>    // pro time()

// Inicializace generátoru (provést jednou na začátku programu)
srand(time(0));

// Generování náhodného čísla
int nahodneCislo = rand();  // 0 až RAND_MAX

// Náhodné číslo v rozsahu 0-99
int cislo = rand() % 100;

// Náhodné číslo v rozsahu 1-100
int cislo = rand() % 100 + 1;

// Náhodné číslo v rozsahu min-max
int cislo = rand() % (max - min + 1) + min;
```

=== C\#

```cs
// Vytvoření instance Random (provést jednou)
Random rnd = new Random();

// Generování náhodného čísla
int nahodneCislo = rnd.Next();  // nezáporné celé číslo

// Náhodné číslo 0-99
int cislo = rnd.Next(100);

// Náhodné číslo 1-100
int cislo = rnd.Next(1, 101);  // horní mez je exkluzivní

// Náhodné desetinné číslo 0.0-1.0
double des = rnd.NextDouble();
```

== Kolekce Controls v C\#

Kolekce `Controls` je vlastnost kontejnerových prvků (Form, Panel, GroupBox...) ve Windows Forms, která obsahuje všechny ovládací prvky (controls) umístěné v daném kontejneru.

=== Základní použití

```cs
// Přístup ke všem ovládacím prvkům formuláře
foreach (Control ctrl in this.Controls) {
    // Práce s jednotlivými prvky
}

// Přidání ovládacího prvku
Button btn = new Button();
btn.Text = "Nové tlačítko";
this.Controls.Add(btn);

// Odebrání ovládacího prvku
this.Controls.Remove(btn);

// Počet prvků v kolekci
int pocet = this.Controls.Count;
```

=== Přístup k prvkům podle typu

```cs
// Najít všechny TextBoxy
foreach (Control ctrl in this.Controls) {
    if (ctrl is TextBox) {
        TextBox tb = (TextBox)ctrl;
        tb.Clear();  // Vymazání obsahu
    }
}

// Pomocí LINQ
var textBoxy = this.Controls.OfType<TextBox>();
foreach (TextBox tb in textBoxy) {
    tb.Clear();
}
```

=== Přístup podle jména

```cs
// Najít prvek podle jména
Control ctrl = this.Controls["textBox1"];
if (ctrl != null && ctrl is TextBox) {
    TextBox tb = (TextBox)ctrl;
    tb.Text = "Nový text";
}

// Nebo pomocí Find
Control[] controls = this.Controls.Find("textBox1", true);
if (controls.Length > 0) {
    TextBox tb = (TextBox)controls[0];
}
```

=== Rekurzivní procházení

Pro práci s vnořenými kontejnery (Panel v Panelu atd.):

```cs
private void ProcházejVšechnyPrvky(Control kontejner) {
    foreach (Control ctrl in kontejner.Controls) {
        // Zpracování prvku
        Console.WriteLine(ctrl.Name);

        // Rekurzivní volání pro vnořené kontejnery
        if (ctrl.HasChildren) {
            ProcházejVšechnyPrvky(ctrl);
        }
    }
}

// Použití
ProcházejVšechnyPrvky(this);
```

= Jednoduché datové typy

== Deklarace datových typů a proměnných

*Proměnná* je pojmenované místo v paměti, kde se uchovává hodnota určitého datového typu.

*Deklarace* proměnné znamená sdělení překladači, jaký datový typ a název bude proměnná mít.

*Inicializace* proměnné znamená přiřazení počáteční hodnoty při deklaraci.

=== C++

```cpp
// Deklarace bez inicializace
int cislo;
double pi;

// Deklarace s inicializací
int vek = 25;
double pi = 3.14159;

// Více proměnných najednou
int a, b, c;
int x = 10, y = 20, z = 30;

// Konstanty (nelze měnit)
const int MAX = 100;
const double E = 2.71828;
```

=== C\#

```cs
// Deklarace bez inicializace
int cislo;
double pi;

// Deklarace s inicializací
int vek = 25;
double pi = 3.14159;

// Více proměnných najednou
int a, b, c;
int x = 10, y = 20, z = 30;

// Konstanty (nelze měnit)
const int MAX = 100;
const double E = 2.71828;

// Implicitně typované proměnné (var)
var jmeno = "Jan";  // string
var pocet = 42;     // int
```

== Celočíselné datové typy

Slouží k ukládání celých čísel (bez desetinné čárky).

=== C++

#table(
  columns: (auto, auto, auto, auto),
  align: left,
  [*Datový typ*], [*Velikost*], [*Rozsah*], [*Popis*],
  [`short`], [2 B], [-32 768 až 32 767], [Krátké celé číslo],
  [`int`], [4 B], [-2 147 483 648 až 2 147 483 647], [Celé číslo],
  [`long`], [4/8 B], [závislé na systému], [Dlouhé celé číslo],
  [`long long`], [8 B], [-9·10#super[18] až 9·10#super[18]], [Velmi dlouhé celé číslo],
  [`unsigned short`], [2 B], [0 až 65 535], [Neznaménkové krátké],
  [`unsigned int`], [4 B], [0 až 4 294 967 295], [Neznaménkové celé],
  [`unsigned long`], [4/8 B], [závislé na systému], [Neznaménkové dlouhé],
  [`unsigned long long`], [8 B], [0 až 1.8·10#super[19]], [Neznaménkové velmi dlouhé],
)

```cpp
short maleCislo = 100;
int cislo = 50000;
long velkeCislo = 1000000L;
long long obrovskeCislo = 9223372036854775807LL;

unsigned int nezaporneCislo = 4000000000U;
```

=== C\#

#table(
  columns: (auto, auto, auto, auto),
  align: left,
  [*Datový typ*], [*Velikost*], [*Rozsah*], [*Popis*],
  [`sbyte`], [1 B], [-128 až 127], [Znaménkový byte],
  [`byte`], [1 B], [0 až 255], [Neznaménkový byte],
  [`short`], [2 B], [-32 768 až 32 767], [Krátké celé číslo],
  [`ushort`], [2 B], [0 až 65 535], [Neznaménkové krátké],
  [`int`], [4 B], [-2 147 483 648 až 2 147 483 647], [Celé číslo],
  [`uint`], [4 B], [0 až 4 294 967 295], [Neznaménkové celé],
  [`long`], [8 B], [-9·10#super[18] až 9·10#super[18]], [Dlouhé celé číslo],
  [`ulong`], [8 B], [0 až 1.8·10#super[19]], [Neznaménkové dlouhé],
)

```cs
sbyte maleZnamenkove = -50;
byte maleByte = 200;
short kratke = 10000;
ushort kratkeNeznamenkove = 50000;
int cislo = 1000000;
uint neznamenkove = 3000000000;
long velke = 9000000000000000000L;
ulong velkeNeznamenkove = 18000000000000000000UL;
```

== Reálné datové typy

Slouží k ukládání čísel s desetinnou čárkou (plovoucí řádová čárka).

=== C++

#table(
  columns: (auto, auto, auto, auto),
  align: left,
  [*Datový typ*], [*Velikost*], [*Rozsah*], [*Přesnost*],
  [`float`], [4 B], [±3.4·10#super[±38]], [~7 číslic],
  [`double`], [8 B], [±1.7·10#super[±308]], [~15 číslic],
  [`long double`], [8-16 B], [závislé na systému], [~19 číslic],
)

```cpp
float pi = 3.14f;           // suffix 'f' pro float
double e = 2.71828;         // implicitně double
long double presne = 3.141592653589793238L;

// Vědecká notace
double velke = 1.5e10;      // 1.5 × 10^10
float male = 2.3e-5f;       // 2.3 × 10^-5
```

=== C\#

#table(
  columns: (auto, auto, auto, auto),
  align: left,
  [*Datový typ*], [*Velikost*], [*Rozsah*], [*Přesnost*],
  [`float`], [4 B], [±3.4·10#super[±38]], [~7 číslic],
  [`double`], [8 B], [±1.7·10#super[±308]], [~15-16 číslic],
  [`decimal`], [16 B], [±7.9·10#super[±28]], [28-29 číslic],
)

```cs
float pi = 3.14f;           // suffix 'f' pro float
double e = 2.71828;         // implicitně double
decimal cena = 19.99m;      // suffix 'm' pro decimal

// Vědecká notace
double velke = 1.5e10;      // 1.5 × 10^10
float male = 2.3e-5f;       // 2.3 × 10^-5
```

*Poznámka:* Typ `decimal` v C\# je vhodný pro finanční výpočty, kde je potřeba vysoká přesnost a správné zaokrouhlování.

== Logický datový typ

Slouží k ukládání pravdivostních hodnot (pravda/nepravda).

=== C++

```cpp
bool pravda = true;
bool nepravda = false;

// Výsledky porovnání
bool vetsi = (5 > 3);       // true
bool mensi = (10 < 5);      // false
bool rovno = (7 == 7);      // true

// Logické operace
bool a = true && false;     // AND (logický součin) -> false
bool b = true || false;     // OR (logický součet) -> true
bool c = !true;             // NOT (negace) -> false

// V podmínkách
if (pravda) {
    cout << "Podmínka je splněna" << endl;
}
```

=== C\#

```cs
bool pravda = true;
bool nepravda = false;

// Výsledky porovnání
bool vetsi = (5 > 3);       // true
bool mensi = (10 < 5);      // false
bool rovno = (7 == 7);      // true

// Logické operace
bool a = true && false;     // AND (logický součin) -> false
bool b = true || false;     // OR (logický součet) -> true
bool c = !true;             // NOT (negace) -> false

// V podmínkách
if (pravda) {
    Console.WriteLine("Podmínka je splněna");
}
```

== Datový typ char

Slouží k ukládání jednotlivých znaků.

=== C++

```cpp
char znak = 'A';
char cislo = '5';
char mezera = ' ';
char novyRadek = '\n';
char tabulator = '\t';

// Escape sekvence
char uvozovky = '\'';
char zpetneKositko = '\\';

// ASCII hodnoty
char a = 65;        // 'A'
int ascii = 'A';    // 65

// Práce se znaky
char velke = 'A';
char male = velke + 32;     // 'a' (v ASCII tabulce)

// Funkce pro práce se znaky (v <cctype>)
#include <cctype>

bool jePismeno = isalpha('A');      // true
bool jeCislice = isdigit('5');      // true
bool jeVelke = isupper('A');        // true
bool jeMale = islower('a');         // true

char naMale = tolower('A');         // 'a'
char naVelke = toupper('a');        // 'A'
```

=== C\#

```cs
char znak = 'A';
char cislo = '5';
char mezera = ' ';
char novyRadek = '\n';
char tabulator = '\t';

// Escape sekvence
char uvozovky = '\'';
char zpetneKositko = '\\';

// Unicode hodnoty
char a = (char)65;      // 'A'
int unicode = 'A';      // 65

// Lze použít i Unicode escape
char srdce = '\u2665';  // ♥
```

=== Třída Character v C\#

C\# poskytuje statickou třídu `Char` (nebo `Character` jako alias) s užitečnými metodami:

```cs
// Testovací metody
bool jePismeno = Char.IsLetter('A');        // true
bool jeCislice = Char.IsDigit('5');         // true
bool jeMezera = Char.IsWhiteSpace(' ');     // true
bool jeVelke = Char.IsUpper('A');           // true
bool jeMale = Char.IsLower('a');            // true
bool jePismenoCiCislo = Char.IsLetterOrDigit('A');  // true

// Konverzní metody
char naMale = Char.ToLower('A');            // 'a'
char naVelke = Char.ToUpper('a');           // 'A'

// Získání numerické hodnoty
int hodnota = Char.GetNumericValue('5');    // 5.0

// Porovnání znaků
int porovnani = Char.Compare('A', 'B');     // -1 (A < B)

// Příklad použití
char vstup = 'X';
if (Char.IsUpper(vstup)) {
    Console.WriteLine($"{vstup} je velké písmeno");
    char male = Char.ToLower(vstup);
    Console.WriteLine($"Malé písmeno: {male}");
}
```

= Funkce C++

== Pojem funkce

*Funkce* je pojmenovaný blok kódu, který provádí určitou úlohu. Funkce umožňují:
- *Znovupoužitelnost kódu* -- jednou napsaný kód lze volat vícekrát
- *Modularitu* -- rozdělení programu na menší, logické celky
- *Čitelnost* -- přehlednější a srozumitelnější kód
- *Údržbu* -- snadnější opravy a změny
- *Abstrakci* -- skrytí implementačních detailů
== Definice funkce

Funkce v C++ má dvě části: *deklaraci* (prototyp) a *implementaci* (tělo funkce).

=== Syntaxe

```cpp
// Deklarace (prototyp) – říká překladači, že funkce existuje
navratovyTyp nazevFunkce(typParametru1 parametr1, typParametru2 parametr2);

// Implementace (definice) – obsahuje kód funkce
navratovyTyp nazevFunkce(typParametru1 parametr1, typParametru2 parametr2) {
    // tělo funkce
    return hodnota;  // pokud návratový typ není void
}
```

=== Části funkce

+ *Návratový typ* -- typ hodnoty, kterou funkce vrací (`int`, `double`, `void`...)
+ *Název funkce* -- identifikátor funkce
+ *Seznam parametrů* -- vstupy funkce (může být prázdný)
+ *Tělo funkce* -- kód ohraničený složenými závorkami `{}`
+ *Příkaz return* -- vrací hodnotu (kromě funkcí typu `void`)
=== Příklady

```cpp
// Funkce bez parametrů a bez návratové hodnoty
void pozdrav() {
    cout << "Ahoj!" << endl;
}

// Funkce s parametry a návratovou hodnotou
int soucet(int a, int b) {
    return a + b;
}

// Funkce s více parametry
double objem(double delka, double sirka, double vyska) {
    return delka * sirka * vyska;
}

// Funkce vracející boolean
bool jeKladne(int cislo) {
    return cislo > 0;
}
```

== Umístění definice funkce

=== Před funkcí main()

```cpp
#include <iostream>
using namespace std;

// Funkce definována před main() – není potřeba prototyp
int soucet(int a, int b) {
    return a + b;
}

int main() {
    int vysledek = soucet(5, 3);
    cout << vysledek << endl;
    return 0;
}
```

=== Po funkci main() s prototypem

```cpp
#include <iostream>
using namespace std;

// Prototyp (deklarace) před main()
int soucet(int a, int b);

int main() {
    int vysledek = soucet(5, 3);
    cout << vysledek << endl;
    return 0;
}

// Implementace po main()
int soucet(int a, int b) {
    return a + b;
}
```

=== Hlavičkové soubory

Pro větší projekty se funkce rozdělují do samostatných souborů:

*matematika.h* (hlavičkový soubor -- deklarace):
```cpp
#ifndef MATEMATIKA_H
#define MATEMATIKA_H

int soucet(int a, int b);
int rozdil(int a, int b);
double prumer(int a, int b);

#endif
```

*matematika.cpp* (zdrojový soubor -- implementace):
```cpp
#include "matematika.h"

int soucet(int a, int b) {
    return a + b;
}

int rozdil(int a, int b) {
    return a - b;
}

double prumer(int a, int b) {
    return (a + b) / 2.0;
}
```

*main.cpp* (hlavní program):
```cpp
#include <iostream>
#include "matematika.h"
using namespace std;

int main() {
    cout << soucet(10, 5) << endl;      // 15
    cout << rozdil(10, 5) << endl;      // 5
    cout << prumer(10, 5) << endl;      // 7.5
    return 0;
}
```

== Volání funkce

*Volání funkce* znamená provedení (spuštění) kódu, který je v těle funkce definován.

```cpp
int soucet(int a, int b) {    // a, b jsou FORMÁLNÍ parametry
    return a + b;
}

int main() {
    int x = 10, y = 20;
    int vysledek = soucet(x, y);    // x, y jsou SKUTEČNÉ parametry
    // nebo přímo:
    int vysledek2 = soucet(5, 8);   // 5, 8 jsou SKUTEČNÉ parametry
    return 0;
}
```

=== Formální parametry

- Parametry v *definici* funkce
- Specifikují typ a název vstupních hodnot
- Existují pouze během provádění funkce
- Fungují jako lokální proměnné

=== Skutečné parametry (argumenty)

- Hodnoty předané při *volání* funkce
- Mohou být: konstanty, proměnné, výrazy
- Musí odpovídat typem formálním parametrům
- Počet a pořadí musí souhlasit

```cpp
double mocnina(double zaklad, int exponent) {
    double vysledek = 1;
    for (int i = 0; i < exponent; i++) {
        vysledek *= zaklad;
    }
    return vysledek;
}

int main() {
    // Různé způsoby volání
    double a = mocnina(2.0, 3);         // s proměnnými
    double b = mocnina(5, 2);           // s konstantami
    double c = mocnina(1.5, 2 + 2);     // s výrazem
    return 0;
}
```

== Lokální a globální proměnné

=== Lokální proměnné

- Deklarované *uvnitř* funkce nebo bloku
- Existují pouze během provádění funkce
- Každé volání funkce vytváří novou instanci
- Po ukončení funkce jsou zničeny
- Mají přednost před globálními proměnnými se stejným názvem

```cpp
void funkce() {
    int lokalniPromenna = 10;  // lokální proměnná
    // použitelná jen v této funkci
}

int main() {
    int x = 5;  // lokální v main()
    funkce();
    // zde nelze použít lokalniPromenna ani x z funkce()
    return 0;
}
```

=== Globální proměnné

- Deklarované *mimo* všechny funkce
- Dostupné ve všech funkcích v programu
- Existují po celou dobu běhu programu
- Uchovávají hodnotu mezi voláními funkcí
- *Nedoporučuje se nadužívat* – horší čitelnost a údržba

```cpp
#include <iostream>
using namespace std;

int globalniPromenna = 100;  // globální proměnná

void funkce1() {
    cout << globalniPromenna << endl;  // přístup k globální
    globalniPromenna = 200;             // změna globální
}

void funkce2() {
    int globalniPromenna = 50;  // lokální – zastíní globální
    cout << globalniPromenna << endl;        // vypíše 50
    cout << ::globalniPromenna << endl;      // :: přístup ke globální
}

int main() {
    funkce1();  // vypíše 100, změní na 200
    funkce1();  // vypíše 200
    funkce2();  // vypíše 50, pak 200
    return 0;
}
```

== Typy parametrů funkcí

=== Předávání hodnotou (by value)

- Standardní způsob předávání parametrů
- Vytvoří se *kopie* skutečného parametru
- Změny uvnitř funkce neovlivní původní proměnnou
- Vhodné pro malé datové typy

```cpp
void zmena(int x) {
    x = 100;  // změní pouze lokální kopii
}

int main() {
    int a = 5;
    zmena(a);
    cout << a << endl;  // vypíše 5 (původní hodnota)
    return 0;
}
```

=== Předávání referencí (by reference)

- Používá se symbol `&`
- Nepředává se kopie, ale *odkaz* na originální proměnnou
- Změny uvnitř funkce *ovlivní* původní proměnnou
- Efektivnější pro velké datové struktury
- Umožňuje vracet více hodnot

```cpp
void zmena(int &x) {  // & označuje referenci
    x = 100;  // změní původní proměnnou
}

void prohod(int &a, int &b) {
    int temp = a;
    a = b;
    b = temp;
}

int main() {
    int a = 5;
    zmena(a);
    cout << a << endl;  // vypíše 100 (změněná hodnota)

    int x = 10, y = 20;
    prohod(x, y);
    cout << x << ", " << y << endl;  // vypíše 20, 10
    return 0;
}
```

=== Předávání ukazatelem (by pointer)

- Používá se symbol `*` pro typ a `&` pro získání adresy
- Předává se *adresa* proměnné v paměti
- Funkce pracuje s adresou pomocí operátoru dereference `*`
- Starší způsob, reference jsou modernější

```cpp
void zmena(int *x) {  // ukazatel na int
    *x = 100;  // změna hodnoty na adrese
}

int main() {
    int a = 5;
    zmena(&a);  // předání adresy proměnné a
    cout << a << endl;  // vypíše 100
    return 0;
}
```

=== Konstantní parametry

- Používá se klíčové slovo `const`
- Zabrání změně hodnoty parametru
- Užitečné pro velké objekty předávané referencí

```cpp
void vypis(const int &x) {  // konstantní reference
    cout << x << endl;
    // x = 10;  // CHYBA – nelze měnit const parametr
}

double obvod(const double pi, const double r) {
    return 2 * pi * r;
    // pi = 3;  // CHYBA – nelze měnit
}
```

=== Výchozí hodnoty parametrů

- Parametry mohou mít výchozí hodnoty
- Výchozí hodnoty se zadávají v deklaraci (prototypu)
- Parametry s výchozí hodnotou musí být na konci seznamu

```cpp
// V prototypu nebo definici
void tiskni(string text, int pocet = 1) {
    for (int i = 0; i < pocet; i++) {
        cout << text << endl;
    }
}

int main() {
    tiskni("Ahoj");        // použije výchozí pocet = 1
    tiskni("Ahoj", 3);     // použije pocet = 3
    return 0;
}
```

== Přetěžování funkcí (Function Overloading)

*Přetěžování funkcí* umožňuje definovat více funkcí se *stejným názvem*, ale s *různými parametry*.

=== Pravidla přetěžování

Funkce se liší:
+ *Počtem parametrů*
+ *Typy parametrů*
+ *Pořadím typů parametrů*

Funkce se *neliší* pouze návratovým typem!

=== Příklady přetěžování

```cpp
// Různý počet parametrů
int soucet(int a, int b) {
    return a + b;
}

int soucet(int a, int b, int c) {
    return a + b + c;
}

// Různé typy parametrů
double soucet(double a, double b) {
    return a + b;
}

string soucet(string a, string b) {
    return a + b;  // spojení řetězců
}

// Použití
int main() {
    cout << soucet(5, 3) << endl;           // volá int, int
    cout << soucet(5, 3, 2) << endl;        // volá int, int, int
    cout << soucet(2.5, 3.7) << endl;       // volá double, double
    cout << soucet("Ahoj ", "svete") << endl; // volá string, string
    return 0;
}
```

=== Praktický příklad – tisk různých typů

```cpp
#include <iostream>
using namespace std;

void vypis(int x) {
    cout << "Celé číslo: " << x << endl;
}

void vypis(double x) {
    cout << "Reálné číslo: " << x << endl;
}

void vypis(string x) {
    cout << "Text: " << x << endl;
}

void vypis(int x, int y) {
    cout << "Dva integery: " << x << ", " << y << endl;
}

int main() {
    vypis(42);              // volá vypis(int)
    vypis(3.14);            // volá vypis(double)
    vypis("Hello");         // volá vypis(string)
    vypis(10, 20);          // volá vypis(int, int)
    return 0;
}
```

=== Výhody přetěžování

+ Jednoduché rozhraní -- stejný název pro podobné operace
+ Čitelnější kód -- není nutné vymýšlet různé názvy
+ Intuitivní použití -- programátor nemusí pamatovat různé názvy
+ Polymorfismus -- základ objektově orientovaného programování

= Metody C\#

== Pojem metoda

*Metoda* je pojmenovaný blok kódu, který provádí specifickou úlohu. V C\# jsou metody vždy součástí třídy nebo struktury.

Metody v C\# poskytují:
- *Znovupoužitelnost* -- stejný kód lze volat opakovaně
- *Organizaci* -- logické seskupení funkcionality
- *Zapouzdření* -- skrytí implementačních detailů
- *Abstrakci* -- zjednodušení složitých operací
- *Modularitu* -- rozdělení programu na menší části

*Rozdíl mezi metodou a funkcí:*
- V C++ mluvíme o *funkcích*
- V C\# mluvíme o *metodách* (jsou vždy součástí třídy)
- Princip je stejný, terminologie se liší

== Deklarace a implementace metody

=== Syntaxe

```cs
// Základní struktura metody
modifikatorPristupu navratovyTyp NazevMetody(typParametru1 parametr1, typParametru2 parametr2) {
    // tělo metody
    return hodnota;  // pokud návratový typ není void
}
```

=== Části metody

+ *Modifikátor přístupu* -- `public`, `private`, `protected`, `internal`
+ *Návratový typ* -- typ hodnoty, kterou metoda vrací (`int`, `string`, `void`...)
+ *Název metody* -- identifikátor metody (PascalCase v C\#)
+ *Seznam parametrů* -- vstupy metody (může být prázdný)
+ *Tělo metody* -- kód ohraničený složenými závorkami
+ *Příkaz return* -- vrací hodnotu volajícímu kódu

=== Příklady základních metod

```cs
class Program {
    // Metoda bez parametrů a bez návratové hodnoty
    static void Pozdrav() {
        Console.WriteLine("Ahoj!");
    }

    // Metoda s parametry a návratovou hodnotou
    static int Soucet(int a, int b) {
        return a + b;
    }

    // Metoda s více parametry
    static double Objem(double delka, double sirka, double vyska) {
        return delka * sirka * vyska;
    }

    // Metoda vracející boolean
    static bool JeKladne(int cislo) {
        return cislo > 0;
    }

    // Metoda vracející string
    static string ZiskejPozdrav(string jmeno) {
        return $"Ahoj, {jmeno}!";
    }
}
```

=== Příkaz return

Příkaz `return` má dva účely:

+ *Ukončí vykonávání metody* -- žádný další kód po return se neprovede
+ *Vrátí hodnotu* -- pokud metoda není typu `void`

```cs
static int AbsolutniHodnota(int cislo) {
    if (cislo < 0) {
        return -cislo;  // ukončí metodu zde
    }
    return cislo;  // jinak vrátí původní hodnotu
}

static void VypisHodnotu(int x) {
    if (x < 0) {
        Console.WriteLine("Záporné číslo");
        return;  // předčasné ukončení (void metoda)
    }
    Console.WriteLine($"Kladné číslo: {x}");
}
```

== Volání metod

=== Statické metody

Statické metody se volají přes název třídy nebo přímo (pokud jsou ve stejné třídě):

```cs
class Matematika {
    static int Soucet(int a, int b) {
        return a + b;
    }

    static void Main() {
        // Volání metody ve stejné třídě
        int vysledek = Soucet(5, 3);

        // Volání metody z jiné třídy
        int vysledek2 = Matematika.Soucet(10, 20);
    }
}
```

=== Instance metody (nestatické)

Nestatické metody vyžadují instanci třídy:

```cs
class Kalkulacka {
    public int Soucet(int a, int b) {
        return a + b;
    }
}

class Program {
    static void Main() {
        Kalkulacka calc = new Kalkulacka();
        int vysledek = calc.Soucet(5, 3);  // volání přes instanci
    }
}
```

=== Různé způsoby volání

```cs
class Demo {
    static int Mocnina(int zaklad, int exponent) {
        int vysledek = 1;
        for (int i = 0; i < exponent; i++) {
            vysledek *= zaklad;
        }
        return vysledek;
    }

    static void Main() {
        // S proměnnými
        int x = 2, y = 3;
        int a = Mocnina(x, y);

        // S konstantami
        int b = Mocnina(5, 2);

        // S výrazem
        int c = Mocnina(3, 1 + 1);

        // Vnořené volání
        int d = Mocnina(Mocnina(2, 2), 2);  // (2^2)^2 = 16

        // Výsledek jako argument
        Console.WriteLine(Mocnina(2, 5));
    }
}
```

== Formální a skutečné parametry

=== Formální parametry

- Parametry v *definici* metody
- Definují typ a název vstupních hodnot
- Fungují jako lokální proměnné uvnitř metody
- Existují pouze během provádění metody

=== Skutečné parametry (argumenty)

- Hodnoty předané při *volání* metody
- Mohou být: literály, proměnné, výrazy
- Musí odpovídat typem a počtem formálním parametrům
- Pořadí musí souhlasit (nebo použít pojmenované argumenty)

```cs
static double VypocetCeny(double cena, double dph, double sleva) {
    // cena, dph, sleva jsou FORMÁLNÍ parametry
    return cena * (1 + dph) * (1 - sleva);
}

static void Main() {
    double zakladniCena = 1000;
    double sazba = 0.21;
    double slevaProcent = 0.1;

    // zakladniCena, sazba, slevaProcent jsou SKUTEČNÉ parametry
    double konecnaCena = VypocetCeny(zakladniCena, sazba, slevaProcent);

    // Také lze použít literály jako skutečné parametry
    double cena2 = VypocetCeny(500, 0.21, 0.05);
}
```

=== Pojmenované argumenty

C\# umožňuje předávat argumenty podle názvu:

```cs
static void VytvorUzivatele(string jmeno, int vek, string mesto) {
    Console.WriteLine($"{jmeno}, {vek} let, {mesto}");
}

static void Main() {
    // Standardní pořadí
    VytvorUzivatele("Jan", 25, "Praha");

    // Pojmenované argumenty (libovolné pořadí)
    VytvorUzivatele(mesto: "Brno", jmeno: "Petra", vek: 30);

    // Kombinace
    VytvorUzivatele("Karel", vek: 28, mesto: "Ostrava");
}
```

=== Volitelné parametry

Parametry mohou mít výchozí hodnoty:

```cs
static void Pozdrav(string jmeno, string zprava = "Ahoj") {
    Console.WriteLine($"{zprava}, {jmeno}!");
}

static void Main() {
    Pozdrav("Jan");                    // použije výchozí "Ahoj"
    Pozdrav("Petra", "Dobrý den");     // použije "Dobrý den"
}
```

== Modifikátory parametrů

C\# nabízí různé způsoby předávání parametrů pomocí modifikátorů.

=== Předávání hodnotou (výchozí)

- Standardní způsob bez modifikátoru
- Vytvoří se *kopie* hodnoty
- Změny uvnitř metody *neovlivní* původní proměnnou
- Vhodné pro hodnotové typy (int, double, bool...)

```cs
static void Zmena(int x) {
    x = 100;  // změní pouze lokální kopii
    Console.WriteLine($"Uvnitř metody: {x}");
}

static void Main() {
    int a = 5;
    Zmena(a);
    Console.WriteLine($"Po volání: {a}");  // stále 5
}
```

=== Modifikátor ref

- Předává *referenci* na původní proměnnou
- Změny uvnitř metody *ovlivní* původní proměnnou
- Proměnná *musí být inicializována* před voláním
- Při volání musí být použito klíčové slovo `ref`

```cs
static void Zmena(ref int x) {
    x = 100;  // změní původní proměnnou
}

static void Prohod(ref int a, ref int b) {
    int temp = a;
    a = b;
    b = temp;
}

static void Main() {
    int cislo = 5;
    Zmena(ref cislo);
    Console.WriteLine(cislo);  // vypíše 100

    int x = 10, y = 20;
    Prohod(ref x, ref y);
    Console.WriteLine($"{x}, {y}");  // vypíše 20, 10
}
```

=== Modifikátor out

- Podobný jako `ref`, ale proměnná *nemusí být inicializována*
- Metoda *musí přiřadit* hodnotu parametru před ukončením
- Vhodné pro vracení více hodnot z metody
- Při volání musí být použito klíčové slovo `out`

```cs
static bool TryParse(string text, out int vysledek) {
    try {
        vysledek = int.Parse(text);
        return true;
    } catch {
        vysledek = 0;
        return false;
    }
}

static void VratViceHodnot(int x, out int dvojnasobek, out int trojnasobek) {
    dvojnasobek = x * 2;
    trojnasobek = x * 3;
}

static void Main() {
    // out - nemusí být inicializováno
    int hodnota;
    if (TryParse("123", out hodnota)) {
        Console.WriteLine($"Převod OK: {hodnota}");
    }

    // C# 7.0+ inline deklarace
    if (TryParse("456", out int cislo)) {
        Console.WriteLine($"Převod OK: {cislo}");
    }

    // Vracení více hodnot
    VratViceHodnot(5, out int dva, out int tri);
    Console.WriteLine($"2x: {dva}, 3x: {tri}");  // 10, 15
}
```

=== Modifikátor in (C\# 7.2+)

- Předává referenci, ale *pouze pro čtení*
- Optimalizace pro velké struktury
- Zabrání změně hodnoty uvnitř metody
- Volitelné použití klíčového slova při volání

```cs
static double VypocetVzdalenosti(in Vector3 bod1, in Vector3 bod2) {
    // bod1 a bod2 nelze měnit
    double dx = bod2.X - bod1.X;
    double dy = bod2.Y - bod1.Y;
    double dz = bod2.Z - bod1.Z;
    return Math.Sqrt(dx * dx + dy * dy + dz * dz);
}
```

=== Modifikátor params

- Umožňuje předat *proměnný počet* argumentů
- Argumenty jsou předány jako pole
- Musí být poslední parametr v seznamu
- Lze volat bez argumentů (prázdné pole)

```cs
static int Soucet(params int[] cisla) {
    int vysledek = 0;
    foreach (int cislo in cisla) {
        vysledek += cislo;
    }
    return vysledek;
}

static void Main() {
    Console.WriteLine(Soucet());                    // 0
    Console.WriteLine(Soucet(5));                   // 5
    Console.WriteLine(Soucet(1, 2, 3));            // 6
    Console.WriteLine(Soucet(10, 20, 30, 40, 50)); // 150

    // Nebo předat pole přímo
    int[] pole = { 1, 2, 3, 4 };
    Console.WriteLine(Soucet(pole));                // 10
}
```

=== Porovnání modifikátorů

#table(
  columns: (auto, auto, auto, auto),
  align: left,
  [*Modifikátor*], [*Inicializace před*], [*Přiřazení v metodě*], [*Může měnit*],
  [(žádný)], [Ne], [Ne], [Ne (kopie)],
  [`ref`], [Ano], [Ne], [Ano],
  [`out`], [Ne], [Ano (povinné)], [Ano],
  [`in`], [Ano], [Ne], [Ne (readonly)],
  [`params`], [Ne], [Ne], [Ano (prvky pole)],
)

== Přetěžování metod (Method Overloading)

*Přetěžování metod* umožňuje definovat více metod se *stejným názvem*, ale s *různými parametry*.

=== Pravidla přetěžování

Metody se mohou lišit:
+ *Počtem parametrů*
+ *Typy parametrů*
+ *Pořadím typů parametrů*
+ *Modifikátory parametrů* (ref, out, in)

Metody se *neliší* pouze:
- Návratovým typem
- Názvy parametrů
- Modifikátory přístupu

=== Příklady přetěžování

```cs
class Kalkulacka {
    // Různý počet parametrů
    public int Soucet(int a, int b) {
        return a + b;
    }

    public int Soucet(int a, int b, int c) {
        return a + b + c;
    }

    public int Soucet(int a, int b, int c, int d) {
        return a + b + c + d;
    }

    // Různé typy parametrů
    public double Soucet(double a, double b) {
        return a + b;
    }

    public string Soucet(string a, string b) {
        return a + b;  // spojení řetězců
    }

    // Různé pořadí typů
    public void Vypis(int cislo, string text) {
        Console.WriteLine($"Číslo: {cislo}, Text: {text}");
    }

    public void Vypis(string text, int cislo) {
        Console.WriteLine($"Text: {text}, Číslo: {cislo}");
    }
}
```

=== Přetěžování s modifikátory

```cs
class Demo {
    // Standardní předání hodnotou
    public void Metoda(int x) {
        Console.WriteLine("Předání hodnotou");
    }

    // Přetížení s ref
    public void Metoda(ref int x) {
        Console.WriteLine("Předání referencí (ref)");
    }

    // Přetížení s out
    public void Metoda(out int x) {
        x = 10;
        Console.WriteLine("Předání výstupem (out)");
    }
}
```

=== Praktický příklad

```cs
class FormatovaniTextu {
    // Základní metoda
    public string Formatuj(string text) {
        return text.ToUpper();
    }

    // S délkou
    public string Formatuj(string text, int maxDelka) {
        string vysledek = text.ToUpper();
        if (vysledek.Length > maxDelka) {
            vysledek = vysledek.Substring(0, maxDelka) + "...";
        }
        return vysledek;
    }

    // S délkou a prefixem
    public string Formatuj(string text, int maxDelka, string prefix) {
        string vysledek = text.ToUpper();
        if (vysledek.Length > maxDelka) {
            vysledek = vysledek.Substring(0, maxDelka) + "...";
        }
        return prefix + vysledek;
    }

    static void Main() {
        var fmt = new FormatovaniTextu();

        Console.WriteLine(fmt.Formatuj("ahoj"));              // AHOJ
        Console.WriteLine(fmt.Formatuj("ahoj světe", 6));     // AHOJ S...
        Console.WriteLine(fmt.Formatuj("ahoj", 10, ">>> "));  // >>> AHOJ
    }
}
```

=== Výhody přetěžování

+ *Flexibilita* -- jedna metoda pro různé situace
+ *Čitelnost* -- není nutné pamatovat různé názvy
+ *Intuitivnost* -- programátor může volat stejnou metodu různými způsoby
+ *Konzistence* -- jednotné rozhraní pro podobné operace
+ *Polymorfismus* -- základ OOP v C\#

= Datový typ pole

== Jednorozměrné pole

*Pole* (array) je datová struktura, která uchovává *pevný počet* prvků *stejného datového typu* uspořádaných v *lineární posloupnosti*.

=== Vlastnosti pole

- *Pevná velikost* -- po vytvoření nelze změnit
- *Homogenní* -- všechny prvky mají stejný datový typ
- *Indexované* -- přístup k prvkům pomocí indexu (číselné pozice)
- *Nultý index* -- první prvek má index 0
- *Souvislá paměť* -- prvky jsou uloženy vedle sebe v paměti

=== Výhody polí

+ Rychlý přístup k prvkům (konstantní čas O(1))
+ Efektivní využití paměti
+ Jednoduché procházení prvků
+ Vhodné pro ukládání sekvencí dat

=== Nevýhody polí

- Pevná velikost -- nelze dynamicky měnit
- Vkládání a mazání prvků je neefektivní
- Plýtvání pamětí, pokud není celé pole využito

== Deklarace a inicializace pole

=== C++ -- pole

*Deklarace pole:*
```cpp
typPrvku nazevPole[velikost];
```

*Příklady deklarace a inicializace:*
```cpp
// Deklarace bez inicializace (prvky mají náhodné hodnoty)
int cisla[5];

// Deklarace s inicializací – explicitní velikost
int cisla[5] = {10, 20, 30, 40, 50};

// Deklarace s inicializací – implicitní velikost
int cisla[] = {10, 20, 30, 40, 50};  // velikost 5

// Částečná inicializace (zbytek vyplněn nulami)
int cisla[5] = {10, 20};  // {10, 20, 0, 0, 0}

// Inicializace všech prvků na nulu
int cisla[5] = {};  // {0, 0, 0, 0, 0}

// Pole různých typů
double teploty[7];
char znaky[10];
bool stavy[3] = {true, false, true};
string jmena[4] = {"Jan", "Petra", "Karel", "Anna"};
```

*Dynamické pole (C++):*
```cpp
// Dynamická alokace pomocí new
int velikost = 10;
int* pole = new int[velikost];

// Použití pole
pole[0] = 5;
pole[1] = 10;

// Uvolnění paměti
delete[] pole;
```

*Zjištění velikosti pole:*
```cpp
int cisla[] = {1, 2, 3, 4, 5};
int velikost = sizeof(cisla) / sizeof(cisla[0]);  // 5
```

=== C\# -- pole

*Deklarace pole:*
```cs
typPrvku[] nazevPole;
```

*Příklady deklarace a inicializace:*
```cs
// Deklarace bez inicializace
int[] cisla;

// Vytvoření pole s danou velikostí (prvky inicializovány na 0)
int[] cisla = new int[5];  // {0, 0, 0, 0, 0}

// Deklarace a inicializace s hodnotami
int[] cisla = new int[] {10, 20, 30, 40, 50};

// Zkrácený zápis (typ lze vynechat)
int[] cisla = {10, 20, 30, 40, 50};

// Pole různých typů
double[] teploty = new double[7];
char[] znaky = {'A', 'B', 'C'};
bool[] stavy = {true, false, true};
string[] jmena = {"Jan", "Petra", "Karel", "Anna"};

// Implicitně typované pole
var cisla = new[] {1, 2, 3, 4, 5};  // typ int[]
```

*Zjištění velikosti pole:*
```cs
int[] cisla = {1, 2, 3, 4, 5};
int velikost = cisla.Length;  // 5
```

== Přístup k jednotlivým prvkům pole

Prvky pole jsou indexované od 0. K prvkům přistupujeme pomocí hranatých závorek `[]`.

=== C++ -- přístup k prvkům

```cpp
int cisla[5] = {10, 20, 30, 40, 50};

// Čtení hodnot
int prvni = cisla[0];     // 10
int druhy = cisla[1];     // 20
int posledni = cisla[4];  // 50

// Zápis hodnot
cisla[0] = 100;
cisla[2] = 300;

// Výpis všech prvků pomocí cyklu for
for (int i = 0; i < 5; i++) {
    cout << cisla[i] << " ";
}

// Range-based for loop (C++11)
for (int cislo : cisla) {
    cout << cislo << " ";
}

// Pozor na přístup mimo rozsah (undefined behavior)
// int x = cisla[10];  // NEBEZPEČNÉ!
```

=== C\# -- přístup k prvkům

```cs
int[] cisla = {10, 20, 30, 40, 50};

// Čtení hodnot
int prvni = cisla[0];     // 10
int druhy = cisla[1];     // 20
int posledni = cisla[4];  // 50

// Zápis hodnot
cisla[0] = 100;
cisla[2] = 300;

// Výpis všech prvků pomocí cyklu for
for (int i = 0; i < cisla.Length; i++) {
    Console.Write(cisla[i] + " ");
}

// Foreach cyklus
foreach (int cislo in cisla) {
    Console.Write(cislo + " ");
}

// Přístup mimo rozsah vyvolá výjimku
// int x = cisla[10];  // IndexOutOfRangeException
```

=== Indexy od konce (C\# 8.0+)

```cs
int[] cisla = {10, 20, 30, 40, 50};

// Index od konce pomocí operátoru ^
int posledni = cisla[^1];     // 50 (poslední prvek)
int predposledni = cisla[^2]; // 40 (předposlední prvek)

// Rozsahy (ranges)
int[] cast = cisla[1..4];     // {20, 30, 40}
int[] prvniTri = cisla[..3];  // {10, 20, 30}
int[] posledniDva = cisla[^2..]; // {40, 50}
```

=== Praktické příklady

*Součet prvků pole:*
```cpp
// C++
int soucet = 0;
for (int i = 0; i < velikost; i++) {
    soucet += cisla[i];
}
```

```cs
// C#
int soucet = 0;
foreach (int cislo in cisla) {
    soucet += cislo;
}
```

*Nalezení maxima:*
```cpp
// C++
int max = cisla[0];
for (int i = 1; i < velikost; i++) {
    if (cisla[i] > max) {
        max = cisla[i];
    }
}
```

```cs
// C#
int max = cisla[0];
for (int i = 1; i < cisla.Length; i++) {
    if (cisla[i] > max) {
        max = cisla[i];
    }
}
```

== Pole jako parametr funkce

=== C++ -- pole jako parametr

Pole se v C++ předává jako *ukazatel* na první prvek. Velikost pole se obvykle předává jako samostatný parametr.

```cpp
// Pole jako parametr – předává se ukazatel
void vypisPole(int pole[], int velikost) {
    for (int i = 0; i < velikost; i++) {
        cout << pole[i] << " ";
    }
    cout << endl;
}

// Alternativní zápis s ukazatelem
void vypisPole(int* pole, int velikost) {
    for (int i = 0; i < velikost; i++) {
        cout << pole[i] << " ";
    }
    cout << endl;
}

// Změna hodnot v poli
void nasobDvema(int pole[], int velikost) {
    for (int i = 0; i < velikost; i++) {
        pole[i] *= 2;  // změní původní pole
    }
}

// Konstantní pole (nelze měnit)
void vypisKonstantniPole(const int pole[], int velikost) {
    for (int i = 0; i < velikost; i++) {
        cout << pole[i] << " ";
        // pole[i] = 10;  // CHYBA – nelze měnit
    }
}

// Použití
int main() {
    int cisla[] = {1, 2, 3, 4, 5};
    int velikost = sizeof(cisla) / sizeof(cisla[0]);

    vypisPole(cisla, velikost);
    nasobDvema(cisla, velikost);
    vypisPole(cisla, velikost);  // {2, 4, 6, 8, 10}

    return 0;
}
```

*Vrácení pole z funkce:*
```cpp
// Dynamicky alokované pole
int* vytvorPole(int velikost) {
    int* pole = new int[velikost];
    for (int i = 0; i < velikost; i++) {
        pole[i] = i + 1;
    }
    return pole;
}

int main() {
    int* pole = vytvorPole(5);
    // použití pole...
    delete[] pole;  // nutné uvolnit paměť!
    return 0;
}
```

=== C\# -- pole jako parametr

V C\# se pole předává jako *reference*, což znamená, že změny v metodě ovlivní původní pole.

```cs
// Pole jako parametr
static void VypisPole(int[] pole) {
    foreach (int cislo in pole) {
        Console.Write(cislo + " ");
    }
    Console.WriteLine();
}

// Změna hodnot v poli
static void NasobDvema(int[] pole) {
    for (int i = 0; i < pole.Length; i++) {
        pole[i] *= 2;  // změní původní pole
    }
}

// Pole s params – proměnný počet argumentů
static int Soucet(params int[] cisla) {
    int vysledek = 0;
    foreach (int cislo in cisla) {
        vysledek += cislo;
    }
    return vysledek;
}

// Vrácení pole z metody
static int[] VytvorPole(int velikost) {
    int[] pole = new int[velikost];
    for (int i = 0; i < velikost; i++) {
        pole[i] = i + 1;
    }
    return pole;
}

// Použití
static void Main() {
    int[] cisla = {1, 2, 3, 4, 5};

    VypisPole(cisla);           // 1 2 3 4 5
    NasobDvema(cisla);
    VypisPole(cisla);           // 2 4 6 8 10

    // params – různé způsoby volání
    Console.WriteLine(Soucet(1, 2, 3));         // 6
    Console.WriteLine(Soucet(10, 20, 30, 40));  // 100

    // Vrácení pole
    int[] novePole = VytvorPole(5);
    VypisPole(novePole);        // 1 2 3 4 5
}
```

== Statické metody třídy Array (C\#)

Třída `System.Array` poskytuje statické metody pro práci s poli.

=== Řazení pole

```cs
int[] cisla = {5, 2, 8, 1, 9};

// Seřazení vzestupně
Array.Sort(cisla);  // {1, 2, 5, 8, 9}

// Obrácení pořadí
Array.Reverse(cisla);  // {9, 8, 5, 2, 1}

// Řazení stringů
string[] jmena = {"Karel", "Anna", "Petr", "Eva"};
Array.Sort(jmena);  // {Anna, Eva, Karel, Petr}
```

=== Vyhledávání v poli

```cs
int[] cisla = {1, 2, 5, 8, 9};

// Binární vyhledávání (pole musí být seřazené!)
int index = Array.BinarySearch(cisla, 5);  // 2

if (index >= 0) {
    Console.WriteLine($"Nalezeno na indexu {index}");
} else {
    Console.WriteLine("Nenalezeno");
}

// IndexOf – najde první výskyt
int[] cisla2 = {10, 20, 30, 20, 40};
int pozice = Array.IndexOf(cisla2, 20);  // 1

// LastIndexOf – najde poslední výskyt
int posledni = Array.LastIndexOf(cisla2, 20);  // 3
```

=== Kopírování pole

```cs
int[] puvodni = {1, 2, 3, 4, 5};

// Kopírování celého pole
int[] kopie = new int[5];
Array.Copy(puvodni, kopie, 5);

// Kopírování části pole
int[] cast = new int[3];
Array.Copy(puvodni, 1, cast, 0, 3);  // {2, 3, 4}

// Clone – vytvoří mělkou kopii
int[] klon = (int[])puvodni.Clone();
```

=== Vyplnění pole

```cs
int[] cisla = new int[5];

// Vyplnění celého pole jednou hodnotou
Array.Fill(cisla, 10);  // {10, 10, 10, 10, 10}

// Vyplnění části pole
Array.Fill(cisla, 5, 1, 3);  // {10, 5, 5, 5, 10}
//                 hodnota, start, count
```

=== Další užitečné metody

```cs
int[] cisla = {1, 2, 3, 4, 5};

// Vymazání pole (nastavení na výchozí hodnoty)
Array.Clear(cisla, 0, cisla.Length);  // {0, 0, 0, 0, 0}

// Změna velikosti (vytvoří nové pole)
Array.Resize(ref cisla, 10);  // rozšíří na 10 prvků

// Existence prvku
bool existuje = Array.Exists(cisla, x => x > 3);  // true/false

// Najdi prvek dle podmínky
int[] cisla2 = {1, 2, 3, 4, 5};
int prvni = Array.Find(cisla2, x => x > 3);  // 4
int[] vsechny = Array.FindAll(cisla2, x => x > 2);  // {3, 4, 5}

// ForEach – provede akci pro každý prvek
Array.ForEach(cisla2, x => Console.Write(x + " "));
```

== Instanční metody pole (C\#)

Každé pole v C\# má vlastnosti a metody zděděné od `System.Array`.

=== Vlastnosti pole

```cs
int[] cisla = {10, 20, 30, 40, 50};

// Length – počet prvků
int pocet = cisla.Length;  // 5

// Rank – počet dimenzí (1 pro jednorozměrné pole)
int dimenze = cisla.Rank;  // 1

// IsReadOnly – zda je pole pouze pro čtení
bool readOnly = cisla.IsReadOnly;  // false

// IsFixedSize – zda má pole pevnou velikost
bool fixed = cisla.IsFixedSize;  // true
```

=== Instance metody

```cs
int[] cisla = {1, 2, 3, 4, 5};

// GetLength – délka v dané dimenzi
int delka = cisla.GetLength(0);  // 5

// GetValue – získání hodnoty na indexu (jako object)
object hodnota = cisla.GetValue(2);  // 3

// SetValue – nastavení hodnoty na indexu
cisla.SetValue(100, 2);  // cisla[2] = 100

// Clone – vytvoří kopii pole
int[] kopie = (int[])cisla.Clone();

// CopyTo – zkopíruje do jiného pole
int[] cil = new int[10];
cisla.CopyTo(cil, 2);  // zkopíruje od indexu 2
```

=== LINQ metody pro pole

Pole v C\# podporují LINQ dotazy:

```cs
using System.Linq;

int[] cisla = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

// Where – filtrování
int[] suda = cisla.Where(x => x % 2 == 0).ToArray();  // {2, 4, 6, 8, 10}

// Select – transformace
int[] druhe = cisla.Select(x => x * x).ToArray();  // {1, 4, 9, 16, ...}

// Sum – součet
int soucet = cisla.Sum();  // 55

// Average – průměr
double prumer = cisla.Average();  // 5.5

// Min / Max
int min = cisla.Min();  // 1
int max = cisla.Max();  // 10

// Count – počet prvků splňujících podmínku
int pocetVetsichNezPet = cisla.Count(x => x > 5);  // 5

// Any – existuje alespoň jeden prvek splňující podmínku
bool existujeSude = cisla.Any(x => x % 2 == 0);  // true

// All – všechny prvky splňují podmínku
bool vsechnaKladna = cisla.All(x => x > 0);  // true

// First / Last
int prvni = cisla.First();  // 1
int posledni = cisla.Last();  // 10

// FirstOrDefault – vrátí první nebo výchozí hodnotu
int prvniVetsiNezDeset = cisla.FirstOrDefault(x => x > 10);  // 0

// OrderBy / OrderByDescending
int[] serazene = cisla.OrderByDescending(x => x).ToArray();  // {10, 9, 8, ...}

// Take / Skip
int[] prvnichPet = cisla.Take(5).ToArray();  // {1, 2, 3, 4, 5}
int[] bezPrvnichPeti = cisla.Skip(5).ToArray();  // {6, 7, 8, 9, 10}

// Distinct – unikátní hodnoty
int[] sOpakovanim = {1, 2, 2, 3, 3, 3, 4};
int[] unikatni = sOpakovanim.Distinct().ToArray();  // {1, 2, 3, 4}
```

=== Příklady praktického použití

*Statistiky pole:*
```cs
int[] znamky = {1, 2, 1, 3, 2, 1, 4, 3, 2};

int pocet = znamky.Length;                    // 9
double prumer = znamky.Average();             // 2.11
int nejlepsi = znamky.Min();                  // 1
int nejhorsi = znamky.Max();                  // 4
int pocetJednicek = znamky.Count(z => z == 1); // 3

Console.WriteLine($"Počet známek: {pocet}");
Console.WriteLine($"Průměr: {prumer:F2}");
Console.WriteLine($"Nejlepší: {nejlepsi}");
Console.WriteLine($"Nejhorší: {nejhorsi}");
Console.WriteLine($"Počet jedniček: {pocetJednicek}");
```

*Filtrace a transformace:*
```cs
string[] jmena = {"Anna", "Petr", "Karel", "Eva", "Martin"};

// Jména začínající na 'A' nebo 'E', převedená na velká písmena
var vysledek = jmena
    .Where(j => j.StartsWith("A") || j.StartsWith("E"))
    .Select(j => j.ToUpper())
    .ToArray();

// vysledek: {"ANNA", "EVA"}

// Seřazená jména delší než 4 znaky
var dlouha = jmena
    .Where(j => j.Length > 4)
    .OrderBy(j => j)
    .ToArray();

// dlouha: {"Karel", "Martin", "Petr"}
```
