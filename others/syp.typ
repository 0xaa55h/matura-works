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
  #title([Systémová Podpora])
  == Souhrn k maturitě
])

#set heading(numbering: "1.1.")

= Protokoly a modely, ISO-OSI, TCP-IP

== Proč používáme vrstevnaté modely?

Hlavním principem je dekompozice -- rozdělení komplexního problému síťové komunikace na menší, řiditelné části.

- *Abstrakce*: Vyšší vrstva využívá služeb vrstvy nižší, aniž by musela vědět, jak jsou tyto služby implementovány.
- *Standardizace (Interoperabilita)*: Umožňuje komunikaci mezi zařízeními různých výrobců. Pokud se změní technologie na fyzické vrstvě (např. přechod z metalického kabelu na optiku), aplikační vrstvy se to nijak nedotkne.
- *Snadnější vývoj a údržba*: Chyby se lépe izolují a nové protokoly lze vyvíjet pro konkrétní vrstvu nezávisle na ostatních.

== Porovnání modelů ISO/OSI a TCP/IP

#figure(
  table(
    columns: 4,
    align: left,
    stroke: 0.5pt,

    [*Vrstva ISO/OSI*], [*PDU (Jednotka)*], [*Vrstva TCP/IP*], [*Funkce a význam*],

    [7. Aplikační], [Data], [Aplikační], [Rozhraní pro uživatelské aplikace (prohlížeč, e-mail).],

    [6. Prezentační], [Data], [(v TCP/IP součást aplikační)], [Formátování dat (šifrování, komprese, kódování znaků).],

    [5. Relační], [Data], [(v TCP/IP součást aplikační)], [Správa relací (navázání, udržování a ukončení dialogu).],

    [4. Transportní], [Segment / Datagram], [Transportní], [End-to-end komunikace, řízení toku, kontrola chyb.],

    [3. Síťová], [Paket], [Internetová], [Logické adresování (IP), směrování (routing) mezi sítěmi.],

    [2. Data Linková], [Rámec (Frame)], [Síťové rozhraní], [Fyzické adresování (MAC), přístup k médiu, detekce chyb.],

    [1. Fyzická], [Bity], [(v TCP/IP součást síť. rozhraní)], [Fyzický přenos signálů (napětí, světlo, rádiové vlny)."],
  ),
  caption: [Model TCP/IP redukuje počet vrstev na 4],
)

== Proces zapouzdření (Encapsulation)

Zapouzdření je proces přidávání řídicích informací (hlaviček a patiček) k datům při průchodu vrstvami směrem dolů. Opačný proces na straně příjemce se nazývá rozpouzdření (decapsulation).

Průchod vrstvami (Sestupný směr):
+ *Aplikační vrstva*: Vygeneruje uživatelská Data (např. GET požadavek v HTTP).
+ *Transportní vrstva*: K datům se přidá hlavička (L4 Header) obsahující čísla portů. Vzniká Segment (u protokolu TCP) nebo Datagram (u UDP).
+ *Internetová vrstva*: K segmentu se přidá hlavička (L3 Header) s IP adresami. Vzniká Paket.
+ *Vrstvová síťového rozhraní (Linková část)*: K paketu se přidá hlavička (L2 Header) s MAC adresami a patička (FCS -- Frame Check Sequence) pro kontrolu integrity. Vzniká Ethernetový rámec.
+ *Fyzická část*: Rámec je převeden na sekvenci bitů a vyslán jako fyzický signál do média.

== Protokoly v TCP/IP modelu

- *Aplikační vrstva*:
  - HTTP/HTTPS: Protokoly pro přenos hypertextových dokumentů (webu).
  - DNS (Domain Name System): Hierarchický systém pro překlad doménových jmen na IP adresy.
  - DHCP: Dynamické přidělování IP adres v síti.
- *Transportní vrstva*:
  - TCP (Transmission Control Protocol): Spojově orientovaný, zajišťuje spolehlivý přenos, potvrzování a seřazení paketů.
  - UDP (User Datagram Protocol): Nespojovaný, nespolehlivý, ale rychlý (vhodný pro VoIP, DNS, hry).
- *Internetová vrstva*:
  - IP (Internet Protocol): Zajišťuje logické adresování a doručení paketu od zdroje k cíli přes více sítí.
  - ICMP (Internet Control Message Protocol): Slouží k přenosu chybových hlášení a diagnostice (např. ping, traceroute).
  - ARP (Address Resolution Protocol): Mapuje IP adresu na fyzickou MAC adresu v lokální síti (stojí na pomezí L2/L3).
- *Vrstva síťového rozhraní*:
  - Ethernet: Nejpoužívanější standard pro LAN sítě (definuje přístup k médiu CSMA/CD, formát rámců).

= Fyzická vrstva, přenosová média a jejich vlastnosti

Fyzická vrstva (Layer 1) modelu ISO/OSI je zodpovědná za přenos surových bitů přes komunikační kanál. Tato otázka se zaměřuje na fyzické vlastnosti médií, jejich limity a odolnost vůči vnějšímu prostředí.

== Kategorie a typy síťových médií

Síťová média dělíme na *metalická* (měděná), *optická* a *bezdrátová*.

#table(
  columns: 4,
  align: left,
  stroke: 0.5pt,

  [*Kategorie*], [*Typ média*], [*Max. délka segmentu*], [*Konektory*],

  [Metalická], [Kroucená dvojlinka (UTP/STP)], [100 m], [RJ-45],

  [], [Koaxiální kabel (ThinNet)], [185 m], [BNC (dnes zastaralé)],

  [Optická], [Mnohovidová (Multimode - MM)], [cca 550 m -- 2 km], [ST, SC, LC, MTRJ],

  [], [Jednovidová (Singlemode - SM)], [desítky až 100+ km], [SC, LC, E2000],

  [Bezdrátová], [Wi-Fi (2.4 / 5 / 6 GHz)], [desítky metrů (v budovách)], [Anténní konektory (SMA)],
)

== Výhody, nevýhody a příklady použití

- *Metalická média (Kroucená dvojlinka - Twisted Pair)*
  - #text(
      [Výhody: Nízká cena, snadná instalace, podpora napájení (PoE - Power over Ethernet).],
      fill: color.darken(green, 50%),
      weight: "semibold",
    )
  - #text(
      [Nevýhody: Náchylnost k elektromagnetickému rušení (EMI), omezený dosah (100 m).],
      fill: color.darken(red, 50%),
      weight: "semibold",
    )
  - Použití: Koncová zařízení (PC, tiskárny), LAN sítě v budovách.
- *Optická média (Optical Fiber)*
  - #text(
      [Výhody: Obrovská šířka pásma, naprostá imunita vůči EMI, vysoká bezpečnost (nevyzařuje signál), velký dosah.],
      fill: color.darken(green, 50%),
      weight: "semibold",
    )
  - #text(
      [Nevýhody: Vysoká cena komponent, náročná instalace (svařování vláken), křehkost.],
      fill: color.darken(red, 50%),
      weight: "semibold",
    )
  - Použití: Páteřní sítě (backbone), propojení budov, dálkové trasy (podmořské kabely).
- *Bezdrátová média (Wireless)*
  - #text(
      [Výhody: Mobilita, není nutná kabeláž.],
      fill: color.darken(green, 50%),
      weight: "semibold",
    )
  - #text(
      [Nevýhody: Sdílené médium (pokles rychlosti s počtem uživatelů), rušení překážkami a jinými vysílači.],
      fill: color.darken(red, 50%),
      weight: "semibold",
    )
  - Použití: Mobilní zařízení, notebooky, místa, kde nelze vrtat.

== Zapojení UTP kabelu (Standardy T568A a T568B)

U kroucené dvojlinky rozlišujeme barvy párů: oranžový, zelený, modrý a hnědý.
Typy zapojení:

+ *Přímý kabel (Straight-through)*: Na obou koncích je stejný standard (obvykle T568B). Používá se pro propojení různých typů zařízení (PC ↔ Switch, Switch ↔ Router).
+ *Křížený kabel (Crossover)*: Na jednom konci T568A, na druhém T568B. Používal se pro propojení stejných typů zařízení (PC ↔ PC, Switch ↔ Switch).

_Poznámka: Dnes už křížené kabely díky funkci Auto-MDIX (automatická detekce na portech) téměř nejsou potřeba, hardware si piny prohodí sám._

#align(center, image("/assets/image-1.png", width: 80%))

#table(
  columns: 4,
  align: left,
  stroke: 0.5pt,

  [*Kategorie*], [*Šířka pásma*], [*Max. rychlost*], [*Typické použití*],

  [Cat 5e], [100 MHz], [1 Gbps], [Standard pro běžné LAN (Gigabit Ethernet) do 100 m.],

  [Cat 6], [250 MHz], [1 Gbps (10 Gbps)], [Lepší izolace (středový kříž), 10 Gbps jen do 55 m.],

  [Cat 6a], [500 MHz], [10 Gbps], [Standard pro moderní instalace a datová centra (10 Gbps na 100 m).],

  [Cat 7], [600 MHz], [10 Gbps+], [Vyžaduje individuální stínění párů, často jiné konektory (GG45/TERA).],

  [Cat 8], [2000 MHz], [25 -- 40 Gbps], [Velmi krátké vzdálenosti (do 30 m), určené pro páteřní spoje v serverovnách.],
)

- *UTP* -- Nejčastěji používaný typ kabelu pro LAN sítě, kroucené páry bez stínění.
- *STP* -- Kroucené páry s celkovým stíněním, lepší ochrana proti EMI.
- *FTP* -- Kroucené páry s fóliovým stíněním, často používané v průmyslových aplikacích.
- *SFTP* -- Kombinace fóliového stínění a opletení, poskytuje nejlepší ochranu proti rušení.
- *Postfix -e* označuje vylepšenou verzi (např. Cat 5e -- enhanced)
- *Postfix -a* označuje "augmented" (vylepšenou) verzi (např. Cat 6a -- augmented).


== Negativní vlivy a eliminace rušení

Fyzická vrstva musí bojovat s degradací signálu.

=== Elektromagnetické rušení (EMI) a přeslechy (Crosstalk)

Působí zejména na měděné kabely (motory, zářivky, souběh s elektrickým vedením).

- *Eliminace*:
  + *Kroucení vodičů*: Základní princip UTP. Magnetická pole jednotlivých vodičů v páru se navzájem vyruší.
  + *Stínění (STP/FTP)*: Použití hliníkové fólie nebo měděného opletení kolem párů či celého kabelu.
  + *Správná instalace*: Dodržování minimální vzdálenosti od silnoproudých rozvodů.

=== Útlum (Attenuation)

Signál se vzdáleností slábne (ztráta energie v médiu).

- *Eliminace*:
  + Dodržování maximálních délek (100 m u UTP).
  + Použití opakovačů (repeatrů) nebo switchů pro regeneraci signálu.
  + Přechod na optické vlákno u dlouhých tras.

=== Útlum v optice (Disperze)

Rozptyl světelného pulzu v čase.

- *Eliminace*: Použití kvalitnějších jednovidových vláken (SM), kde světlo cestuje příměji a pulzy se neslévají dohromady.

== Duplexní režimy (Duplex Modes)

Duplex určuje, jakým způsobem probíhá obousměrná komunikace mezi dvěma body.

=== Poloduplex (Half-Duplex)

Komunikace může probíhat pouze jedním směrem v daném okamžiku (např. vysílání nebo přijímání, ale ne obojí současně). Vyžaduje použití protokolu CSMA/CD (na data-linkové vrstvě) pro řešení kolizí.

=== Plný duplex (Full-Duplex)

Data mohou být vysílána i přijímána současně. Eliminace kolizí, protože každý směr má svůj vlastní kanál (např. oddělené páry v UTP). Vyžaduje podporu obou zařízení (např. switch a síťová karta). Eliminuje potřebu CSMA/CD. Protože vysílací a přijímací cesty jsou oddělené, ke kolizím fyzicky nemůže dojít.

_Poznámka: Propojením half-duplex a full-duplex dojde k duplex mismatch, což zapříčiní zhoršení výkonu nebo selhání komunikace._

_Poznámka 2: V rámci TCP/IP modelu se o duplexu rozhoduje během procesu Auto-negotiation. Ten probíhá hned po připojení kabelu (L1 aktivita), ale výsledek přímo ovlivní chování Ethernetových rámců (L2 aktivita)._

= Data-linková vrstva, Ethernet a základní funkce a konfigurace switche

Data-linková vrstva (2. vrstva OSI) je kritickým mostem mezi fyzickými signály a logickým adresováním.

== Metody přístupu k médiu (MAC - Medium Access Control)

V dobách sdíleného média (huby, koaxiální kabely) musel existovat „dopravní řád“, aby nedocházelo ke kolizím.

=== CSMA/CD (Carrier Sense Multiple Access with Collision Detection)

Stanice naslouchá, zda je v kabelu ticho. Pokud ano, vysílá. Pokud během vysílání zjistí kolizi (napětí stoupne), přestane, vyšle signál JAM a po náhodné době zkusí znovu. *Využívá se v half-duplex Ethernetu* (10BASE-T, 100BASE-TX).

=== CSMA/CA (Collision Avoidance)

Místo detekce se kolizím předchází. Stanice vyšle krátký rámec "RTS" (Request to Send), na který přístupový bod odpoví "CTS" (Clear to Send). *Využití: Wi-Fi (802.11)*.

== Varianty Ethernetu na metalických médiích

Ethernet se vyvíjel zvyšováním frekvence a lepším kódováním.

#table(
  columns: 5,
  align: (left, left, left, left, left),
  stroke: 1pt,

  [*Název*], [*Standard*], [*Rychlost*], [*Médium*], [*Max. délka*],

  [Ethernet], [10Base-T], [10 Mbps], [Cat 3/5], [100 m],
  [Fast Ethernet], [100Base-TX], [100 Mbps], [Cat 5 a vyšší], [100 m],
  [Gigabit Ethernet], [1000Base-T], [1 Gbps], [Cat 5e/6], [100 m],
  [10G Ethernet], [10GBase-T], [10 Gbps], [Cat 6a/7], [100 m],
)

== Aktivní prvky LAN a jejich funkce

- *Hub (Rozbočovač)*: Pracuje na 1. vrstvě. Pouze tupě kopíruje signál do všech portů. Všechna zařízení jsou v jedné kolizní doméně. (Dnes se nepoužívá).
- *Switch (Přepínač)*: Pracuje na 2. vrstvě (nebo na 3., ale ty jsou výrazně dražší). Rozhoduje se na základě MAC adres. Odděluje kolizní domény.
- *Router (Směrovač)*: Pracuje na 3. vrstvě. Propojuje různé sítě a rozhoduje se na základě IP adres. Odděluje broadcastové domény.

== Fungování switche a MAC tabulka

Switch je "inteligentní", protože si udržuje MAC Address Table (CAM tabulku).

Rozhodovací proces:
- *Learning (Učení)*: Switch se podívá na zdrojovou MAC adresu příchozího rámce a zapíše si ji do tabulky spolu s číslem portu.
- *Forwarding (Přepínání)*: Switch se podívá na cílovou MAC adresu. Pokud ji má v tabulce, pošle rámec pouze na daný port.
- *Flooding (Záplava)*: Pokud cílovou MAC adresu v tabulce nemá (nebo jde o Broadcast), pošle rámec do všech portů kromě toho, ze kterého přišel.

Metody přepínání:
- _Store-and-Forward_: Switch přijme celý rámec, zkontroluje CRC (chyby) a pak teprve odesílá. Nejpomalejší, ale nejbezpečnější.
- _Cut-Through_: Switch přečte jen cílovou MAC adresu a okamžitě začne vysílat dál. Minimální latence, ale propouští i poškozené rámce.

== Kolizní a Broadcastová doména

- *Kolizní doména*: Oblast sítě, kde může dojít ke kolizi (současnému vysílání). Každý port switche představuje vlastní kolizní doménu (v Full-duplexu ke kolizím nedochází).
- *Broadcastová doména*: Oblast sítě, kde se šíří broadcastové zprávy. Všechna zařízení ve stejné broadcastové doméně mohou komunikovat mezi sebou. Routery oddělují broadcastové domény, zatímco switche oddělují kolizní domény.

== Spanning Tree Protocol (STP - 802.1D)

V přepínaných sítích často chceme redundanci (záložní spoje). Pokud ale propojíme switche do kruhu bez ochrany, vznikne broadcastová bouře (rámce nekonečně cyklí), což síť během sekund zahltí.

*Řešení pomocí STP:*
+ Switche si zvolí jednoho vůdce (Root Bridge).
+ Najdou nejkratší cesty k Root Bridge.
+ Nadbytečné (redundantní) cesty se logicky zablokují (porty jsou v módu Blocking).
+ Při výpadku aktivní trasy STP automaticky odblokuje záložní spoj.

= Síťová vrstva, ARP, Základní konfigurace routeru

Síťová vrstva je 3. vrstvou modelu OSI. Jejím hlavním úkolem je směrování (routing) -- tedy doručení paketu ze zdroje do cíle přes různé sítě.

- Hlavní funkce: Adresace (logické adresy), zapouzdření (encapsulation), směrování a rozbalování.
- Charakteristika: Pracuje s jednotkou dat zvanou paket. Nezajímá ji, jestli jsou data v pořádku (to řeší transportní vrstva), jejím cílem je jen najít cestu.
- Protokoly: *IPv4 / IPv6*: Hlavní protokoly pro adresaci a přenos.
  - ICMP
  - Směrovací protokoly (RIP, OSPF, BGP)

== IP Adresy a masky

Síťová vrstva používá logické adresy.
Struktura IPv4: 32-bitové číslo zapsané ve čtyřech dekadických oktetech (např. 192.168.1.10).
Části adresy: Každá adresa se skládá z části sítě (Network) a části hostitele (Host).
Maska sítě (Subnet Mask): Určuje, kde končí část sítě a začíná část hostitele.
- Příklad: Masku 255.255.255.0 (nebo /24) říká, že první tři čísla jsou ID sítě.
ARP (Address Resolution Protocol): Klíčový pomocník. Protože routery směrují podle IP, ale switch doručuje podle MAC adresy, ARP slouží k překladu známé IP adresy na fyzickou MAC adresu.

== Router a jeho fungování

Router (směrovač) propojuje sítě s různými síťovými identifikátory. Rozhoduje se na základě směrovací tabulky (Routing Table).

=== Postup rozhodování routeru

+ Přijme paket na rozhraní.
+ Podívá se na cílovou IP adresu.
+ Najde nejlepší shodu ve své tabulce.
+ Přepošle paket na příslušné výstupní rozhraní (nebo ho zahodí, pokud cestu nezná).

== Konfigurace Cisco routeru (IOS)

Cisco zařízení používají hierarchický systém módů.

=== Základní módy

- *User EXEC Mode*: Omezený přístup, pouze pro zobrazení informací (prompt: `Router>`).
- *Privileged EXEC Mode*: Plný přístup k příkazům pro zobrazení a diagnostiku (prompt: `Router#`).
- *Global Configuration Mode*: Pro konfiguraci zařízení (prompt: `Router(config)#`).
- *Interface Configuration Mode*: Pro konfiguraci konkrétního rozhraní (prompt: `Router(config-if)#`).

=== Příklady základních příkazů
- `enable`: Přechod do Privileged EXEC Mode.
- `configure terminal`: Přechod do Global Configuration Mode.
- `interface GigabitEthernet0/0`: Přechod do Interface Configuration Mode pro rozhraní GigabitEthernet0/0.
- Pojmenování: `hostname Router1`
- Zabezpečení privilegovaného módu: `enable secret heslo`
- Šifrování hesel v konfiguraci: `service password-encryption`
- Nastavení banneru: `banner motd #Nepovolanym vstup zakazan#`

== Přístup, zabezpečení a rozhraní

=== Způsoby přístupu

- Konzole (Console): Fyzické připojení kabelem přímo do routeru (vhodné pro první nastavení).
- VTY linky (Virtual Terminal): Vzdálený přístup přes síť pomocí Telnet (nešifrovaný, nebezpečný) nebo SSH (šifrovaný, doporučený).
- Auxiliary (AUX): Starší způsob přes modem.

=== Aktivace rozhraní

Rozhraní routeru jsou defaultně vypnutá (administratively down).

```
interface GigabitEthernet0/0
 ip address 192.168.1.1 255.255.255.0
 no shutdown  # Tímto se port zapne
```

=== Zálohování konfigurace

Router má dvě konfigurace:

+ Running-config: Aktuální nastavení v RAM (změny se projeví okamžitě, ale nejsou trvalé).
+ Startup-config: Uložená konfigurace v NVRAM (načítá se při startu).
Pro uložení změn do startup-config: `copy running-config startup-config` nebo zkráceně `write` (write memory).

== Nástroje pro kontrolu

- `show ip interface brief`: Rychlý přehled o stavu rozhraní a přiřazených IP adresách.
- `show running-config`: Zobrazí aktuální konfiguraci.
- `show startup-config`: Zobrazí uloženou konfiguraci.
- `show interfaces`: Detailní informace o každém rozhraní (stav, statistiky, chyby).
- `show ip route`: Zobrazí směrovací tabulku routeru.
- `ping <IP_adresa>`: Ověření dosažitelnosti cílové IP adresy.
- `traceroute <IP_adresa>`: Zobrazí cestu, kterou paket putuje k cíli, a identifikuje případné problémy na trase.

= IPv4 a IPv6 adresace, podsítě

== IPv4 vs IPv6

#figure(
  table(
    columns: 3,
    align: left,
    [*Vlastnost*], [*IPv4*], [*IPv6*],

    [Délka adresy], [32 bitů], [128 bitů],

    [Způsob zápisu], [Dekadický (tečková konvence)], [Hexadecimální (dvojtečková konvence)],

    [Příklad], [192.168.10.5], [2001:0db8:85a3:0000:0000:8a2e:0370:7334],

    [Počet adres], [cca $4.3 times 10^9$ (4 miliardy)], [cca $3.4 times 10^38$ (kvintiliony)],
  ),
  caption: [Základní srovnání IPv4 a IPv6],
)

== Struktura IPv4 a maska sítě

IPv4 adresa se dělí na dvě logické části:
- *Síťová část*: Identifikuje síť, ke které zařízení patří.
- *Hostitelská část*: Identifikuje konkrétní zařízení (hostitele) v rámci sítě.
Maska sítě (Subnet Mask) určuje, kolik bitů je vyhrazeno pro síťovou část a kolik pro hostitelskou část. Například maska `255.255.255.0` (nebo `/24` dle CIDR notace) říká, že první tři čísla jsou ID sítě a poslední číslo je ID hostitele.

== Třídy IPv4 adres (Classful Addressing)

Dříve se adresy dělily do pevných tříd podle prvního oktetu:

- *Třída A*: Velké sítě. Maska `/8`. (126 sítí, miliony hostů).
- *Třída B*: Střední sítě. Maska `/16`. (16 tisíc sítí, tisíce hostů).
- *Třída C*: Malé sítě. Maska `/24`.
- *Třída D*: Multicast (vysílání pro skupinu).
- *Třída E*: Experimentální účely.

Poznámka: Adresa `127.x.x.x` je vyhrazena pro loopback (testování vlastního zařízení).

== Veřejné a privátní adresy

- Veřejné adresy: Unikátní v celém internetu. Jsou placené a přiděluje je autorita (IANA/RIPE).
- Privátní adresy: Používají se uvnitř lokálních sítí (LAN). Nejsou směrovatelné do internetu. Pro přístup ven se musí použít NAT (Network Address Translation).

=== Rozsahy privátních adres

+ `10.0.0.0` až `10.255.255.255` (třída A)
+ `172.16.0.0` až `172.31.255.255` (třída B)
+ `192.168.0.0` až `192.168.255.255` (třída C)

== Struktura IPv6 adresy

Zapisuje se jako 8 skupin po 4 hexadecimálních cifrách.

- *Zkracování*: Nuly na začátku skupiny lze vynechat. Jednu souvislou řadu nulových skupin lze nahradit `::` (pouze jednou v adrese!).
- Části:
  - *Global Routing Prefix (48 bitů)*: Určuje síť poskytovatele.
  - *Subnet ID (16 bitů)*: Pro vnitřní členění sítě.
  - *Interface ID (64 bitů)*: Unikátní identifikátor zařízení (často odvozen z MAC adresy).

== Přidělování IP adres

#columns(2, [
  #align(center, [*Statické*])

  Správce nastaví adresu ručně. Používá se pro servery, tiskárny a síťové prvky (aby se jejich adresa neměnila).

  #colbreak()

  #align(center, [*Dynamické*])

  Zařízení si o adresu požádá automaticky ze serveru DHCP. U IPv6 existuje také SLAAC (bezstavová autokonfigurace), kdy si zařízení adresu vygeneruje samo na základě prefixu od routeru.
])

== Důvody vytváření podsítí (Subnetting)

Proč síť nekontrolovaně nezvětšovat, ale dělit?

+ *Omezení broadcastu*: Broadcasty (všesměrové vysílání) zbytečně zatěžují všechna zařízení v síti. Menší síť = menší "hluk".
+ *Bezpečnost*: Oddělení různých oddělení (např. účtárna vs. hosté na Wi-Fi). Mezi podsítěmi může router filtrovat provoz.
+ *Efektivita*: Lepší využití adresního prostoru (neplýtváme velkými bloky adres pro pár počítačů).
+ *Organizace*: Snadnější správa a řešení problémů.
