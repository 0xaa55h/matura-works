#set text(font: "New Computer Modern", size: 12pt)
#set page(
  margin: (
    left: 1cm,
    right: 1cm,
    top: 1cm,
    bottom: 1cm,
  ),
)

#show heading.where(level: 1): set text(
  weight: "extrabold",
  fill: rgb(255, 0, 0),
)
#show heading.where(level: 2): set text(
  weight: "extrabold",
  fill: rgb(0, 0, 255),
)
#show heading: set block(below: 16pt, above: 16pt)

#import "@preview/zebraw:0.6.1": *
#show: zebraw

#align(center, [
  = Systémová Podpora -- Počítačové sítě
  === Kompletní souhrn
])

#[
  #show (
    outline
      .entry
      .where(
        level: 1,
      )
      .or(
        outline.entry.where(level: 2),
      )
  ): it => {
    strong(it)
  }


  #outline(depth: 3, title: "Obsah")
]

#set heading(numbering: "1.1")

= Protokoly a modely, ISO-OSI, TCP-IP

== Důvod použití vrstevnatých modelů
*Vrstevnaté (vrstvené) modely* rozdělují síťovou komunikaci do samostatných vrstev, kde každá vrstva má specifickou funkci.

*Výhody:*
- *Modularita* -- každá vrstva je nezávislá, změna v jedné vrstvě neovlivní ostatní
- *Standardizace* -- umožňuje spolupráci zařízení různých výrobců
- *Jednodušší vývoj* -- složité problémy jsou rozděleny do menších částí
- *Snadnější řešení problémů* -- lze izolovat konkrétní vrstvu při diagnostice
- *Vzájemná komunikace* -- každá vrstva komunikuje pouze se sousedními vrstvami

== Porovnání modelů ISO-OSI a TCP-IP

=== ISO-OSI model
*ISO-OSI* (Open Systems Interconnection) je teoretický referenční model se *7 vrstvami*:

#table(
  columns: (auto, auto, auto),
  [*Vrstva*], [*Název*], [*Funkce*],
  [7], [Aplikační], [Uživatelské služby (HTTP, FTP, SMTP)],
  [6], [Prezentační], [Formátování dat, šifrování],
  [5], [Relační], [Navázání/ukončení spojení],
  [4], [Transportní], [Spolehlivý přenos (TCP, UDP)],
  [3], [Síťová], [Směrování, adresace (IP)],
  [2], [Linková], [Rámce, MAC adresy, přístup k médiu],
  [1], [Fyzická], [Přenos bitů, kabely, signály],
)

=== TCP/IP model
*TCP/IP* je praktický model se *4 vrstvami*, používaný v Internetu:

#table(
  columns: (auto, auto, auto),
  [*Vrstva*], [*Název*], [*Odpovídá ISO-OSI*],
  [4], [Aplikační], [Vrstvy 5-7],
  [3], [Transportní], [Vrstva 4],
  [2], [Internetová], [Vrstva 3],
  [1], [Síťového rozhraní], [Vrstvy 1-2],
)

=== Hlavní rozdíly
- *ISO-OSI:* 7 vrstev, teoretický, podrobnější členění, vznikl později
- *TCP/IP:* 4 vrstvy, praktický, používá se v praxi, starší
- TCP/IP vznikl pro ARPANET a později se stal základem Internetu
- ISO-OSI je standardizovaný model ISO, používá se pro výuku

== Zapouzdření ethernetového rámce (Encapsulation)
*Zapouzdření (encapsulation)* je proces přidávání hlaviček (headers) a případně zápatí (trailers) při průchodu dat vrstvami *shora dolů* (od aplikace k fyzickému médiu).

=== Postup zapouzdření:
1. *Aplikační vrstva:* Data (Data)
2. *Transportní vrstva:* přidá TCP/UDP hlavičku → Segment
3. *Síťová vrstva:* přidá IP hlavičku → Paket
4. *Linková vrstva:* přidá Ethernet hlavičku a FCS zápatí → Rámec (Frame)
5. *Fyzická vrstva:* převod na bity (Bits) → přenos signálem

=== Dekapsulace (Decapsulation)
Opačný proces při příjmu dat -- *zdola nahoru*. Každá vrstva odstraní svou hlavičku a předá data vyšší vrstvě.

=== Struktura Ethernetového rámce:
- *Preambule* (7 B) -- synchronizace
- *SFD* (1 B) -- Start Frame Delimiter
- *Cílová MAC* (6 B) -- adresa příjemce
- *Zdrojová MAC* (6 B) -- adresa odesílatele
- *Typ/Délka* (2 B) -- protokol vyšší vrstvy (např. IPv4)
- *Data* (46-1500 B) -- užitečná data
- *FCS* (4 B) -- Frame Check Sequence (kontrola chyb)

== Protokoly v TCP/IP modelu

=== Aplikační vrstva
- *HTTP/HTTPS* -- webové stránky (port 80/443)
- *FTP* -- přenos souborů (port 20/21)
- *SMTP* -- odesílání emailů (port 25)
- *POP3/IMAP* -- příjem emailů (port 110/143)
- *DNS* -- překlad doménových jmen (port 53)
- *DHCP* -- automatická konfigurace IP (port 67/68)
- *SSH* -- zabezpečený vzdálený přístup (port 22)
- *Telnet* -- nezabezpečený vzdálený přístup (port 23)

=== Transportní vrstva
- *TCP* (Transmission Control Protocol)
  - Spolehlivý, spojovaný přenos
  - Potvrzování přijatých dat (ACK)
  - Řízení toku a zahlcení
  - Three-way handshake (SYN, SYN-ACK, ACK)

- *UDP* (User Datagram Protocol)
  - Nespolehlivý, nespojovaný přenos
  - Rychlejší než TCP
  - Bez potvrzování, menší režie
  - Používá se pro streaming, VoIP, DNS

=== Internetová vrstva
- *IP* (Internet Protocol) -- adresace a směrování paketů
  - IPv4 (32 bitů) a IPv6 (128 bitů)
- *ICMP* -- diagnostika a hlášení chyb (ping, traceroute)
- *ARP* -- Address Resolution Protocol (převod IP → MAC)
- *RARP* -- Reverse ARP (převod MAC → IP)

=== Vrstva síťového rozhraní
- *Ethernet* -- technologie pro lokální sítě (LAN)
- *Wi-Fi* (802.11) -- bezdrátové sítě
- *PPP* -- Point-to-Point Protocol

= Fyzická vrstva, přenosová média a jejich vlastnosti

== Úvod do fyzické vrstvy
*Fyzická vrstva* je nejnižší (1.) vrstva ISO-OSI modelu. Zabývá se fyzickým přenosem bitů mezi zařízeními.

*Hlavní funkce:*
- *Převod dat na signály* -- převádí bity (0 a 1) na elektrické, optické nebo rádiové signály
- *Fyzické připojení* -- definuje typy kabelů, konektorů, pinoutů
- *Přenos signálu* -- zajišťuje fyzické médium pro přenos
- *Kódování* -- určuje způsob reprezentace dat (např. Manchester encoding)
- *Synchronizace* -- koordinace časování mezi odesílatelem a příjemcem

*Co fyzická vrstva NEřeší:*
- Logickou adresaci (MAC, IP)
- Směrování
- Kontrolu chyb (kromě základní)
- Řízení toku dat

*Proč je důležitá:*
- Bez fyzické vrstvy by nebyla možná žádná síťová komunikace
- Určuje *maximální rychlost* a *vzdálenost* přenosu
- Ovlivňuje *spolehlivost* a *kvalitu* připojení
- Volba správného média závisí na požadavcích (vzdálenost, rychlost, cena, prostředí)

== Typy síťových médií

=== Kroucená dvojlinka (Twisted Pair - TP)
*Nejpoužívanější médium* pro lokální sítě (LAN).

*Typy:*
- *UTP* (Unshielded Twisted Pair) -- nestíněná, levnější, běžné použití
- *STP/FTP* (Shielded/Foiled Twisted Pair) -- stíněná, lepší ochrana proti rušení

*Kategorie:*
- *Cat 5e* -- až 1 Gbps, 100 MHz, do 100 m
- *Cat 6* -- až 10 Gbps (do 55 m), 250 MHz
- *Cat 6a* -- až 10 Gbps (do 100 m), 500 MHz
- *Cat 7/8* -- vyšší rychlosti a frekvence

*Konektory:* RJ-45 (8P8C)

*Zapojení:*
- *T568A* a *T568B* -- standardy zapojení vodičů
- *Straight-through* -- stejné zapojení na obou koncích (PC ↔ Switch)
- *Crossover* -- křížené zapojení (PC ↔ PC, Switch ↔ Switch)

=== Optické vlákno (Fiber Optic)
Přenos dat pomocí *světelných impulsů*.

*Typy:*
- *Jednovidové (Single-mode)* -- SMF
  - Dlouhé vzdálenosti (až desítky km)
  - Malý průměr jádra (8-10 μm)
  - Laser jako zdroj světla
  - Dražší, používá se pro WAN

- *Vícevidové (Multi-mode)* -- MMF
  - Kratší vzdálenosti (do 2 km)
  - Větší průměr jádra (50-62,5 μm)
  - LED jako zdroj světla
  - Levnější, používá se pro LAN

*Výhody:*
- Imunní vůči elektromagnetickému rušení
- Vysoká přenosová rychlost
- Velké vzdálenosti bez zeslabení
- Bezpečnější (těžko odposlouchatelné)

*Nevýhody:*
- Vyšší cena
- Náročnější instalace
- Křehčí než metalické kabely

*Konektory:* LC, SC, ST, MTP/MPO

=== Koaxiální kabel
Starší technologie, dnes méně používaná v LAN.

*Použití:*
- Kabelová televize
- Starší sítě (10BASE2, 10BASE5)
- Připojení antén

=== Bezdrátová média
- *Wi-Fi* (802.11) -- bezdrátové LAN
- *Bluetooth* -- krátké vzdálenosti
- *Mobilní sítě* (4G, 5G)

== Vliv okolního prostředí na přenos dat

=== Útlum signálu (Attenuation)
*Zeslabení signálu* s rostoucí vzdáleností.
- U kroucené dvojlinky maximálně 100 m bez opakovače
- Řešení: zesilovače, opakovače (repeatery)

=== Elektromagnetické rušení (EMI)
*Interference* způsobená elektrickými zařízeními.
- Motory, transformátory, zářivky
- Řešení: stíněné kabely (STP), optické vlákno

=== Rádiové rušení (RFI)
*Rušení* od rádiových vysílačů a bezdrátových zařízení.
- Ovlivňuje hlavně bezdrátové sítě
- Řešení: změna kanálu, stínění

=== Přeslech (Crosstalk)
*Nežádoucí přenos signálu* mezi páry vodičů.
- *NEXT* (Near-End Crosstalk) -- přeslech na blízkém konci
- *FEXT* (Far-End Crosstalk) -- přeslech na vzdáleném konci
- Řešení: kroucení vodičů, kvalitní kabely

=== Další faktory
- *Teplota* -- ovlivňuje vlastnosti kabelů
- *Vlhkost* -- může způsobit korozi a zkraty
- *Mechanické namáhání* -- ohyby, přetížení kabelu
- *Délka kabelu* -- max. 100 m u Ethernetu na UTP

== Přístup k médiu (CSMA/CD - CSMA/CA)

=== CSMA/CD (Carrier Sense Multiple Access with Collision Detection)
Používá se v *klasických Ethernet sítích* s polovičním duplexem (half-duplex).

*Princip:*
1. *Carrier Sense* -- stanice naslouchá, zda médium není obsazené
2. *Multiple Access* -- více stanic má přístup ke stejnému médiu
3. *Collision Detection* -- detekce kolize při současném vysílání

*Postup:*
1. Stanice chce vysílat → naslouchá médiu
2. Je-li médium volné → začne vysílat
3. Detekuje-li kolizi → přeruší vysílání
4. Pošle *jam signál* (upozornění na kolizi)
5. Čeká *náhodnou dobu* (backoff algoritmus)
6. Opakuje pokus o vysílání

*Backoff algoritmus:*
- Náhodné čekání: 0 až (2^n - 1) časových slotů
- n = počet pokusů (max. 10)
- Po 16 pokusech → zrušení přenosu

*Poznámka:*
- Moderní sítě používají *full-duplex* a switche → CSMA/CD není potřeba
- Kolize se nevyskytují při full-duplex

=== CSMA/CA (Carrier Sense Multiple Access with Collision Avoidance)
Používá se v *bezdrátových sítích* (Wi-Fi, 802.11).

*Princip:*
- *Collision Avoidance* -- předcházení kolizím (nelze je detekovat u Wi-Fi)
- Stanice vysílá pouze po potvrzení, že médium je volné

*Postup:*
1. Stanice naslouchá médiu (Carrier Sense)
2. Je-li volné → čeká *DIFS* (Distributed Inter-Frame Space)
3. Médium stále volné → vysílá
4. Příjemce potvrdí přijetím *ACK* (Acknowledgment)
5. Je-li médium obsazené → čeká náhodnou dobu (backoff)

*RTS/CTS (Request to Send / Clear to Send):*
- Mechanismus pro předcházení kolizím
- Stanice pošle *RTS* → AP odpoví *CTS* → stanice může vysílat
- Řeší *hidden node problem* (skryté stanice)

*Rozdíly CSMA/CD vs CSMA/CA:*
#table(
  columns: (auto, auto, auto),
  [*Vlastnost*], [*CSMA/CD*], [*CSMA/CA*],
  [Použití], [Ethernet (drátové)], [Wi-Fi (bezdrátové)],
  [Detekce kolize], [Ano, během vysílání], [Ne, nelze detekovat],
  [Metoda], [Collision Detection], [Collision Avoidance],
  [Potvrzení], [Není potřeba], [ACK od příjemce],
  [Dnes], [Méně používáno (full-duplex)], [Stále používáno],
)

= Data-linková vrstva, Ethernet a základní funkce a konfigurace switche

== Úvod do linkové vrstvy
*Linková vrstva* (Data Link Layer) je 2. vrstva ISO-OSI modelu. Zajišťuje spolehlivý přenos dat mezi přímo spojenými zařízeními.

*Hlavní funkce:*
- *Rámcování* (Framing) -- rozděluje data do rámců
- *Fyzická adresace* -- používá MAC adresy
- *Kontrola chyb* -- detekce a případná korekce chyb (CRC, FCS)
- *Řízení přístupu k médiu* -- MAC (Media Access Control)
- *Flow control* -- řízení toku dat mezi zařízeními

*Rozdělení linkové vrstvy:*
- *LLC* (Logical Link Control) -- komunikace s vyšší vrstvou
- *MAC* (Media Access Control) -- přístup k médiu, rámcování

== Metody přístupu k médiu

=== Deterministické metody
- *Token Ring* -- token (žeton) obíhá v kruhu, pouze držitel může vysílat
- *Token Bus* -- podobné Token Ring, ale topologie sběrnice
- *Dnes zastaralé*, nahrazeno Ethernetem

=== Náhodné metody (Contention-based)
- *CSMA/CD* (Ethernet) -- viz fyzická vrstva
- *CSMA/CA* (Wi-Fi) -- viz fyzická vrstva
- *ALOHA* -- starý protokol pro bezdrátové sítě

=== Duplexní módy
- *Half-duplex* -- obousměrná komunikace, ale ne současně (nutný CSMA/CD)
- *Full-duplex* -- současná obousměrná komunikace (žádné kolize)

== Varianty Ethernetu na metalickém médiu

*Ethernet* je nejrozšířenější technologie pro LAN sítě.

*Označení:* rychlost + BASE/BROAD + typ média

#table(
  columns: (auto, auto, auto, auto, auto),
  [*Standard*], [*Rychlost*], [*Médium*], [*Max. vzdálenost*], [*Poznámka*],
  [10BASE-T], [10 Mbps], [UTP Cat 3], [100 m], [Starý standard],
  [100BASE-TX], [100 Mbps], [UTP Cat 5], [100 m], [Fast Ethernet],
  [1000BASE-T], [1 Gbps], [UTP Cat 5e/6], [100 m], [Gigabit Ethernet],
  [2.5GBASE-T], [2.5 Gbps], [UTP Cat 5e/6], [100 m], [Pro Wi-Fi 6],
  [5GBASE-T], [5 Gbps], [UTP Cat 6], [100 m], [Pro Wi-Fi 6E],
  [10GBASE-T], [10 Gbps], [UTP Cat 6a/7], [100 m], [Datacentra],
  [40GBASE-T], [40 Gbps], [UTP Cat 8], [30 m], [Datacentra],
)

*Staré standardy (historické):*
- *10BASE2* (Thin Ethernet) -- koaxiální kabel, max. 185 m, sběrnice
- *10BASE5* (Thick Ethernet) -- tlustý koaxiál, max. 500 m, sběrnice

*BASE vs BROAD:*
- *BASE* (Baseband) -- celá šířka pásma pro jeden signál
- *BROAD* (Broadband) -- rozdělení pásma pro více signálů

== Základní aktivní prvky v LAN

=== Hub (rozbočovač)
- *Vrstva 1* (fyzická) zařízení
- Pouze zesiluje a rozesílá signál na všechny porty
- Vytváří jednu *kolizní doménu*
- *Zastaralý*, dnes se nepoužívá
- Half-duplex provoz

=== Switch (přepínač)
- *Vrstva 2* (linková) zařízení
- Inteligentní přepínání rámců podle MAC adresy
- Každý port = samostatná *kolizní doména*
- Full-duplex provoz
- *Nejpoužívanější* prvek v LAN

=== Bridge (most)
- *Vrstva 2* zařízení
- Spojuje dvě sítě, filtruje provoz
- Předchůdce switche
- Dnes nahrazen switchy

=== Wireless Access Point (AP)
- *Vrstva 2* zařízení
- Připojení bezdrátových zařízení do LAN
- Převod mezi Wi-Fi a Ethernetem

== Fungování switche, MAC table, Store-and-Forward a Cut-Through Switching

=== MAC Address Table
*MAC tabulka* (CAM table) obsahuje mapování MAC adres na porty switche.

*Učení MAC adres:*
1. Rámec přijde na port
2. Switch zaznamená *zdrojovou MAC* adresu a číslo portu
3. Záznam má časový limit (typicky 300 s)
4. Pokud není provoz, záznam vyprší

*Přeposílání rámců:*
- *Unicast* -- cílová MAC je v tabulce → odeslat na konkrétní port
- *Unknown unicast* -- cílová MAC není v tabulce → *flood* (odeslat na všechny porty kromě příchozího)
- *Broadcast* -- cílová MAC FF:FF:FF:FF:FF:FF → odeslat na všechny porty
- *Multicast* -- skupinová adresa → podle konfigurace

=== Store-and-Forward
*Ukládá celý rámec* do paměti před přeposláním.

*Postup:*
1. Přijme celý rámec
2. Zkontroluje FCS (Frame Check Sequence)
3. Pokud je v pořádku → přepošle, jinak zahodí

*Výhody:*
- Kontrola chyb (CRC)
- Filtrování poškozených rámců
- Vyšší kvalita sítě

*Nevýhody:*
- Vyšší latence (zpoždění)

=== Cut-Through Switching
*Začne přeposílat* rámec ještě před jeho úplným přijetím.

*Varianty:*
- *Fast-forward* -- přepošle hned po přečtení cílové MAC (po 6 B)
- *Fragment-free* -- čeká prvních 64 B (min. velikost rámce), pak přepošle

*Výhody:*
- Nižší latence
- Rychlejší přenos

*Nevýhody:*
- Neprovádí kontrolu chyb
- Může přeposílat chybné rámce

=== Porovnání
#table(
  columns: (auto, auto, auto),
  [*Vlastnost*], [*Store-and-Forward*], [*Cut-Through*],
  [Latence], [Vyšší], [Nižší],
  [Kontrola chyb], [Ano (FCS)], [Ne],
  [Použití], [Běžné sítě], [Vysokorychlostní sítě],
  [Kvalita], [Vyšší], [Nižší],
)

== Broadcastová a kolizní doména

=== Kolizní doména (Collision Domain)
Oblast sítě, kde *může dojít ke kolizi* paketů.

*Vlastnosti:*
- Hub vytváří jednu velkou kolizní doménu
- *Switch* rozděluje síť na kolizní domény (každý port = jedna doména)
- Full-duplex eliminuje kolize

*Pravidlo:* Čím menší kolizní doména, tím lepší výkon.

=== Broadcastová doména (Broadcast Domain)
Oblast sítě, kam se *rozšíří broadcast* rámce.

*Vlastnosti:*
- Hub i switch *nerozdelují* broadcastovou doménu
- *Router* (vrstva 3) rozděluje broadcastové domény
- *VLAN* na switchi také rozděluje broadcastové domény

*Problém:* Velké broadcastové domény způsobují:
- Broadcast storm (zahltění sítě)
- Nižší výkon
- Problémy s bezpečností

*Řešení:*
- Segmentace sítě pomocí routerů
- Použití VLANů

=== Porovnání
#table(
  columns: (auto, auto, auto),
  [*Zařízení*], [*Kolizní doména*], [*Broadcastová doména*],
  [Hub], [1 velká], [1 velká],
  [Switch], [1 na port], [1 velká],
  [Router], [1 na port], [1 na port],
  [VLAN], [1 na port], [1 na VLAN],
)

== Problémy přepínaných sítí a řešení pomocí Spanning Tree protokolu

=== Redundance v síti
*Redundance* = záložní cesty pro zvýšení spolehlivosti sítě.

*Výhody:*
- Odolnost proti výpadkům
- Zvýšená dostupnost

*Problémy:*
- *Broadcast storm* -- broadcasty cirkulují donekonečna
- *Duplicitní rámce* -- stejný rámec přijde vícekrát
- *Nestabilní MAC tabulka* -- switch se "plete" na kterém portu je zařízení

=== Spanning Tree Protocol (STP)
*STP* (IEEE 802.1D) logicky blokuje redundantní cesty, aby se zabránilo smyčkám.

*Princip:*
1. Volba *Root Bridge* (kořenový switch) -- nejnižší Bridge ID
2. Určení *Root Portů* -- nejlepší cesta k Root Bridge
3. Určení *Designated Portů* -- jeden pro každý segment
4. *Blokování* ostatních portů (Alternate/Backup)

*Stavy portů STP:*
- *Blocking* -- port je blokovaný, nepřeposílá data
- *Listening* -- naslouchá BPDU (Bridge Protocol Data Units)
- *Learning* -- učí se MAC adresy, ale nepřeposílá data
- *Forwarding* -- plně funkční, přeposílá data
- *Disabled* -- vypnutý administrátorem

*Konvergence:* čas potřebný k přepočítání topologie (30-50 s u klasického STP)

=== Vylepšené verze STP

*RSTP (Rapid STP):*
- IEEE 802.1w
- Rychlejší konvergence (typicky \<1 s)
- Kompatibilní se STP

*PVST+ (Per-VLAN STP):*
- Cisco proprietární
- Samostatná STP instance pro každý VLAN

*MST (Multiple Spanning Tree):*
- IEEE 802.1s
- Více VLANů sdílí jednu STP instanci
- Efektivnější než PVST+

=== PortFast a BPDU Guard
*PortFast:*
- Port okamžitě přejde do Forwarding stavu
- Pouze pro koncová zařízení (PC, servery)
- Zrychlí připojení zařízení

*BPDU Guard:*
- Ochrána před nechtěným připojením switche na PortFast port
- Při přijetí BPDU → port se vypne (err-disabled)

= Síťová vrstva, ARP, základní konfigurace routeru

== Síťová vrstva a její funkce
*Síťová vrstva* (Network Layer) je 3. vrstva ISO-OSI modelu. Zajišťuje směrování paketů mezi různými sítěmi.

*Hlavní funkce:*
- *Logická adresace* -- používá IP adresy (IPv4, IPv6)
- *Směrování* (Routing) -- určování nejlepší cesty k cíli
- *Přeposílání* (Forwarding) -- posílání paketů na další router
- *Zapouzdření* -- vytváří IP pakety
- *Fragmentace* -- rozdělení velkých paketů
- *QoS* -- Quality of Service, prioritizace provozu

*Co síťová vrstva NEŘEŠÍ:*
- Spolehlivost přenosu (to je úkol TCP na vrstvě 4)
- Kontrolu chyb v datech
- Navazování spojení

== Protokoly na síťové vrstvě

=== IP (Internet Protocol)
*Hlavní protokol* síťové vrstvy.

*Verze:*
- *IPv4* -- 32bitová adresa (např. 192.168.1.1)
- *IPv6* -- 128bitová adresa (např. 2001:db8::1)

*Vlastnosti:*
- Nespolehlivý protokol (best effort)
- Bez záruky doručení
- Může dojít ke ztrátě, duplikaci nebo nesprávnému pořadí paketů

=== ICMP (Internet Control Message Protocol)
*Diagnostický protokol* pro hlášení chyb a testování.

*Použití:*
- *Ping* -- test dostupnosti (Echo Request/Reply)
- *Traceroute* -- zjištění cesty k cíli
- *Destination Unreachable* -- cíl není dostupný
- *Time Exceeded* -- TTL vypršelo

=== ARP (Address Resolution Protocol)
Převod *IP adresy na MAC* adresu (viz níže).

=== IGMP (Internet Group Management Protocol)
Správa *multicastových* skupin v IPv4.

== Router a jeho fungování
*Router* (směrovač) je zařízení síťové vrstvy, které propojuje různé sítě.

*Hlavní funkce:*
- *Směrování* -- určení nejlepší cesty pomocí směrovací tabulky
- *Přeposílání* -- předání paketu na další rozhraní
- *Rozdělení broadcastových domén* -- každý port = jiná doména
- *Filtrování provozu* pomocí ACL (Access Control Lists)

*Směrovací tabulka (Routing Table):*
Obsahuje informace o dostupných sítích:
- *Cílová síť* -- síťová adresa
- *Maska sítě* -- prefix
- *Next hop* -- IP adresa dalšího routeru
- *Výstupní rozhraní* -- port pro odeslání
- *Metrika* -- cena cesty
- *Zdroj* -- jak byla cesta zjištěna (C = Connected, S = Static, R = RIP, O = OSPF, D = EIGRP)

*Postup přeposílání paketu:*
1. Router přijme paket
2. Zkontroluje cílovou IP adresu
3. Vyhledá v směrovací tabulce odpovídající záznam (longest prefix match)
4. Sníží TTL (Time to Live) o 1
5. Přepočítá kontrolní součet
6. Přepošle paket na výstupní rozhraní

== Základní konfigurace routeru

=== Cisco IOS (Internetwork Operating System)
*IOS* je operační systém pro Cisco zařízení (routery, switche).

*Vlastnosti:*
- Příkazový řádek (CLI)
- Hierarchická struktura módů
- Historie příkazů
- Nápověda (?, Tab)
- Zkrácené příkazy (povoleno)

=== Módy routeru

*Hierarchie módů:*

1. *User EXEC Mode* (Uživatelský mód)
  - Prompt: `Router>`
  - Omezené příkazy (show, ping)
  - Nelze měnit konfiguraci

2. *Privileged EXEC Mode* (Privilegovaný mód)
  - Vstup: `enable`
  - Prompt: `Router#`
  - Všechny show příkazy, debug
  - Přístup ke všem funkcím

3. *Global Configuration Mode* (Globální konfigurační mód)
  - Vstup: `configure terminal` nebo `conf t`
  - Prompt: `Router(config)#`
  - Konfigurace celého routeru

4. *Interface Configuration Mode* (Konfigurační mód rozhraní)
  - Vstup: `interface <type> <number>` např. `interface gigabitEthernet 0/0`
  - Prompt: `Router(config-if)#`
  - Konfigurace konkrétního rozhraní

5. *Line Configuration Mode* (Konfigurační mód linky)
  - Vstup: `line console 0` nebo `line vty 0 4`
  - Prompt: `Router(config-line)#`
  - Konfigurace přístupu (console, VTY)

*Navigace mezi módy:*
- `enable` -- User → Privileged
- `configure terminal` -- Privileged → Global Config
- `exit` -- návrat o úroveň zpět
- `end` nebo `Ctrl+Z` -- návrat do Privileged EXEC
- `disable` -- Privileged → User

=== Možné způsoby přístupu na router

1. *Console* (konzolový port)
  - Přímé kabelové připojení (RJ-45 nebo USB)
  - Výchozí přístup při prvním nastavení
  - Vždy dostupný

2. *Telnet*
  - Vzdálený přístup přes síť
  - *Nezabezpečený* (hesla v plain textu)
  - Port 23
  - Příkaz: `telnet <IP_adresa>`

3. *SSH* (Secure Shell)
  - Zabezpečený vzdálený přístup
  - Šifrovaná komunikace
  - Port 22
  - Příkaz: `ssh -l <username> <IP_adresa>`
  - *Doporučeno* místo Telnetu

4. *Auxiliary Port*
  - Připojení přes modem
  - Záložní přístup
  - Dnes méně používáno

=== Zabezpečení routeru

*Nastavení hesel:*

```
! Privileged EXEC heslo (šifrované)
Router(config)# enable secret <heslo>

! Console heslo
Router(config)# line console 0
Router(config-line)# password <heslo>
Router(config-line)# login

! VTY heslo (Telnet/SSH)
Router(config)# line vty 0 4
Router(config-line)# password <heslo>
Router(config-line)# login

! Šifrování hesel v konfiguraci
Router(config)# service password-encryption
```

*Konfigurace SSH:*

```
! Nastavení hostname a domény
Router(config)# hostname R1
R1(config)# ip domain-name example.com

! Generování RSA klíče
R1(config)# crypto key generate rsa
! (zvolte velikost 1024 nebo 2048 bitů)

! Vytvoření uživatele
R1(config)# username admin privilege 15 secret <heslo>

! Povolení pouze SSH na VTY
R1(config)# line vty 0 4
R1(config-line)# transport input ssh
R1(config-line)# login local
```

*Další zabezpečení:*
- *Timeout* -- `exec-timeout <minuty> <sekundy>`
- *Banner* -- varovné hlášení: `banner motd # Text #`
- *ACL* -- omezení přístupu pouze z určitých IP
- *Disable unused services* -- vypnutí nepotřebných služeb

=== Aktivace rozhraní a zálohování konfigurace

*Aktivace rozhraní:*

```
! Vstup do módu rozhraní
Router(config)# interface gigabitEthernet 0/0

! Nastavení IP adresy a masky
Router(config-if)# ip address 192.168.1.1 255.255.255.0

! Popis rozhraní (volitelné)
Router(config-if)# description Pripojeni k LAN

! Aktivace rozhraní (rozhraní jsou defaultně vypnutá)
Router(config-if)# no shutdown
```

*Typy konfigurací:*
- *Running-config* -- aktivní konfigurace v RAM (ztratí se po restartu)
- *Startup-config* -- uložená konfigurace v NVRAM (přetrvá restart)

*Zálohování konfigurace:*

```
! Zobrazení běžící konfigurace
Router# show running-config

! Uložení running-config do startup-config
Router# copy running-config startup-config
! nebo kratší verze:
Router# write
Router# wr

! Záloha na TFTP server
Router# copy running-config tftp:
! (zadáte IP serveru a jméno souboru)

! Záloha na USB
Router# copy running-config usbflash0:backup.cfg

! Obnovení konfigurace ze startup-config
Router# copy startup-config running-config

! Smazání startup-config
Router# erase startup-config
```

=== Nástroje pro kontrolu nastavení routeru

*Základní show příkazy:*

```
! Zobrazení běžící konfigurace
Router# show running-config

! Zobrazení uložené konfigurace
Router# show startup-config

! Stav rozhraní
Router# show ip interface brief
Router# show interfaces
Router# show interfaces gigabitEthernet 0/0

! Směrovací tabulka
Router# show ip route

! ARP tabulka
Router# show arp

! Informace o routeru
Router# show version

! Protokoly
Router# show protocols

! Statistiky rozhraní
Router# show interfaces statistics

! CDP (Cisco Discovery Protocol) - sousední zařízení
Router# show cdp neighbors
Router# show cdp neighbors detail
```

*Diagnostické nástroje:*

```
! Ping - test dostupnosti
Router# ping 8.8.8.8

! Traceroute - zjištění cesty
Router# traceroute 8.8.8.8

! Debug (opatrně, zatěžuje CPU!)
Router# debug ip packet
Router# undebug all  ! vypnutí všech debugů
```

*Filtrování výstupu:*
```
! Zobrazit pouze řádky obsahující "interface"
Router# show running-config | include interface

! Zobrazit sekci začínající "interface"
Router# show running-config | section interface

! Začít od řádku obsahující "line"
Router# show running-config | begin line
```

== ARP (Address Resolution Protocol)

*ARP* převádí *IP adresu na MAC* adresu v lokální síti (IPv4).

*Princip:*
1. Zařízení chce komunikovat s IP v lokální síti
2. Zkontroluje ARP cache (tabulku)
3. Pokud MAC není v cache → pošle *ARP Request* (broadcast)
  - "Kdo má IP 192.168.1.10? Řekněte mi na MAC aa:bb:cc:dd:ee:ff"
4. Zařízení s danou IP odpoví *ARP Reply* (unicast)
  - "To jsem já, moje MAC je 11:22:33:44:55:66"
5. Odesílatel si uloží odpověď do ARP cache

*ARP tabulka:*
- Dočasné mapování IP ↔ MAC
- Časový limit (typicky 2-20 minut)
- Zobrazení: `show arp` nebo `arp -a` (na PC)

*Typy ARP:*
- *ARP Request* -- broadcast (FF:FF:FF:FF:FF:FF)
- *ARP Reply* -- unicast odpověď
- *Gratuitous ARP* -- zařízení oznamuje svou IP (detekce konfliktů)
- *Proxy ARP* -- router odpovídá za jiné zařízení

*RARP (Reverse ARP):*
- Opačný proces: MAC → IP
- Dnes nahrazen DHCP

*IPv6 ekvivalent:*
- *NDP* (Neighbor Discovery Protocol) -- používá ICMPv6
- *Neighbor Solicitation* místo ARP Request
- *Neighbor Advertisement* místo ARP Reply

= IPv4 a IPv6 adresace, podsítě

== Verze IP adres

=== IPv4 (Internet Protocol version 4)
*Základní informace:*
- *Délka adresy:* 32 bitů (4 oktety)
- *Zápis:* Desítkový s tečkami (dotted-decimal) -- `192.168.1.1`
- *Množství adres:* 2^32 = 4 294 967 296 adres (~4,3 miliardy)
- *Problém:* Vyčerpání adres (Address exhaustion)
- *Stav:* Stále široce používaný

=== IPv6 (Internet Protocol version 6)
*Základní informace:*
- *Délka adresy:* 128 bitů (16 oktetů)
- *Zápis:* Hexadecimální s dvojtečkami -- `2001:0db8:85a3:0000:0000:8a2e:0370:7334`
- *Množství adres:* 2^128 = 340 undecilionů adres (340 × 10^36)
- *Výhody:* Prakticky neomezený počet adres, lepší bezpečnost, zjednodušená hlavička
- *Stav:* Postupné zavádění

*IPv6 zkrácený zápis:*
- Vedoucí nuly lze vynechat: `2001:db8:85a3:0:0:8a2e:370:7334`
- Posloupnost nul nahradit `::` (pouze jednou): `2001:db8:85a3::8a2e:370:7334`
- Loopback: `::1` (odpovídá `127.0.0.1` v IPv4)

*Porovnání:*
#table(
  columns: (auto, auto, auto),
  [*Vlastnost*], [*IPv4*], [*IPv6*],
  [Délka], [32 bitů], [128 bitů],
  [Zápis], [Desítkový], [Hexadecimální],
  [Počet adres], [4,3 miliardy], [340 undecilionů],
  [Broadcast], [Ano], [Ne (multicast)],
  [NAT], [Běžně používán], [Není potřeba],
  [Hlavička], [Variabilní (20-60 B)], [固ní (40 B)],
)

== Struktura a části IPv4 adresy

=== Části IPv4 adresy
Každá IPv4 adresa se skládá ze dvou logických částí:

1. *Network ID (síťová část)*
  - Identifikuje konkrétní síť
  - Společná pro všechna zařízení v síti
  - Určena maskou sítě

2. *Host ID (hostitelská část)*
  - Identifikuje konkrétní zařízení v síti
  - Unikátní v rámci dané sítě
  - Určena maskou sítě

=== Použití masky sítě
*Maska sítě* (Subnet Mask) určuje hranici mezi síťovou a hostitelskou částí.

*Formáty zápisu:*
- *Desítkový:* `255.255.255.0`
- *CIDR notace:* `/24` (počet jedničkových bitů)
- *Binární:* `11111111.11111111.11111111.00000000`

*Vlastnosti masky:*
- Jedničky = síťová část
- Nuly = hostitelská část
- Musí být souvislé jedničky zleva

*Příklad analýzy adresy:*
```
IP adresa:    192.168.1.10
Maska:        255.255.255.0  (/24)

Binární reprezentace:
IP:           11000000.10101000.00000001.00001010
Maska:        11111111.11111111.11111111.00000000
              └────── Network ID ────────┘└ Host ┘

Network ID:   192.168.1.0
Host ID:      0.0.0.10
```

*Výpočet důležitých adres:*
- *Síťová adresa:* Všechny hostitelské bity = 0 → `192.168.1.0`
- *Broadcast adresa:* Všechny hostitelské bity = 1 → `192.168.1.255`
- *První použitelná:* Síťová + 1 → `192.168.1.1`
- *Poslední použitelná:* Broadcast - 1 → `192.168.1.254`
- *Počet hostů:* 2^(hostitelské bity) - 2 → 2^8 - 2 = 254

== Třídy IPv4 adres

*Třídní adresace* (Classful addressing) je historický systém rozdělení IP adres. Dnes je nahrazen CIDR (beztřídní), ale stále se učí pro pochopení základů.

=== Třída A
*Charakteristika:*
- *První bit:* 0
- *Rozsah:* `1.0.0.0` až `126.255.255.255`
- *Výchozí maska:* `/8` nebo `255.0.0.0`
- *Formát:* N.H.H.H (N = Network, H = Host)
- *Počet sítí:* 126 (0 a 127 jsou rezervované)
- *Počet hostů na síť:* 16 777 214 (2^24 - 2)
- *Určeno pro:* Velmi velké organizace

*Příklad:* `10.0.0.0/8` (privátní síť třídy A)

=== Třída B
*Charakteristika:*
- *První dva bity:* 10
- *Rozsah:* `128.0.0.0` až `191.255.255.255`
- *Výchozí maska:* `/16` nebo `255.255.0.0`
- *Formát:* N.N.H.H
- *Počet sítí:* 16 384
- *Počet hostů na síť:* 65 534 (2^16 - 2)
- *Určeno pro:* Střední a velké organizace

*Příklad:* `172.16.0.0/16` (privátní síť třídy B)

=== Třída C
*Charakteristika:*
- *První tři bity:* 110
- *Rozsah:* `192.0.0.0` až `223.255.255.255`
- *Výchozí maska:* `/24` nebo `255.255.255.0`
- *Formát:* N.N.N.H
- *Počet sítí:* 2 097 152
- *Počet hostů na síť:* 254 (2^8 - 2)
- *Určeno pro:* Malé organizace a domácnosti

*Příklad:* `192.168.1.0/24` (privátní síť třídy C)

=== Třída D (Multicast)
*Charakteristika:*
- *První čtyři bity:* 1110
- *Rozsah:* `224.0.0.0` až `239.255.255.255`
- *Účel:* Multicastové přenosy (jeden odesílatel, více příjemců)
- *Nelze přiřadit* hostům jako unicast adresu

*Příklady použití:*
- `224.0.0.1` -- všechny systémy v podsíti
- `224.0.0.2` -- všechny routery v podsíti
- `224.0.0.9` -- RIPv2
- `224.0.0.5` a `224.0.0.6` -- OSPF

=== Třída E (Experimentální)
*Charakteristika:*
- *První čtyři bity:* 1111
- *Rozsah:* `240.0.0.0` až `255.255.255.255`
- *Účel:* Rezervováno pro experimentální použití
- *Není* používána v běžné síťové komunikaci

*Souhrn tříd:*
#table(
  columns: (auto, auto, auto, auto, auto),
  [*Třída*], [*Rozsah*], [*Maska*], [*Sítě*], [*Hosté/síť*],
  [A], [1-126], [/8], [126], [16 777 214],
  [B], [128-191], [/16], [16 384], [65 534],
  [C], [192-223], [/24], [2 097 152], [254],
  [D], [224-239], [-], [Multicast], [-],
  [E], [240-255], [-], [Experimentální], [-],
)

*Poznámka:* Dnes se používá *CIDR* (Classless Inter-Domain Routing), který umožňuje flexibilnější dělení adresního prostoru.

== Veřejné a privátní adresy

=== Veřejné IP adresy (Public)
*Vlastnosti:*
- *Globálně unikátní* -- každá veřejná adresa je na Internetu jedinečná
- *Směrovatelné po Internetu* -- lze je použít pro komunikaci přes Internet
- *Přiděluje* IANA a regionální RIR (Regional Internet Registries)
- *Jsou zpoplatněné* -- organizace musí platit za přidělený blok
- *Omezený počet* -- IPv4 adresy jsou téměř vyčerpány

*Použití:*
- Webové servery
- Mailové servery
- Veřejně přístupné služby
- WAN rozhraní routerů

=== Privátní IP adresy (Private)
*Vlastnosti:*
- *Nejsou směrovatelné* po Internetu
- *Lze používat opakovaně* v různých organizacích
- *Zdarma* -- není potřeba registrace
- *Definovány v RFC 1918*
- *Vyžadují NAT* pro přístup na Internet

=== Privátní rozsahy (RFC 1918)

1. *Třída A:*
  - Rozsah: `10.0.0.0` až `10.255.255.255`
  - CIDR: `10.0.0.0/8`
  - Počet adres: 16 777 216
  - Použití: Velké organizace, datacentra

2. *Třída B:*
  - Rozsah: `172.16.0.0` až `172.31.255.255`
  - CIDR: `172.16.0.0/12`
  - Počet adres: 1 048 576
  - Použití: Střední organizace, podnikové sítě

3. *Třída C:*
  - Rozsah: `192.168.0.0` až `192.168.255.255`
  - CIDR: `192.168.0.0/16`
  - Počet adres: 65 536
  - Použití: Domácnosti, malé kanceláře (SOHO)

=== Speciální adresy

*Další důležité rozsahy:*
- *Loopback:* `127.0.0.0/8` -- testování síťového zásobníku (`127.0.0.1`)
- *APIPA:* `169.254.0.0/16` -- automatické přidělení při selhání DHCP
- *Link-local:* `169.254.0.0/16` -- komunikace pouze v lokálním segmentu
- *Default route:* `0.0.0.0` -- výchozí cesta, "jakákoliv adresa"
- *Broadcast:* `255.255.255.255` -- broadcast všem v lokální síti

=== NAT (Network Address Translation)
*Důvod použití:*
- Umožňuje více zařízením s privátními adresami sdílet jednu veřejnou IP
- Šetří veřejné IPv4 adresy
- Poskytuje základní bezpečnost (skrytí vnitřní topologie)

*Princip:*
1. Interní zařízení má privátní IP (např. `192.168.1.10`)
2. Router s NAT přeloží privátní IP na svou veřejnou IP
3. Odpověď je přeložena zpět na privátní IP

== Statické a dynamické přidělování IP adres

=== Statické přidělování (Static)
*Ruční konfigurace* IP adresy administrátorem.

*Postup:*
- Administrátor nastaví IP adresu, masku, bránu a DNS ručně
- Adresa zůstává stejná i po restartu

*Výhody:*
- Kontrola nad adresou -- vždy stejná IP
- Vhodné pro servery a síťová zařízení
- Žádná závislost na DHCP serveru
- Jednodušší řešení problémů

*Nevýhody:*
- Časově náročné při velkém počtu zařízení
- Riziko chyby (duplicitní IP, špatná maska)
- Nutnost manuální správy dokumentace
- Změna konfigurace vyžaduje fyzický přístup nebo vzdálenou správu

*Použití:*
- Servery (web, mail, DNS, DHCP)
- Routery a switche
- Tiskárny a síťové kopírky
- Kamery a IoT zařízení
- Důležitá infrastruktura

=== Dynamické přidělování (Dynamic)
*Automatická konfigurace* pomocí DHCP (Dynamic Host Configuration Protocol).

*Princip DHCP:*
1. *DHCP Discover* -- klient hledá DHCP server (broadcast)
2. *DHCP Offer* -- server nabídne IP adresu
3. *DHCP Request* -- klient žádá o nabídnutou adresu
4. *DHCP Acknowledgment* -- server potvrdí přidělení

*DHCP přiděluje:*
- IP adresu
- Masku sítě
- Výchozí bránu (default gateway)
- DNS servery
- Volitelně: NTP, WINS, domain name

*Výhody:*
- Automatická konfigurace -- plug and play
- Centralizovaná správa
- Minimalizace chyb
- Efektivní využití IP adres (lease time)
- Snadné změny konfigurace (stačí změnit na serveru)

*Nevýhody:*
- Závislost na DHCP serveru (single point of failure)
- IP adresa se může měnit
- Složitější troubleshooting
- Nutnost správy DHCP serveru

*Použití:*
- Koncová zařízení uživatelů (PC, notebooky)
- Mobilní zařízení (telefony, tablety)
- Zařízení s krátkodobým připojením
- Velké sítě s mnoha uživateli

=== DHCP Reservation
*Kompromis* mezi statickým a dynamickým přidělováním.

- DHCP server přiděluje *vždy stejnou IP* konkrétnímu zařízení
- Vazba na *MAC adresu* zařízení
- Výhody dynamického přidělování + stálá adresa
- Vhodné pro tiskárny, servery bez statické IP

=== Porovnání
#table(
  columns: (auto, auto, auto),
  [*Vlastnost*], [*Statické*], [*Dynamické (DHCP)*],
  [Konfigurace], [Ruční], [Automatická],
  [Stálost IP], [Ano], [Ne (může se měnit)],
  [Správa], [Náročná], [Jednoduchá],
  [Vhodné pro], [Servery, infrastrukturu], [Klienty, běžná zařízení],
  [Chyby], [Větší riziko], [Minimální],
  [Závislost], [Žádná], [DHCP server],
)

== Důvody vytváření podsítí (Subnetting)

*Subnetting* = rozdělení velké sítě na menší logické celky (podsítě).

=== Hlavní důvody

1. *Efektivní využití IP adres*
  - Přidělení přesného počtu adres podle potřeby
  - Eliminace plýtvání adresami
  - Příklad: Místo /24 (254 hostů) použít /27 (30 hostů) pro malou kancelář

2. *Zlepšení výkonu sítě*
  - Menší broadcastové domény
  - Snížení broadcastového provozu
  - Rychlejší odezva sítě
  - Menší zatížení zařízení

3. *Zvýšení bezpečnosti*
  - Izolace oddělení (HR, Finance, IT)
  - Lepší kontrola přístupu pomocí ACL
  - Omezení šíření útoků
  - Segmentace kritických systémů

4. *Lepší správa sítě*
  - Logické rozdělení podle funkcí
  - Snadnější troubleshooting
  - Přehlednější struktura
  - Jednodušší dokumentace

5. *Geografické rozdělení*
  - Různé podsítě pro různé budovy/patra
  - Snadnější identifikace umístění zařízení
  - Lokalizace problémů

6. *Optimalizace směrování*
  - Sumarizace tras (Route Summarization)
  - Menší směrovací tabulky
  - Rychlejší konvergence

=== Příklad použití subnettingu

*Zadání:* Firma má síť `192.168.1.0/24` a potřebuje:
- Oddělení 1: 50 hostů
- Oddělení 2: 25 hostů
- Oddělení 3: 10 hostů
- Servery: 5 hostů

*Řešení:*
- Oddělení 1: `192.168.1.0/26` (62 použitelných adres)
- Oddělení 2: `192.168.1.64/27` (30 použitelných adres)
- Oddělení 3: `192.168.1.96/28` (14 použitelných adres)
- Servery: `192.168.1.112/29` (6 použitelných adres)

*Výhody tohoto rozdělení:*
- Každé oddělení má vlastní broadcastovou doménu
- Lze nastavit různá bezpečnostní pravidla
- Lepší identifikace zdroje provozu
- Efektivní využití adresního prostoru

=== VLSM (Variable Length Subnet Mask)
*VLSM* umožňuje použití *různých masek* v rámci jedné sítě.

*Výhody:*
- Maximální efektivita využití adres
- Flexibilnější rozdělení
- Podpora moderními směrovacími protokoly (RIPv2, EIGRP, OSPF)

*Poznámka:* Staré protokoly (RIPv1) VLSM nepodporují.

= Transportní a aplikační vrstva, ICMP

== Transportní vrstva a její funkce

*Transportní vrstva* (Transport Layer) je 4. vrstva ISO-OSI modelu. Zajišťuje komunikaci mezi aplikacemi na různých zařízeních.

*Hlavní funkce:*
- *End-to-end komunikace* -- komunikace mezi aplikacemi, ne mezi zařízeními
- *Segmentace dat* -- rozdělení dat na menší části (segmenty)
- *Multiplexování* -- více aplikací může komunikovat současně
- *Spolehlivost* (u TCP) -- zajištění doručení dat
- *Řízení toku* -- zabránění zahlcení příjemce
- *Řízení zahlcení* -- zabránění zahlcení sítě

*Adresace:*
- Používá *porty* (port numbers) pro identifikaci aplikací
- Kombinace IP adresy + port = socket

== Protokoly transportní vrstvy

=== TCP vs UDP - Porovnání

#table(
  columns: (auto, auto, auto),
  [*Vlastnost*], [*TCP*], [*UDP*],
  [Název], [Transmission Control Protocol], [User Datagram Protocol],
  [Typ], [Spojovaný (connection-oriented)], [Nespojovaný (connectionless)],
  [Spolehlivost], [Ano -- zaručené doručení], [Ne -- best effort],
  [Potvrzování], [Ano (ACK)], [Ne],
  [Řazení dat], [Ano -- správné pořadí], [Ne -- může být změněno],
  [Kontrola chyb], [Ano -- retransmise], [Základní (checksum)],
  [Rychlost], [Pomalejší], [Rychlejší],
  [Režie], [Větší -- 20 B hlavička], [Menší -- 8 B hlavička],
  [Řízení toku], [Ano (flow control)], [Ne],
  [Použití], [HTTP, FTP, SSH, SMTP], [DNS, DHCP, VoIP, streaming],
)

=== TCP (Transmission Control Protocol)

*Charakteristika:*
- *Spolehlivý* přenos -- zajišťuje doručení všech dat
- *Spojovaný* -- nejprve naváže spojení
- *Sekvencování* -- data dorazí ve správném pořadí
- *Duplex* -- obousměrná komunikace

*TCP hlavička:*
- Zdrojový a cílový port (16 bitů každý)
- Sekvenční číslo (32 bitů) -- pořadí segmentu
- Potvrzovací číslo (32 bitů) -- ACK
- Příznaky (flags): SYN, ACK, FIN, RST, PSH, URG
- Window size -- velikost přijímacího okna
- Checksum -- kontrolní součet

==== Navázání komunikace (Three-Way Handshake)

*Postup navázání TCP spojení:*

1. *SYN* -- Klient → Server
  - Klient pošle segment s příznakem SYN
  - Obsahuje počáteční sekvenční číslo (ISN)
  - "Chci navázat spojení"

2. *SYN-ACK* -- Server → Klient
  - Server potvrdí příznakem SYN + ACK
  - Obsahuje své sekvenční číslo
  - Potvrzuje klientovo číslo + 1
  - "Souhlasím, můžeme komunikovat"

3. *ACK* -- Klient → Server
  - Klient potvrdí příznakem ACK
  - Potvrzuje serverovo číslo + 1
  - "Spojení navázáno"

*Po dokončení:* Spojení je navázáno, lze přenášet data.

==== Ukončení komunikace (Four-Way Handshake)

*Postup ukončení TCP spojení:*

1. *FIN* -- Strana A → Strana B
  - "Chci ukončit spojení, už nemám data"

2. *ACK* -- Strana B → Strana A
  - "Rozumím, beru na vědomí"

3. *FIN* -- Strana B → Strana A
  - "I já chci ukončit spojení"

4. *ACK* -- Strana A → Strana B
  - "Potvrzuji, spojení ukončeno"

*Poznámka:* Obě strany musí explicitně uzavřít spojení.

*Okamžité ukončení:*
- *RST* (Reset) -- okamžité násilné ukončení
- Použití při chybách nebo odmítnutí spojení

==== Ztráta a seřazení datagramů

*Seřazení datagramů:*
- Každý segment má *sekvenční číslo*
- Příjemce řadí segmenty podle sekvenčních čísel
- Pokud přijdou segmenty mimo pořadí → uloží do bufferu a seřadí

*Řešení ztráty datagramů:*

1. *Potvrzování (Acknowledgment):*
  - Příjemce potvrzuje přijatá data pomocí ACK
  - ACK obsahuje číslo dalšího očekávaného bytu

2. *Timeout a retransmise:*
  - Odesílatel čeká na ACK po určitou dobu (RTO - Retransmission Timeout)
  - Pokud nepřijde ACK → znovu odešle segment

3. *Selektivní potvrzování (SACK):*
  - Příjemce může potvrdit konkrétní přijaté segmenty
  - Odesílatel znovuodešle pouze chybějící segmenty

*Řízení toku (Flow Control):*
- *Sliding Window* -- posuvné okno
- Příjemce oznamuje velikost volného bufferu (Window Size)
- Odesílatel nepošle více dat, než příjemce může zpracovat

*Řízení zahlcení (Congestion Control):*
- *Slow Start* -- postupné zvyšování rychlosti
- *Congestion Avoidance* -- předcházení zahlcení
- *Fast Retransmit* -- rychlá retransmise při duplicitních ACK
- *Fast Recovery* -- rychlé zotavení po ztrátě

=== UDP (User Datagram Protocol)

*Charakteristika:*
- *Nespolehlivý* -- bez záruky doručení
- *Nespojovaný* -- bez navazování spojení
- *Jednoduchý* -- minimální režie
- *Rychlý* -- vhodný pro real-time aplikace

*UDP hlavička (pouze 8 bajtů):*
- Zdrojový port (16 bitů)
- Cílový port (16 bitů)
- Délka (16 bitů)
- Checksum (16 bitů) -- volitelný v IPv4, povinný v IPv6

*Výhody UDP:*
- Nízká latence
- Malá režie
- Vhodné pro broadcast/multicast
- Aplikace si řídí spolehlivost sama

*Nevýhody UDP:*
- Žádné potvrzování
- Data mohou být ztracena
- Data mohou přijít v nesprávném pořadí
- Data mohou být duplikována

*Použití UDP:*
- *DNS* -- rychlé dotazy
- *DHCP* -- konfigurace síťových parametrů
- *SNMP* -- správa sítě
- *VoIP* -- hlasová komunikace (malé zpoždění důležitější než dokonalá kvalita)
- *Streaming* -- video/audio (ztráta několik paketů nevadí)
- *Online hry* -- real-time akce

== Porty aplikací a služeb

*Port* = 16bitové číslo (0-65535) identifikující aplikaci nebo službu.

=== Rozdělení portů

*Well-Known Ports (0-1023):*
- Rezervované pro standardní služby
- Vyžadují administrátorská práva
- Přiděluje IANA

*Registered Ports (1024-49151):*
- Registrované pro konkrétní aplikace
- Může je použít kdokoliv, ale mají přiřazené aplikace

*Dynamic/Private Ports (49152-65535):*
- Dočasné porty pro klientské aplikace
- Ephemeral ports -- přidělované automaticky

=== Důležité porty

*Web služby:*
- *20, 21* -- FTP (File Transfer Protocol) -- Data / Control
- *22* -- SSH (Secure Shell) -- zabezpečený vzdálený přístup
- *23* -- Telnet -- nezabezpečený vzdálený přístup
- *25* -- SMTP (Simple Mail Transfer Protocol) -- odesílání emailů
- *53* -- DNS (Domain Name System) -- překlad doménových jmen (TCP i UDP)
- *67, 68* -- DHCP (Dynamic Host Configuration Protocol) -- UDP
- *80* -- HTTP (Hypertext Transfer Protocol) -- webové stránky
- *110* -- POP3 (Post Office Protocol v3) -- příjem emailů
- *143* -- IMAP (Internet Message Access Protocol) -- příjem emailů
- *443* -- HTTPS (HTTP Secure) -- šifrované webové stránky
- *3389* -- RDP (Remote Desktop Protocol) -- vzdálená plocha Windows

*Databáze:*
- *3306* -- MySQL
- *5432* -- PostgreSQL
- *1433* -- Microsoft SQL Server

*Další protokoly:*
- *161, 162* -- SNMP (Simple Network Management Protocol) -- správa sítě
- *389* -- LDAP (Lightweight Directory Access Protocol)
- *445* -- SMB (Server Message Block) -- sdílení souborů Windows

*Příklad socket:*
- Server: `192.168.1.10:80` (webový server)
- Klient: `192.168.1.100:54321` (dočasný port)

== Protokoly aplikační vrstvy

*Aplikační vrstva* (Application Layer) je 7. vrstva ISO-OSI (nebo 4. vrstva TCP/IP). Poskytuje síťové služby přímo aplikacím.

=== HTTP/HTTPS (Hypertext Transfer Protocol)

*HTTP:*
- Protokol pro přenos webových stránek
- Port 80 (TCP)
- Bezstavový protokol (stateless)
- Metody: GET, POST, PUT, DELETE, HEAD, OPTIONS

*HTTPS:*
- Zabezpečená verze HTTP
- Port 443 (TCP)
- Šifrování pomocí SSL/TLS
- Ochrana proti odposlechu a změně dat
- Vyžaduje certifikát

*HTTP/2 a HTTP/3:*
- HTTP/2 -- multiplexing, komprese hlaviček (přes TCP)
- HTTP/3 -- postaveno na QUIC protokolu (přes UDP)

=== FTP (File Transfer Protocol)

*Charakteristika:*
- Přenos souborů mezi klientem a serverem
- Port 21 (kontrolní spojení), port 20 (datové spojení)
- Podporuje autentizaci (username/password)
- Dva módy: aktivní a pasivní

*Nevýhody:*
- Nezabezpečený -- hesla v plain textu
- Lepší alternativy: SFTP, FTPS

*SFTP vs FTPS:*
- *SFTP* (SSH FTP) -- používá SSH (port 22), šifrovaný
- *FTPS* (FTP Secure) -- FTP + SSL/TLS

=== SMTP, POP3, IMAP (Emailové protokoly)

*SMTP (Simple Mail Transfer Protocol):*
- *Odesílání* emailů
- Port 25 (nešifrovaný), 587 (TLS), 465 (SSL)
- Komunikace mezi mailovými servery
- Push protokol

*POP3 (Post Office Protocol v3):*
- *Stahování* emailů ze serveru
- Port 110 (nešifrovaný), 995 (SSL)
- Emaily se *stáhnou a smažou* ze serveru (defaultně)
- Vhodné pro jeden klientský počítač

*IMAP (Internet Message Access Protocol):*
- *Správa* emailů na serveru
- Port 143 (nešifrovaný), 993 (SSL)
- Emaily *zůstávají* na serveru
- Synchronizace mezi zařízeními
- Složky na serveru
- *Moderní a doporučený* protokol

*Porovnání POP3 vs IMAP:*
#table(
  columns: (auto, auto, auto),
  [*Vlastnost*], [*POP3*], [*IMAP*],
  [Umístění emailů], [Lokálně (stažené)], [Na serveru],
  [Synchronizace], [Ne], [Ano],
  [Složky], [Lokální], [Serverové],
  [Více zařízení], [Nevhodné], [Ideální],
  [Úložiště], [Šetří server], [Vyžaduje místo na serveru],
)

=== DNS (Domain Name System)

*Funkce:*
- Překlad doménových jmen na IP adresy
- Port 53 (TCP i UDP)
- UDP pro dotazy, TCP pro zone transfer

*Hierarchie DNS:*
1. Root servery (.)
2. TLD servery (.com, .cz, .org)
3. Autoritativní servery (example.com)
4. Lokální DNS resolver

*Typy záznamů:*
- *A* -- IPv4 adresa
- *AAAA* -- IPv6 adresa
- *CNAME* -- alias (kanonické jméno)
- *MX* -- mail server
- *NS* -- name server
- *PTR* -- reverzní DNS (IP → doména)
- *TXT* -- textové informace (SPF, DKIM)

*Caching:*
- DNS odpovědi se ukládají do cache
- TTL (Time To Live) určuje dobu platnosti

=== DHCP (Dynamic Host Configuration Protocol)

*Funkce:*
- Automatická konfigurace síťových parametrů
- Port 67 (server), 68 (klient) -- UDP
- Viz kapitola o IPv4 adresaci pro podrobnosti

*DHCP proces (DORA):*
1. *Discover* -- klient hledá server (broadcast)
2. *Offer* -- server nabídne konfiguraci
3. *Request* -- klient požádá o konfiguraci
4. *Acknowledge* -- server potvrdí

=== SSH (Secure Shell)

*Funkce:*
- Zabezpečený vzdálený přístup
- Port 22 (TCP)
- Šifrovaná komunikace
- Náhrada za Telnet

*Použití:*
- Vzdálená správa serverů
- Bezpečný přenos souborů (SCP, SFTP)
- Tunelování (port forwarding)

=== Další protokoly aplikační vrstvy

*NTP (Network Time Protocol):*
- Synchronizace času
- Port 123 (UDP)

*SNMP (Simple Network Management Protocol):*
- Správa a monitoring sítě
- Port 161, 162 (UDP)

*LDAP (Lightweight Directory Access Protocol):*
- Adresářové služby
- Port 389 (nešifrovaný), 636 (LDAPS)

*RDP (Remote Desktop Protocol):*
- Vzdálená plocha Windows
- Port 3389 (TCP)

*Telnet:*
- Vzdálený přístup
- Port 23 (TCP)
- *Nezabezpečený* -- nepoužívat, nahrazen SSH

== ICMP (Internet Control Message Protocol)

*ICMP* je protokol síťové vrstvy (3) používaný pro diagnostiku a hlášení chyb.

*Charakteristika:*
- Součást IP protokolu
- Nezajišťuje přenos dat aplikací
- Používá se pro kontrolu a diagnostiku sítě

=== Typy ICMP zpráv

*Diagnostické zprávy:*
- *Echo Request (Type 8)* -- ping požadavek
- *Echo Reply (Type 0)* -- ping odpověď

*Chybové zprávy:*
- *Destination Unreachable (Type 3)* -- cíl není dostupný
  - Kód 0: Network unreachable
  - Kód 1: Host unreachable
  - Kód 2: Protocol unreachable
  - Kód 3: Port unreachable

- *Time Exceeded (Type 11)* -- čas vypršel
  - TTL dosáhlo 0
  - Používá traceroute

- *Redirect (Type 5)* -- přesměrování
  - Router informuje o lepší cestě

- *Source Quench (Type 4)* -- žádost o zpomalení (zastaralé)

=== ICMP nástroje

*Ping:*
- Test dostupnosti zařízení
- Měření RTT (Round Trip Time)
- Příkaz: `ping <IP_nebo_doména>`

```
ping 8.8.8.8
ping google.com
ping -c 4 192.168.1.1  # Linux: pouze 4 pakety
ping -n 4 192.168.1.1  # Windows: pouze 4 pakety
```

*Výstup:*
- Počet odeslaných/přijatých paketů
- RTT (min/avg/max)
- Packet loss (% ztráty)

*Traceroute/Tracert:*
- Zjištění cesty k cíli
- Zobrazí všechny routery na cestě
- Využívá TTL a ICMP Time Exceeded

```
traceroute google.com   # Linux/Mac
tracert google.com      # Windows
```

*Princip:*
1. Pošle paket s TTL=1 → první router odpoví Time Exceeded
2. Pošle paket s TTL=2 → druhý router odpoví Time Exceeded
3. Pokračuje, dokud nedosáhne cíle

*Pathping (Windows):*
- Kombinace ping a traceroute
- Detailní statistiky pro každý hop

=== ICMP a bezpečnost

*Zneužití ICMP:*
- *Ping flood* -- zahltění ICMP požadavky
- *Smurf attack* -- amplifikace ICMP broadcast
- *Ping of death* -- velké ICMP pakety způsobí pád systému (starší systémy)

*Ochrana:*
- Omezení ICMP na firewallu
- Rate limiting
- Blokování ICMP Echo není doporučeno (znemožní diagnostiku)

*ICMPv6:*
- Důležitější než ICMP v IPv4
- Obsahuje funkcionalitu NDP (Neighbor Discovery Protocol)
- Nelze úplně blokovat ve firewallu

= VLAN, Inter-VLAN routing

== Důvody používání VLAN

*VLAN* (Virtual Local Area Network) = logické rozdělení fyzické sítě na několik izolovaných virtuálních sítí.

=== Hlavní důvody použití VLAN

1. *Segmentace broadcastových domén*
  - Každý VLAN = samostatná broadcastová doména
  - Snížení broadcastového provozu
  - Zlepšení výkonu sítě
  - Omezení šíření broadcast storm

2. *Zvýšení bezpečnosti*
  - Izolace citlivých dat a systémů
  - Oddělení oddělení (HR, Finance, IT)
  - Separace hostů od interní sítě
  - Kontrola přístupu mezi VLANy pomocí ACL

3. *Flexibilita a škálovatelnost*
  - Logické členění nezávislé na fyzickém umístění
  - Uživatel ve VLAN "Finance" může být v jakékoliv budově
  - Snadná reorganizace bez přepojování kabelů
  - Centralizovaná správa

4. *Efektivní využití zdrojů*
  - Více logických sítí na jedné fyzické infrastruktuře
  - Úspora switchů a kabeláže
  - Sdílení síťového vybavení

5. *Zjednodušení správy*
  - Přehledná struktura sítě
  - Jednodušší troubleshooting
  - Logické seskupení podle funkce, oddělení nebo aplikace

6. *QoS (Quality of Service)*
  - Prioritizace provozu podle VLAN
  - Např. VLAN pro VoIP může mít vyšší prioritu

=== Příklad použití

*Firma s 3 odděleními:*
- VLAN 10 -- Management (servery, správa)
- VLAN 20 -- Zaměstnanci (PC uživatelů)
- VLAN 30 -- Hosté (WiFi pro návštěvy)

*Výhody:*
- Management VLAN je izolovaný a zabezpečený
- Hosté nemohou přistupovat k interním zdrojům
- Broadcast z VLAN 30 neovlivňuje VLAN 10 a 20

== Způsoby segmentace sítí

=== Fyzická segmentace
*Použití routerů:*
- Každá síť připojena k samostatnému portu routeru
- Router rozděluje broadcastové domény
- Drahé (více portů, více zařízení)
- Složitější správa

=== Logická segmentace (VLAN)
*Použití VLANů na switchi:*
- Jeden switch, více logických sítí
- Levnější a flexibilnější
- Moderní a doporučený přístup

== Metody vytváření VLAN

=== 1. Port-Based VLAN (Static VLAN)
*Nejběžnější metoda.*

- Port je *staticky přiřazen* k VLAN
- Zařízení připojené k portu patří do daného VLAN
- Administrátor musí ručně nakonfigurovat každý port

*Příklad:*
- Port 1-8 → VLAN 10 (IT oddělení)
- Port 9-16 → VLAN 20 (Finance)
- Port 17-24 → VLAN 30 (HR)

*Výhody:*
- Jednoduché
- Bezpečné
- Snadná správa

*Nevýhody:*
- Nutnost manuální konfigurace při změnách
- Méně flexibilní

=== 2. MAC-Based VLAN (Dynamic VLAN)
*Dynamické přiřazení podle MAC adresy.*

- VLAN je přiřazen na základě MAC adresy zařízení
- Databáze MAC adres → VLAN
- Zařízení může měnit port a zůstat ve stejném VLAN

*Příklad:*
- MAC aa:bb:cc:dd:ee:ff → VLAN 10
- MAC 11:22:33:44:55:66 → VLAN 20

*Výhody:*
- Flexibilní -- uživatel může změnit port
- Vhodné pro mobilní zařízení

*Nevýhody:*
- Složitější konfigurace
- Nutnost udržovat databázi MAC adres
- Bezpečnostní riziko (MAC spoofing)

=== 3. Protocol-Based VLAN
*Přiřazení podle síťového protokolu.*

- VLAN podle typu protokolu (IP, IPX, AppleTalk)
- Dnes méně používáno
- Vhodné pro heterogenní sítě se starými protokoly

=== 4. 802.1X (Authentication-Based VLAN)
*Dynamické přiřazení podle autentizace.*

- Uživatel se autentizuje (username/password, certifikát)
- RADIUS server vrátí informaci o VLAN
- VLAN je přiřazen dynamicky po úspěšné autentizaci

*Výhody:*
- Vysoká bezpečnost
- Flexibilní
- Centralizovaná správa (RADIUS)

*Nevýhody:*
- Komplexní konfigurace
- Vyžaduje RADIUS server

== Typy VLAN portů

=== Access Port
*Port pro koncová zařízení.*

- Patří do *jednoho VLAN*
- Pro připojení PC, tiskáren, telefonů
- Rámce posílány *bez VLAN tagu* (untagged)
- Nejběžnější typ portu

*Příklad:*
```
interface FastEthernet 0/1
 switchport mode access
 switchport access vlan 10
```

=== Trunk Port
*Port pro propojení switchů.*

- Přenáší provoz *více VLANů* současně
- Rámce jsou *označeny tagem* (tagged) -- IEEE 802.1Q
- Pro propojení switch-switch nebo switch-router
- Umožňuje Inter-VLAN routing

*VLAN Tagging (802.1Q):*
- Vložení 4 bajtů do Ethernet rámce
- Obsahuje VLAN ID (12 bitů) → 4096 VLANů (0-4095)
- VLAN 1 = výchozí VLAN (default)
- VLAN 1002-1005 = rezervované

*Příklad:*
```
interface GigabitEthernet 0/1
 switchport mode trunk
 switchport trunk allowed vlan 10,20,30
```

=== Hybrid/General Port (některé switche)
- Kombinace Access a Trunk
- Může přenášet tagged i untagged rámce
- Specifické pro některé výrobce

== Propojení switchů s více VLANy

*Zadání:* Máme 2 switche, na každém jsou VLANy 10, 20, 30. Jak je propojit?

=== Metoda 1: Jeden Trunk port (Doporučeno)
*Jeden kabel mezi switchy, port v režimu Trunk.*

```
Switch A                          Switch B
VLAN 10,20,30                     VLAN 10,20,30
    |                                 |
    | Trunk (802.1Q)                  |
    +---------------------------------+
```

*Konfigurace:*
```
! Switch A
interface GigabitEthernet 0/1
 switchport mode trunk
 switchport trunk allowed vlan 10,20,30

! Switch B
interface GigabitEthernet 0/1
 switchport mode trunk
 switchport trunk allowed vlan 10,20,30
```

*Výhody:*
- Efektivní -- jeden kabel
- Snadná správa
- Škálovatelné (lze přidat další VLANy)
- *Standardní a doporučené řešení*

*Nevýhody:*
- Single point of failure (lze řešit redundancí)

=== Metoda 2: Více Access portů (Nedoporučeno)
*Jeden kabel pro každý VLAN.*

```
Switch A                          Switch B
VLAN 10 ----[Access Port]-------- VLAN 10
VLAN 20 ----[Access Port]-------- VLAN 20
VLAN 30 ----[Access Port]-------- VLAN 30
```

*Konfigurace:*
```
! Switch A
interface FastEthernet 0/1
 switchport mode access
 switchport access vlan 10
interface FastEthernet 0/2
 switchport mode access
 switchport access vlan 20
interface FastEthernet 0/3
 switchport mode access
 switchport access vlan 30

! Switch B - stejná konfigurace
```

*Nevýhody:*
- Plýtvání porty a kabely
- Neškálovatelné
- Složitá správa
- *Zastaralé -- nepoužívat*

=== Metoda 3: Redundantní Trunk (Pro high availability)
*Dva trunk porty pro redundanci.*

```
Switch A                          Switch B
    |----[Trunk 1]----------------|
    |----[Trunk 2]----------------|
```

*Poznámka:* Vyžaduje Spanning Tree Protocol (STP) k zabránění smyček.

*Použití:*
- Kritické prostředí
- Vysoká dostupnost
- Load balancing (s EtherChannel)

== Inter-VLAN Routing

*Problém:* VLANy jsou izolované -- zařízení v různých VLANech spolu nemohou komunikovat.

*Řešení:* Inter-VLAN routing = směrování mezi VLANy.

=== Metoda 1: Router s více fyzickými rozhraními (Legacy)

*Router má fyzické rozhraní pro každý VLAN.*

```
        VLAN 10
           |
Switch ----+---- Router ---- Internet
           |        |
        VLAN 20     |
           |     VLAN 30
```

*Nevýhody:*
- Vyžaduje router port pro každý VLAN
- Drahé
- Neškálovatelné
- *Zastaralé*

=== Metoda 2: Router-on-a-Stick (RoaS)

*Jeden trunk port mezi switchem a routerem.*

```
Switch (VLANs 10,20,30)
    |
    | Trunk (802.1Q)
    |
Router (subinterfaces)
 - GigabitEthernet 0/0.10 (VLAN 10)
 - GigabitEthernet 0/0.20 (VLAN 20)
 - GigabitEthernet 0/0.30 (VLAN 30)
```

*Konfigurace:*

```
! Switch
interface GigabitEthernet 0/1
 switchport mode trunk
 switchport trunk allowed vlan 10,20,30

! Router
interface GigabitEthernet 0/0
 no shutdown

interface GigabitEthernet 0/0.10
 encapsulation dot1Q 10
 ip address 192.168.10.1 255.255.255.0

interface GigabitEthernet 0/0.20
 encapsulation dot1Q 20
 ip address 192.168.20.1 255.255.255.0

interface GigabitEthernet 0/0.30
 encapsulation dot1Q 30
 ip address 192.168.30.1 255.255.255.0
```

*Výhody:*
- Efektivní -- jeden kabel
- Škálovatelné
- Levnější než více routerů

*Nevýhody:*
- Všechen provoz prochází jedním portem (bottleneck)
- Pomalejší než L3 switch

*Použití:*
- Malé a střední sítě
- Omezený budget
- Dostupné řešení

=== Metoda 3: Layer 3 Switch (SVI - Switch Virtual Interface)

*Switch s L3 funkcionalitou provádí routing mezi VLANy.*

```
Layer 3 Switch
 - VLAN 10 (192.168.10.0/24)
 - VLAN 20 (192.168.20.0/24)
 - VLAN 30 (192.168.30.0/24)
   ↓
Routing between VLANs (hardware)
```

*Konfigurace:*

```
! Povolit IP routing
ip routing

! Vytvoření VLANů
vlan 10
 name IT
vlan 20
 name Finance
vlan 30
 name HR

! Konfigurace SVI (Switch Virtual Interface)
interface Vlan10
 ip address 192.168.10.1 255.255.255.0

interface Vlan20
 ip address 192.168.20.1 255.255.255.0

interface Vlan30
 ip address 192.168.30.1 255.255.255.0
```

*Výhody:*
- *Nejrychlejší* -- routing v hardware (ASIC)
- Žádný bottleneck
- Škálovatelné
- Vhodné pro velké sítě

*Nevýhody:*
- Dražší než L2 switch
- Složitější konfigurace

*Použití:*
- Střední a velké sítě
- Datacentra
- Výkonnostně náročné prostředí
- *Doporučené pro produkční sítě*

=== Porovnání metod

#table(
  columns: (auto, auto, auto, auto),
  [*Metoda*], [*Výkon*], [*Cena*], [*Použití*],
  [Více fyzických rozhraní], [Nízký], [Vysoká], [Zastaralé],
  [Router-on-a-Stick], [Střední], [Nízká], [Malé sítě],
  [L3 Switch (SVI)], [Vysoký], [Střední], [Produkční sítě],
)

== VLANy v Cisco IOS -- Konfigurace

=== Základní konfigurace VLAN

*1. Vytvoření VLANů:*

```
! Vstup do privilegovaného módu
enable

! Konfigurace
configure terminal

! Vytvoření VLAN 10
vlan 10
 name IT_Department
 exit

! Vytvoření VLAN 20
vlan 20
 name Finance
 exit

! Vytvoření VLAN 30
vlan 30
 name HR
 exit
```

*2. Přiřazení portů k VLAN (Access port):*

```
! Port pro IT oddělení
interface FastEthernet 0/1
 switchport mode access
 switchport access vlan 10
 description PC-IT-001
 exit

! Rozsah portů pro Finance
interface range FastEthernet 0/2-5
 switchport mode access
 switchport access vlan 20
 description Finance_Department
 exit

! Port pro HR
interface FastEthernet 0/6
 switchport mode access
 switchport access vlan 30
 exit
```

*3. Konfigurace Trunk portu:*

```
! Trunk port pro propojení switchů
interface GigabitEthernet 0/1
 switchport mode trunk
 switchport trunk encapsulation dot1q
 switchport trunk allowed vlan 10,20,30
 description Trunk to Switch2
 exit
```

*4. Ověření konfigurace:*

```
! Zobrazit všechny VLANy
show vlan brief

! Zobrazit detaily VLAN
show vlan id 10

! Zobrazit trunk porty
show interfaces trunk

! Zobrazit konkrétní interface
show interfaces FastEthernet 0/1 switchport
```

=== Konfigurace Router-on-a-Stick

*Switch:*
```
! Trunk port k routeru
interface GigabitEthernet 0/1
 switchport mode trunk
 switchport trunk allowed vlan 10,20,30
```

*Router:*
```
! Hlavní interface
interface GigabitEthernet 0/0
 no shutdown
 exit

! Subinterface pro VLAN 10
interface GigabitEthernet 0/0.10
 encapsulation dot1Q 10
 ip address 192.168.10.1 255.255.255.0
 exit

! Subinterface pro VLAN 20
interface GigabitEthernet 0/0.20
 encapsulation dot1Q 20
 ip address 192.168.20.1 255.255.255.0
 exit

! Subinterface pro VLAN 30
interface GigabitEthernet 0/0.30
 encapsulation dot1Q 30
 ip address 192.168.30.1 255.255.255.0
 exit
```

=== Konfigurace Inter-VLAN Routing na L3 Switch

```
! Povolit IP routing
ip routing

! Vytvoření VLANů
vlan 10
 name IT
vlan 20
 name Finance
vlan 30
 name HR

! SVI pro VLAN 10
interface Vlan10
 ip address 192.168.10.1 255.255.255.0
 no shutdown

! SVI pro VLAN 20
interface Vlan20
 ip address 192.168.20.1 255.255.255.0
 no shutdown

! SVI pro VLAN 30
interface Vlan30
 ip address 192.168.30.1 255.255.255.0
 no shutdown
```

=== Pokročilé funkce

*Native VLAN:*
```
! Nastavení native VLAN (pro untagged rámce na trunk)
interface GigabitEthernet 0/1
 switchport trunk native vlan 99
```

*Poznámka:* Native VLAN by měl být stejný na obou stranách trunk portu.

*Voice VLAN:*
```
! VLAN pro IP telefony
interface FastEthernet 0/1
 switchport mode access
 switchport access vlan 10
 switchport voice vlan 40
```

*Zakázání DTP (Dynamic Trunking Protocol):*
```
interface GigabitEthernet 0/1
 switchport mode trunk
 switchport nonegotiate
```

*Smazání VLAN:*
```
! Smazat konkrétní VLAN
no vlan 10

! Smazat všechny VLANy (opatrně!)
delete flash:vlan.dat
```

=== Troubleshooting VLAN

*Časté problémy:*

1. *Port v nesprávném VLAN*
  ```
  show vlan brief
  show interfaces FastEthernet 0/1 switchport
  ```

2. *Trunk port není nakonfigurován správně*
  ```
  show interfaces trunk
  show interfaces GigabitEthernet 0/1 switchport
  ```

3. *Nepovolené VLANy na trunk*
  ```
  switchport trunk allowed vlan add 10
  ```

4. *Native VLAN mismatch*
  - CDP varování
  - Kontrola: `show interfaces trunk`

5. *VLAN není vytvořen*
  ```
  show vlan brief
  vlan 10
   name Missing_VLAN
  ```

*Best practices:*
- Nepoužívat VLAN 1 pro uživatelské zařízení (security)
- Dokumentovat přiřazení VLANů
- Používat konzistentní jmenné konvence
- Pravidelně auditovat VLAN konfiguraci
- Zakázat nepoužívané porty a přiřadit je k nepoužívanému VLAN

= WLAN koncept, konfigurace

== Úvod do bezdrátových sítí

*WLAN* (Wireless Local Area Network) = bezdrátová lokální síť využívající rádiové vlny pro přenos dat.

*Princip:*
- Data jsou přenášena pomocí elektromagnetických vln
- Frekvenční pásma: 2,4 GHz a 5 GHz (6 GHz u Wi-Fi 6E)
- Pokrytí pomocí Access Pointů (AP)

== Výhody bezdrátových sítí

*Hlavní výhody:*

1. *Mobilita a flexibilita*
  - Uživatelé se mohou pohybovat v pokrytí sítě
  - Připojení z jakéhokoli místa v dosahu
  - Podpora mobilních zařízení (telefony, tablety, notebooky)

2. *Snadná instalace*
  - Není nutné pokládat kabely
  - Rychlé nasazení
  - Vhodné pro dočasné instalace

3. *Škálovatelnost*
  - Snadné přidání nových uživatelů
  - Rozšíření pokrytí přidáním AP
  - Flexibilní konfigurace

4. *Úspora nákladů*
  - Nižší instalační náklady (žádná kabeláž)
  - Vhodné pro staré budovy, kde je kabeláž obtížná
  - Snadná reorganizace prostoru

5. *Estetika*
  - Žádné viditelné kabely
  - Čistší prostředí

*Nevýhody:*
- Nižší rychlost než kabelové sítě
- Citlivost na rušení
- Omezený dosah
- Bezpečnostní rizika (odposlechy)
- Sdílené médium (nižší výkon při více uživatelích)

== Typy bezdrátových sítí podle velikosti

=== WPAN (Wireless Personal Area Network)
*Osobní bezdrátová síť.*

- *Dosah:* Několik metrů (~10 m)
- *Technologie:* Bluetooth, Zigbee, NFC
- *Použití:*
  - Připojení periferií (myš, klávesnice, sluchátka)
  - Přenos dat mezi zařízeními (telefon ↔ notebook)
  - Smart home zařízení
- *Příklady:* Bluetooth 5.0, Bluetooth LE

=== WLAN (Wireless Local Area Network)
*Bezdrátová lokální síť.*

- *Dosah:* Desítky až stovky metrů (~100 m indoor)
- *Technologie:* Wi-Fi (IEEE 802.11)
- *Použití:*
  - Domácí sítě
  - Kancelářské sítě
  - Veřejný Wi-Fi hotspot
- *Příklady:* Wi-Fi 6 (802.11ax), Wi-Fi 5 (802.11ac)

=== WMAN (Wireless Metropolitan Area Network)
*Bezdrátová metropolitní síť.*

- *Dosah:* Několik kilometrů
- *Technologie:* WiMAX (IEEE 802.16)
- *Použití:*
  - Připojení mezi budovami
  - Městské sítě
  - Záložní připojení
- *Stav:* Méně používané, nahrazováno mobilními sítěmi

=== WWAN (Wireless Wide Area Network)
*Bezdrátová rozlehlá síť.*

- *Dosah:* Desítky kilometrů
- *Technologie:* Mobilní sítě (4G LTE, 5G)
- *Použití:*
  - Mobilní internet
  - IoT zařízení
  - Celorepublikové pokrytí
- *Příklady:* 4G LTE, 5G NR

*Shrnutí:*
#table(
  columns: (auto, auto, auto, auto),
  [*Typ*], [*Dosah*], [*Technologie*], [*Použití*],
  [WPAN], [~10 m], [Bluetooth, Zigbee], [Periférie],
  [WLAN], [~100 m], [Wi-Fi (802.11)], [Lokální síť],
  [WMAN], [~10 km], [WiMAX], [Městské sítě],
  [WWAN], [~50 km], [4G, 5G], [Mobilní sítě],
)

== Metoda přístupu k médiu

*Problém:* Bezdrátové médium je sdílené -- více zařízení vysílá na stejné frekvenci.

=== CSMA/CA (Carrier Sense Multiple Access with Collision Avoidance)

*Hlavní metoda přístupu v Wi-Fi sítích.*

Viz kapitola o fyzické vrstvě pro detaily. Zde shrnutí:

*Princip:*
1. *Carrier Sense* -- zařízení naslouchá, zda médium není obsazené
2. *Collision Avoidance* -- předcházení kolizím (nelze detekovat kolize jako u Ethernetu)
3. Zařízení čeká náhodnou dobu před vysíláním

*Postup:*
1. Stanice chce vysílat → naslouchá médiu
2. Je-li médium volné → čeká DIFS (Distributed Inter-Frame Space)
3. Poté čeká náhodnou dobu (backoff)
4. Vysílá data
5. Příjemce potvrdí ACK

*RTS/CTS (Request to Send / Clear to Send):*
- Volitelný mechanismus pro předcházení kolizím
- Stanice pošle malý RTS rámec
- AP odpoví CTS rámcem
- Ostatní stanice vědí, že médium bude obsazené
- Řeší problém skrytých stanic (hidden node problem)

*Hidden Node Problem:*
```
Stanice A <---> AP <---> Stanice B
(A nevidí B)    ↑    (B nevidí A)
```
- Stanice A a B nevidí navzájem vysílání
- Obě mohou vysílat současně → kolize u AP
- Řešení: RTS/CTS

*Exposed Node Problem:*
- Stanice se vyhne vysílání, i když by nekolidovala
- Snižuje efektivitu sítě

== IEEE 802.11 standardy

*IEEE 802.11* = rodina standardů pro Wi-Fi.

=== Vývoj standardů

#table(
  columns: (auto, auto, auto, auto, auto),
  [*Standard*], [*Název*], [*Frekvence*], [*Max. rychlost*], [*Rok*],
  [802.11], [Legacy], [2,4 GHz], [2 Mbps], [1997],
  [802.11b], [-], [2,4 GHz], [11 Mbps], [1999],
  [802.11a], [-], [5 GHz], [54 Mbps], [1999],
  [802.11g], [-], [2,4 GHz], [54 Mbps], [2003],
  [802.11n], [Wi-Fi 4], [2,4/5 GHz], [600 Mbps], [2009],
  [802.11ac], [Wi-Fi 5], [5 GHz], [6,9 Gbps], [2013],
  [802.11ax], [Wi-Fi 6], [2,4/5 GHz], [9,6 Gbps], [2019],
  [802.11ax], [Wi-Fi 6E], [6 GHz], [9,6 Gbps], [2020],
  [802.11be], [Wi-Fi 7], [2,4/5/6 GHz], [46 Gbps], [2024],
)

*Poznámka:* Uvedené rychlosti jsou teoretické maxima. Reálné rychlosti jsou nižší.

=== Frekvenční pásma

*2,4 GHz pásmo:*
- *Kanály:* 1-14 (v ČR 1-13)
- *Nepřekrývající se kanály:* 1, 6, 11
- *Výhody:* Větší dosah, lepší průnik překážkami
- *Nevýhody:* Více rušení (Bluetooth, mikrovlnky), pomalejší

*5 GHz pásmo:*
- *Kanály:* Více nepřekrývajících se kanálů
- *Výhody:* Méně rušení, vyšší rychlost, více kanálů
- *Nevýhody:* Menší dosah, horší průnik překážkami

*6 GHz pásmo (Wi-Fi 6E):*
- *Nové pásmo* s velkým množstvím kanálů
- *Výhody:* Žádné rušení (nové pásmo), velmi vysoká rychlost
- *Nevýhody:* Omezená dostupnost zařízení, regulace

=== Pokročilé technologie

*MIMO (Multiple Input Multiple Output):*
- Více antén pro vysílání a příjem
- Zvýšení rychlosti a spolehlivosti
- MU-MIMO -- současná komunikace s více zařízeními

*Beamforming:*
- Směrování signálu k cílovému zařízení
- Zvýšení dosahu a rychlosti
- Snížení rušení

*Channel Bonding:*
- Spojení více kanálů do jednoho širšího
- Zvýšení rychlosti
- 20 MHz, 40 MHz, 80 MHz, 160 MHz

== Topologie WLAN

=== Ad-Hoc (IBSS - Independent Basic Service Set)
*Přímé spojení mezi zařízeními.*

```
PC <---> Notebook <---> Tablet
```

- Bez Access Pointu
- Peer-to-peer komunikace
- Dočasné sítě
- Omezený dosah

=== Infrastructure (BSS - Basic Service Set)
*Centralizovaná síť s Access Pointem.*

```
        Access Point
       /      |      \
     PC   Notebook  Tablet
```

- Všechna zařízení komunikují přes AP
- AP je připojen do kabelové sítě
- *Nejběžnější topologie*

*BSS:*
- Jeden Access Point
- Identifikace pomocí BSSID (MAC adresa AP)

*ESS (Extended Service Set):*
- Více AP se stejným SSID
- Roaming mezi AP
- Větší pokrytí

```
     AP1            AP2            AP3
      |              |              |
  [SSID: Office] [SSID: Office] [SSID: Office]
      \              |              /
       \----------[Switch]----------/
```

=== Mesh Network
*Propojení více AP do sítě.*

```
AP1 <---> AP2 <---> AP3
 |         |         |
 +---------+---------+
           |
        [Switch]
```

- AP komunikují mezi sebou bezdrátově
- Automatické hledání cest
- Redundance a odolnost
- Použití v obtížně kabelovatelných prostorech

== Bezpečnost WLAN

=== Autentizační metody

*Open System:*
- Bez hesla
- Žádné šifrování
- Veřejné hotspoty

*WEP (Wired Equivalent Privacy):*
- *Zastaralé a nezabezpečené*
- Snadno prolomitelné
- Nepoužívat!

*WPA (Wi-Fi Protected Access):*
- Zlepšení WEP
- TKIP šifrování
- Lepší než WEP, ale zastaralé

*WPA2 (2004):*
- *Současný standard*
- AES šifrování (CCMP)
- Osobní (PSK - Pre-Shared Key) -- společné heslo
- Enterprise (802.1X, RADIUS) -- individuální účty

*WPA3 (2018):*
- *Nejnovější standard*
- Lepší ochrana proti útokům
- SAE (Simultaneous Authentication of Equals)
- Forward Secrecy
- Ochrana proti offline slovníkovým útokům

=== Šifrovací protokoly

*TKIP (Temporal Key Integrity Protocol):*
- Starší, WPA
- Zastaralé

*AES (Advanced Encryption Standard):*
- Moderní, silné šifrování
- WPA2/WPA3
- *Doporučeno*

== Konfigurace WLAN v Cisco IOS

*Poznámka:* Konfigurace se liší podle typu zařízení:
- Autonomous AP -- samostatné nastavení každého AP
- Lightweight AP + WLC (Wireless LAN Controller) -- centralizovaná správa

=== Základní konfigurace Autonomous AP

*1. Přístup na AP:*
```
! Většinou přes webové rozhraní nebo CLI
! IP adresa defaultně přes DHCP nebo 10.0.0.1
```

*2. Základní konfigurace přes CLI:*

```
! Přístup do privilegovaného módu
enable

! Konfigurace
configure terminal

! Nastavení hostname
hostname AP-Office-01

! Konfigurace managementové IP
interface BVI1
 ip address 192.168.1.100 255.255.255.0
 no shutdown
 exit

ip default-gateway 192.168.1.1

! Konfigurace DNS (volitelné)
ip name-server 8.8.8.8
```

*3. Konfigurace SSID:*

```
! Vytvoření SSID
dot11 ssid Office-WiFi
 authentication open
 authentication key-management wpa version 2
 wpa-psk ascii 0 StrongPassword123!
 exit
```

*4. Konfigurace rádiového rozhraní:*

```
! 2,4 GHz rozhraní
interface Dot11Radio0
 encryption mode ciphers aes-ccm
 ssid Office-WiFi
 channel 6
 station-role root
 no shutdown
 exit

! 5 GHz rozhraní (pokud je podporováno)
interface Dot11Radio1
 encryption mode ciphers aes-ccm
 ssid Office-WiFi
 channel 36
 station-role root
 no shutdown
 exit
```

*5. Bridge Group (propojení s kabelovou sítí):*

```
! Propojení WLAN s VLAN
interface Dot11Radio0
 bridge-group 1
 exit

interface Dot11Radio1
 bridge-group 1
 exit

interface GigabitEthernet0
 bridge-group 1
 exit

interface BVI1
 ip address 192.168.1.100 255.255.255.0
 exit
```

=== Konfigurace s VLANy

*Více SSID s různými VLANy:*

```
! SSID pro zaměstnance (VLAN 10)
dot11 ssid Employees
 vlan 10
 authentication open
 authentication key-management wpa version 2
 wpa-psk ascii 0 EmployeePass123
 exit

! SSID pro hosty (VLAN 20)
dot11 ssid Guests
 vlan 20
 authentication open
 authentication key-management wpa version 2
 wpa-psk ascii 0 GuestPass123
 exit

! Konfigurace subinterfaces
interface Dot11Radio0.10
 encapsulation dot1Q 10
 bridge-group 10
 exit

interface Dot11Radio0.20
 encapsulation dot1Q 20
 bridge-group 20
 exit

! Trunk na kabelovém portu
interface GigabitEthernet0
 switchport mode trunk
 switchport trunk allowed vlan 10,20
```

=== Konfigurace WPA2-Enterprise (802.1X)

```
! Konfigurace RADIUS serveru
radius-server host 192.168.1.50 auth-port 1812 acct-port 1813
radius-server key SharedSecret123

! SSID s 802.1X
dot11 ssid Secure-Office
 authentication open
 authentication key-management wpa version 2
 authentication network-eap radius-server
 exit
```

=== Pokročilé nastavení

*Omezení rychlosti (Rate Limiting):*
```
! Omezit hosty na 5 Mbps
dot11 ssid Guests
 max-associations 50
 exit
```

*Nastavení kanálu a výkonu:*
```
interface Dot11Radio0
 channel 6
 power local 50  ! 50% výkonu
 no shutdown
 exit
```

*Skrytí SSID (broadcast disable):*
```
dot11 ssid Hidden-Network
 guest-mode
 exit

interface Dot11Radio0
 ssid Hidden-Network
 no broadcast-ssid
 exit
```

=== Ověření konfigurace

```
! Zobrazit bezdrátové rozhraní
show interfaces Dot11Radio0

! Zobrazit připojené klienty
show dot11 associations

! Zobrazit SSID
show dot11 ssid

! Zobrazit statistiky
show dot11 statistics
show controllers Dot11Radio0

! Zobrazit kanály v okolí
show dot11 channels

! Debug (opatrně!)
debug dot11 aaa authenticator
debug dot11 mgmt ssid
```

=== Wireless LAN Controller (WLC)

*Výhody centralizované správy:*
- Konfigurace stovek AP z jednoho místa
- Automatická propagace nastavení
- Centralizovaná bezpečnost
- Load balancing
- Roaming mezi AP

*CAPWAP (Control And Provisioning of Wireless Access Points):*
- Protokol pro komunikaci mezi WLC a AP
- Šifrovaný tunel
- Centralizovaná správa

*Základní koncepty WLC:*
- *WLAN* -- konfigurace bezdrátové sítě (SSID, bezpečnost)
- *AP Group* -- skupina AP se stejnou konfigurací
- *RF Profile* -- rádiové nastavení (kanály, výkon)

= Koncept směrování, statické směrování

== Co je to směrování a jeho základní dělení

*Směrování (Routing)* je proces, kterým směrovače určují nejlepší cestu pro přenos dat z jedné sítě do druhé. Směrování je klíčovou funkcí síťové vrstvy modelu OSI a umožňuje propojení různých sítí do jedné logické sítě (internetwork).

*Základní princip směrování:*
- Směrovač přijme paket na jednom rozhraní
- Zkontroluje cílovou IP adresu v paketu
- Vyhledá nejlepší cestu ve směrovací tabulce
- Přepošle paket na příslušné výstupní rozhraní

*Základní dělení směrování:*

1. *Statické směrování (Static Routing)*
  - Trasy jsou konfigurovány ručně administrátorem
  - Směrovač neaktualizuje trasy automaticky
  - Vhodné pro malé sítě s jednoduchými topologiemi
  - Nevyžaduje výpočetní výkon procesoru pro výpočet tras
  - Minimální zatížení linky (žádný provoz směrovacích protokolů)

2. *Dynamické směrování (Dynamic Routing)*
  - Trasy jsou zjišťovány a aktualizovány automaticky pomocí směrovacích protokolů
  - Směrovače si vyměňují informace o sítích
  - Automaticky reagují na změny v topologii sítě
  - Vhodné pro větší a složitější sítě

3. *Výchozí směrování (Default Routing)*
  - Speciální typ statické trasy
  - Používá se pro všechny cílové sítě, které nejsou explicitně uvedeny ve směrovací tabulce
  - Označováno jako "Gateway of Last Resort" (brána poslední instance)
  - Často používáno pro připojení k Internetu

#table(
  columns: (1fr, 1fr, 1fr),
  align: left,
  [*Kritérium*], [*Statické směrování*], [*Dynamické směrování*],
  [*Konfigurace*], [Ruční], [Automatická],
  [*Adaptace na změny*], [Manuální zásah nutný], [Automatická],
  [*Využití CPU*], [Minimální], [Vyšší],
  [*Využití bandwidth*], [Žádné], [Provoz protokolů],
  [*Bezpečnost*], [Vyšší (žádná výměna info)], [Nižší],
  [*Vhodnost*], [Malé sítě, stub networks], [Větší, dynamické sítě],
  [*Škálovatelnost*], [Omezená], [Vysoká],
)

== Funkce směrovače

Směrovač (Router) je síťové zařízení pracující na síťové vrstvě (Layer 3) modelu OSI. Jeho hlavním úkolem je propojovat různé sítě a směrovat data mezi nimi.

*Základní funkce směrovače:*

1. *Určení nejlepší cesty*
  - Analýza směrovací tabulky pro nalezení optimální trasy
  - Použití metrik (vzdálenost, šířka pásma, zpoždění) pro výběr cesty
  - Rozhodování na základě cílové IP adresy

2. *Přeposlání paketů*
  - Příjem paketů na vstupním rozhraní
  - Dekapsulace rámce linkové vrstvy
  - Kontrola cílové IP adresy
  - Enkapsulace do nového rámce podle typu výstupního rozhraní
  - Odeslání paketu na výstupní rozhraní

3. *Segmentace sítě*
  - Rozdělení rozsáhlých broadcast domén
  - Každé rozhraní směrovače představuje samostatnou síť
  - Omezení šíření broadcast provozu

4. *Filtrování provozu*
  - Implementace Access Control Lists (ACL)
  - Řízení přístupu mezi sítěmi
  - Zvýšení bezpečnosti sítě

5. *Propojení různých technologií*
  - Spojení sítí s různými protokoly linkové vrstvy (Ethernet, Serial, Wi-Fi)
  - Konverze mezi různými typy rámců
  - Podpora různých rychlostí přenosu

6. *NAT (Network Address Translation)*
  - Překlad privátních IP adres na veřejné
  - Umožnění přístupu k Internetu pro vnitřní síť
  - Úspora veřejných IP adres

7. *DHCP server*
  - Automatické přidělování IP adres koncovým zařízením
  - Distribuce síťových parametrů (maska, gateway, DNS)

8. *Zabezpečení*
  - Firewall funkce
  - VPN (Virtual Private Network)
  - Šifrování komunikace

== Možné způsoby připojení k směrovači pro jeho základní konfiguraci

Pro konfiguraci směrovače Cisco existuje několik způsobů připojení:

*1. Konzolové připojení (Console)*

Nejzákladnější a nejčastější způsob pro prvotní konfiguraci.

- *Fyzické připojení:*
  - Console port na směrovači (RJ-45 nebo USB-C)
  - Console kabel (rollover kabel) + adapter RJ-45 na USB/Serial
  - Počítač s terminálovým emulátorem (PuTTY, Tera Term, SecureCRT)

- *Nastavení terminálového emulátoru:*
  - *Rychlost (Baud rate):* 9600
  - *Data bits:* 8
  - *Parity:* None
  - *Stop bits:* 1
  - *Flow control:* None

- *Výhody:*
  - Funguje vždy, i když směrovač nemá IP adresu
  - Plný přístup k zařízení
  - Zobrazuje boot proces a systémové zprávy
  - Nezávislé na síťovém připojení

*2. Telnet*

Vzdálené připojení přes síť pomocí protokolu Telnet (port 23).

```
PC> telnet 192.168.1.1
```

- *Výhody:*
  - Vzdálené připojení z libovolného místa v síti
  - Není nutný fyzický přístup

- *Nevýhody:*
  - *Nezabezpečené* -- všechna data včetně hesel jsou v otevřeném textu
  - Vyžaduje předem nakonfigurovanou IP adresu
  - Doporučeno nahradit SSH

*3. SSH (Secure Shell)*

Zabezpečená vzdálená správa přes síť (port 22).

```
PC> ssh -l admin 192.168.1.1
```

- *Výhody:*
  - Šifrovaná komunikace
  - Bezpečný přenos hesel a konfiguračních dat
  - Autentizace serveru
  - Doporučený způsob vzdálené správy

- *Nevýhody:*
  - Vyžaduje předchozí konfiguraci (hostname, domain-name, generování klíčů)
  - Vyšší výpočetní náročnost na šifrování

*Příklad konfigurace SSH:*
```
Router(config)# hostname R1
R1(config)# ip domain-name example.com
R1(config)# crypto key generate rsa
How many bits in the modulus [512]: 2048
R1(config)# username admin privilege 15 secret Cisco123
R1(config)# line vty 0 4
R1(config-line)# transport input ssh
R1(config-line)# login local
R1(config-line)# exit
R1(config)# ip ssh version 2
```

*4. AUX port*

Pomocný port pro vzdálené připojení přes modem (zastaralé).

- Dnes již téměř nepoužívané
- Může sloužit jako záložní přístup

*5. HTTP/HTTPS (Web rozhraní)*

Grafické webové rozhraní (není dostupné na všech zařízeních Cisco).

```
Router(config)# ip http server
Router(config)# ip http secure-server
```

- Přístup přes webový prohlížeč na IP adresu směrovače
- Jednodušší pro začátečníky
- Méně funkcí než CLI

== Režimy směrovače (Cisco IOS)

Cisco IOS (Internetwork Operating System) má hierarchickou strukturu příkazových režimů. Každý režim má svou výzvu (prompt) a dostupnou sadu příkazů.

*1. User EXEC Mode (Uživatelský režim)*

```
Router>
```

- První režim po přihlášení
- Omezený přístup -- pouze základní monitorovací příkazy
- Nelze provádět změny konfigurace ani zobrazit citlivé informace
- Příkazy: `ping`, `traceroute`, `show version` (základní info)

*Přechod do dalšího režimu:*
```
Router> enable
```

*2. Privileged EXEC Mode (Privilegovaný režim)*

```
Router#
```

- Plný přístup k monitorovacím příkazům
- Nelze měnit konfiguraci, ale lze ji zobrazit
- Přístup k pokročilým příkazům `show`
- Možnost mazání a správy souborů
- Vyžaduje enable heslo (pokud je nastaveno)

*Důležité příkazy:*
- `show running-config` -- zobrazí aktuální konfiguraci v RAM
- `show startup-config` -- zobrazí uloženou konfiguraci v NVRAM
- `show ip route` -- zobrazí směrovací tabulku
- `show ip interface brief` -- přehled rozhraní
- `copy running-config startup-config` -- uložení konfigurace
- `reload` -- restart směrovače
- `erase startup-config` -- smazání konfigurace

*Přechod do konfiguračního režimu:*
```
Router# configure terminal
```

*Návrat do user režimu:*
```
Router# disable
```

*3. Global Configuration Mode (Globální konfigurační režim)*

```
Router(config)#
```

- Režim pro změnu globálních nastavení směrovače
- Příkazy ovlivňují celé zařízení
- Výchozí bod pro vstup do dalších konfiguračních režimů

*Základní příkazy:*
```
Router(config)# hostname R1                    # Změna názvu
Router(config)# enable secret Cisco123         # Nastavení enable hesla
Router(config)# banner motd # Vstup zakazan #  # Úvodní zpráva
Router(config)# no ip domain-lookup            # Vypnutí DNS lookup
Router(config)# service password-encryption    # Šifrování hesel
```

*Přechod do sub-režimů:*
- `interface gigabitethernet 0/0` -- Interface Configuration Mode
- `line console 0` -- Line Configuration Mode
- `router ospf 1` -- Router Configuration Mode

*Návrat:*
```
Router(config)# exit        # Návrat do privileged EXEC
Router(config)# end         # Návrat do privileged EXEC
Router(config)# Ctrl+Z      # Návrat do privileged EXEC
```

*4. Interface Configuration Mode (Konfigurační režim rozhraní)*

```
Router(config-if)#
```

- Konfigurace jednotlivých síťových rozhraní
- Nastavení IP adresy, masky, popisu, rychlosti

*Příklady příkazů:*
```
Router(config)# interface gigabitethernet 0/0
Router(config-if)# ip address 192.168.1.1 255.255.255.0
Router(config-if)# description LAN Connection
Router(config-if)# no shutdown
Router(config-if)# exit
```

*5. Line Configuration Mode (Konfigurační režim linky)*

```
Router(config-line)#
```

- Konfigurace přístupu přes console, VTY (Telnet/SSH), AUX porty
- Nastavení hesel a přístupových práv

*Console:*
```
Router(config)# line console 0
Router(config-line)# password cisco123
Router(config-line)# login
Router(config-line)# logging synchronous
Router(config-line)# exec-timeout 5 0
```

*VTY (Telnet/SSH):*
```
Router(config)# line vty 0 4
Router(config-line)# password cisco123
Router(config-line)# login
Router(config-line)# transport input ssh    # Pouze SSH
```

*6. Router Configuration Mode (Konfigurační režim směrovacího protokolu)*

```
Router(config-router)#
```

- Konfigurace dynamických směrovacích protokolů (RIP, EIGRP, OSPF, BGP)

*Příklad:*
```
Router(config)# router ospf 1
Router(config-router)# network 192.168.1.0 0.0.0.255 area 0
Router(config-router)# passive-interface gigabitethernet 0/0
```

*Klávesové zkratky:*
- *Tab* -- doplnění příkazu
- *Ctrl+C* -- přerušení příkazu
- *Ctrl+Z* -- návrat do privileged EXEC
- *Ctrl+Shift+6* -- přerušení procesu (ping, traceroute)
- *?* -- nápověda (seznam dostupných příkazů)
- *Up/Down arrows* -- historie příkazů

== Směrovací tabulka (Routing Table)

*Směrovací tabulka* je databáze uložená v paměti směrovače, která obsahuje informace o dostupných sítích a o tom, jak se k nim dostat. Každý směrovač má vlastní směrovací tabulku, kterou používá pro rozhodování o přeposílání paketů.

*Zobrazení směrovací tabulky:*
```
Router# show ip route
```

*Struktura záznamu ve směrovací tabulce:*

Každý záznam obsahuje:
1. *Zdroj trasy* -- jak byla trasa naučena (C, S, R, O, atd.)
2. *Cílová síť* -- IP adresa sítě a maska
3. *Administrative Distance* -- spolehlivost zdroje informace
4. *Metrika* -- "cena" cesty
5. *Next-hop* -- IP adresa dalšího směrovače na cestě
6. *Časové razítko* -- jak dlouho je trasa aktivní
7. *Výstupní rozhraní* -- rozhraní, kterým má být paket odeslán

*Příklad výstupu:*
```
Router# show ip route

Codes: C - connected, S - static, R - RIP, M - mobile, B - BGP
       D - EIGRP, EX - EIGRP external, O - OSPF, IA - OSPF inter area
       N1 - OSPF NSSA external type 1, N2 - OSPF NSSA external type 2
       E1 - OSPF external type 1, E2 - OSPF external type 2
       i - IS-IS, su - IS-IS summary, L1 - IS-IS level-1, L2 - IS-IS level-2
       ia - IS-IS inter area, * - candidate default, U - per-user static route
       o - ODR, P - periodic downloaded static route

Gateway of Last Resort is 10.1.1.2 to network 0.0.0.0

S*   0.0.0.0/0 [1/0] via 10.1.1.2                    # Výchozí trasa
     10.0.0.0/8 is variably subnetted, 2 subnets, 2 masks
C       10.1.1.0/30 is directly connected, Serial0/0/0
L       10.1.1.1/32 is directly connected, Serial0/0/0
     172.16.0.0/16 is variably subnetted, 2 subnets, 2 masks
C       172.16.1.0/24 is directly connected, GigabitEthernet0/0
L       172.16.1.1/32 is directly connected, GigabitEthernet0/0
S    192.168.1.0/24 [1/0] via 10.1.1.2               # Statická trasa
O    192.168.2.0/24 [110/65] via 10.1.1.2, 00:05:12, Serial0/0/0  # OSPF
```

*Význam kódů:*
- *C (Connected)* -- přímo připojené sítě
- *L (Local)* -- lokální IP adresy rozhraní (/32 host route)
- *S (Static)* -- staticky nakonfigurované trasy
- *S\** -- výchozí statická trasa (default route)
- *O (OSPF)* -- trasy naučené přes OSPF
- *R (RIP)* -- trasy naučené přes RIP
- *D (EIGRP)* -- trasy naučené přes EIGRP
- *B (BGP)* -- trasy naučené přes BGP

*Proces vyhledávání v směrovací tabulce:*

1. *Exact match* (přesná shoda)
  - Nejprve se hledá přesná shoda s cílovou IP adresou

2. *Longest prefix match*
  - Pokud není přesná shoda, použije se trasa s nejdelším prefixem (nejspecifičtější)
  - Příklad: Pro cíl 192.168.1.50 se upřednostní 192.168.1.0/24 před 192.168.0.0/16

3. *Default route*
  - Pokud není nalezena žádná shoda, použije se výchozí trasa (0.0.0.0/0)
  - Gateway of Last Resort

4. *Zahození paketu*
  - Pokud neexistuje ani výchozí trasa, paket je zahozen
  - Odesílateli může být vrácena ICMP zpráva "Destination Unreachable"

*Důležité příkazy pro práci se směrovací tabulkou:*
```
Router# show ip route                    # Celá směrovací tabulka
Router# show ip route connected          # Pouze připojené sítě
Router# show ip route static             # Pouze statické trasy
Router# show ip route 192.168.1.0        # Informace o konkrétní síti
Router# show ip route summary            # Shrnutí směrovací tabulky
```

== Přímo připojené sítě, vzdálené sítě, výchozí trasa

*1. Přímo připojené sítě (Directly Connected Networks)*

Sítě, které jsou *přímo připojeny k rozhraním směrovače*. Tyto trasy se automaticky objeví ve směrovací tabulce, jakmile je rozhraní nakonfigurováno s IP adresou a aktivováno příkazem `no shutdown`.

*Charakteristika:*
- Označeny kódem *C* (Connected)
- Nejnižší Administrative Distance = 0 (nejvíce důvěryhodné)
- Automaticky přidány do směrovací tabulky
- Žádná metrika není potřeba
- Představují místní sítě LAN/WAN

*Příklad konfigurace:*
```
Router(config)# interface gigabitethernet 0/0
Router(config-if)# ip address 192.168.1.1 255.255.255.0
Router(config-if)# no shutdown
Router(config-if)# exit

Router(config)# interface gigabitethernet 0/1
Router(config-if)# ip address 10.0.0.1 255.255.255.0
Router(config-if)# no shutdown
```

*Směrovací tabulka:*
```
Router# show ip route
...
C    192.168.1.0/24 is directly connected, GigabitEthernet0/0
L    192.168.1.1/32 is directly connected, GigabitEthernet0/0
C    10.0.0.0/24 is directly connected, GigabitEthernet0/1
L    10.0.0.1/32 is directly connected, GigabitEthernet0/1
```

- *C* -- síťový prefix celé sítě
- *L* -- lokální adresa /32 (host route) konkrétního rozhraní

*2. Vzdálené sítě (Remote Networks)*

Sítě, které *nejsou přímo připojeny* ke směrovači, ale jsou dostupné přes jiný směrovač. Informace o vzdálených sítích musí být do směrovací tabulky získána:
- Statickou konfigurací (Static Routes)
- Dynamickým směrovacím protokolem (RIP, EIGRP, OSPF, BGP)

*Charakteristika:*
- Označeny různými kódy (S, R, O, D, B) podle zdroje
- Vyžadují next-hop IP adresu nebo výstupní rozhraní
- Mají přiřazenou metriku
- Administrative Distance závisí na zdroji informace

*Příklad statické trasy ke vzdálené síti:*
```
Router(config)# ip route 172.16.0.0 255.255.0.0 10.0.0.2
```

*Směrovací tabulka:*
```
S    172.16.0.0/16 [1/0] via 10.0.0.2
```

*Příklad dynamické trasy (OSPF):*
```
O    192.168.5.0/24 [110/65] via 10.0.0.2, 00:10:25, GigabitEthernet0/1
```

*3. Výchozí trasa (Default Route)*

Speciální typ statické trasy označující *cestu pro všechny cílové sítě*, které nejsou explicitně uvedeny ve směrovací tabulce. Používá se síťová adresa *0.0.0.0/0*, která odpovídá všem IP adresám.

*Charakteristika:*
- Označena jako *S\** (static default route)
- Často označována jako "Gateway of Last Resort"
- Síťová adresa: 0.0.0.0
- Maska: 0.0.0.0 (prefix /0)
- Používá se typicky pro připojení k Internetu
- Šetří místo ve směrovací tabulce

*Konfigurace výchozí trasy:*

*Pomocí next-hop IP adresy:*
```
Router(config)# ip route 0.0.0.0 0.0.0.0 203.0.113.2
```

*Pomocí výstupního rozhraní:*
```
Router(config)# ip route 0.0.0.0 0.0.0.0 serial0/0/0
```

*Kombinace rozhraní a next-hop:*
```
Router(config)# ip route 0.0.0.0 0.0.0.0 serial0/0/0 203.0.113.2
```

*Směrovací tabulka s výchozí trasou:*
```
Router# show ip route
...
Gateway of Last Resort is 203.0.113.2 to network 0.0.0.0

S*   0.0.0.0/0 [1/0] via 203.0.113.2
C    192.168.1.0/24 is directly connected, GigabitEthernet0/0
C    10.0.0.0/30 is directly connected, Serial0/0/0
```

*Kdy použít výchozí trasu:*
- *Stub network* -- síť s jediným výstupním bodem
- Připojení k ISP (Internet Service Provider)
- Zjednodušení směrovací tabulky
- V případě, že znáte pouze jeden směr "ven" ze sítě

*Ověření:*
```
Router# show ip route static
S*   0.0.0.0/0 [1/0] via 203.0.113.2

Router# show ip route | include Gateway
Gateway of Last Resort is 203.0.113.2 to network 0.0.0.0
```

*Hierarchie vyhledávání cesty:*
1. Hledání přesné shody nebo longest prefix match ve směrovací tabulce
2. Pokud není nalezena specifická trasa → použije se default route
3. Pokud neexistuje default route → paket je zahozen

== Základní terminologie směrování

*1. Router (Směrovač)*

Síťové zařízení Layer 3, které propojuje různé sítě a rozhoduje o nejlepší cestě pro přenos dat mezi nimi. Směrovač analyzuje IP adresu cílového paketu a na základě směrovací tabulky určí, kam paket přeposlat.

*2. Routing Table (Směrovací tabulka)*

Databáze obsahující informace o dostupných sítích a cestách k nim. Obsahuje záznamy o:
- Cílových sítích a maskách
- Next-hop adresách
- Metrikách tras
- Výstupních rozhraních
- Administrative Distance

*3. Next Hop*

*Next-hop* je IP adresa dalšího směrovače (nebo brány) na cestě k cílové síti. Je to "následující krok" v procesu směrování paketu k jeho konečnému cíli.

*Příklad:*
```
S    192.168.5.0/24 [1/0] via 10.0.0.2
                           ^^^^^^^^^^
                           Next-hop IP adresa
```

Když směrovač potřebuje odeslat paket do sítě 192.168.5.0/24, přepošle ho na adresu 10.0.0.2, kde se nachází další směrovač, který je blíže k cíli.

*Typy next-hop:*
- *Next-hop IP* -- IP adresa následującího směrovače
  ```
  ip route 172.16.0.0 255.255.0.0 10.0.0.2
  ```

- *Výstupní rozhraní* -- lokální rozhraní, kterým má být paket odeslán
  ```
  ip route 172.16.0.0 255.255.0.0 serial0/0/0
  ```

- *Kombinace* -- rozhraní + next-hop IP (doporučeno pro sítě point-to-point)
  ```
  ip route 172.16.0.0 255.255.0.0 serial0/0/0 10.0.0.2
  ```

*4. Administrative Distance (AD)*

*Administrative Distance* je číslo v rozsahu 0-255, které udává *důvěryhodnost zdroje* směrovací informace. Čím nižší hodnota AD, tím více je zdroj důvěryhodný.

Když směrovač má více tras ke stejné cílové síti z různých zdrojů, vybere trasu s nejnižší AD.

*Výchozí hodnoty Administrative Distance:*

#table(
  columns: (2fr, 1fr),
  align: left,
  [*Zdroj trasy*], [*AD*],
  [*Přímo připojená síť (Connected)*], [0],
  [*Statická trasa (Static)*], [1],
  [*EIGRP summary route*], [5],
  [*External BGP (eBGP)*], [20],
  [*Internal EIGRP*], [90],
  [*OSPF*], [110],
  [*IS-IS*], [115],
  [*RIP*], [120],
  [*External EIGRP*], [170],
  [*Internal BGP (iBGP)*], [200],
  [*Nedostupná trasa*], [255],
)

*Příklad ve směrovací tabulce:*
```
S    192.168.5.0/24 [1/0] via 10.0.0.2
O    192.168.5.0/24 [110/65] via 10.0.0.3
                    ^^^
                    Administrative Distance
```

V tomto případě existují dvě cesty do sítě 192.168.5.0/24:
- Statická trasa s AD = 1
- OSPF trasa s AD = 110

Směrovač použije *statickou trasu* (AD = 1), protože má nižší AD a je považována za důvěryhodnější.

*Metrika vs. Administrative Distance:*
- *AD* -- porovnává důvěryhodnost různých směrovacích protokolů
- *Metrika* -- porovnává kvality cest v rámci *stejného* směrovacího protokolu

*Příklad:*
```
O    192.168.5.0/24 [110/65] via 10.0.0.2
O    192.168.5.0/24 [110/128] via 10.0.0.3
                         ^^^
                         Metrika
```

Obě trasy jsou z OSPF (stejná AD = 110), ale první má nižší metriku (65 < 128), takže bude preferována.

*Změna Administrative Distance:*

AD lze manuálně upravit pro statické trasy (tzv. floating static route):

```
Router(config)# ip route 192.168.5.0 255.255.255.0 10.0.0.2 150
                                                            ^^^
                                                            Vlastní AD
```

Tato statická trasa má AD = 150, což je více než OSPF (110). Bude použita pouze jako záložní cesta, pokud OSPF trasa selže.

== Příkaz ip route -- Konfigurace statické trasy

Příkaz `ip route` slouží ke konfiguraci statických tras ve směrovači. Statická trasa je manuálně nakonfigurovaná cesta k cílové síti.

*Syntaxe příkazu:*
```
ip route network-address subnet-mask {ip-address | exit-intf [ip-address]} [distance]
```

*Parametry:*

1. *network-address*
  - IP adresa cílové sítě, do které chceme směrovat
  - Příklad: `192.168.5.0`, `172.16.0.0`, `0.0.0.0` (pro default route)

2. *subnet-mask*
  - Maska podsítě cílové sítě
  - Příklad: `255.255.255.0`, `255.255.0.0`, `0.0.0.0` (pro default route)
  - Alternativně lze použít prefix zápis: `/24`, `/16`, `/0`

3. *ip-address* nebo *exit-intf*
  - *ip-address* -- Next-hop IP adresa (IP adresa následujícího směrovače)
  - *exit-intf* -- Výstupní rozhraní (interface, kterým má být paket odeslán)
  - Lze kombinovat: `exit-intf ip-address`

4. *distance* (volitelné)
  - Administrative Distance (0-255)
  - Výchozí hodnota pro statické trasy je 1
  - Používá se pro floating static routes (záložní trasy)

*Typy statických tras podle konfigurace:*

*1. Next-hop Static Route*

Specifikuje se IP adresa dalšího směrovače (next-hop).

```
Router(config)# ip route 192.168.5.0 255.255.255.0 10.0.0.2
```

- Cílová síť: 192.168.5.0/24
- Next-hop: 10.0.0.2
- Směrovač musí provést rekurzivní lookup (najít, kterým rozhraním dosáhne next-hop)

*Výhody:*
- Funguje v sítích s více cestami
- Nezávisí na stavu konkrétního rozhraní

*Nevýhody:*
- Vyžaduje další lookup ve směrovací tabulce
- Mírně pomalejší než directly connected

*2. Directly Connected Static Route*

Specifikuje se výstupní rozhraní místo next-hop IP.

```
Router(config)# ip route 192.168.5.0 255.255.255.0 serial0/0/0
```

- Cílová síť: 192.168.5.0/24
- Výstupní rozhraní: Serial0/0/0
- Paket je odeslán přímo na toto rozhraní

*Výhody:*
- Rychlejší zpracování (bez rekurzivního lookup)
- Vhodné pro point-to-point spoje

*Nevýhody:*
- Trasa je ve směrovací tabulce pouze pokud je rozhraní aktivní
- Nevhodné pro multi-access sítě (Ethernet)

*3. Fully Specified Static Route*

Kombinace výstupního rozhraní a next-hop IP.

```
Router(config)# ip route 192.168.5.0 255.255.255.0 serial0/0/0 10.0.0.2
```

- Cílová síť: 192.168.5.0/24
- Výstupní rozhraní: Serial0/0/0
- Next-hop: 10.0.0.2

*Výhody:*
- Nejspecifičtější konfigurace
- Doporučeno pro point-to-point spoje
- Eliminuje problémy s ARP na Ethernet sítích

*4. Default Static Route*

Výchozí trasa pro všechny cílové sítě (0.0.0.0/0).

```
Router(config)# ip route 0.0.0.0 0.0.0.0 203.0.113.1
```

- Síť: 0.0.0.0 (všechny sítě)
- Maska: 0.0.0.0 (odpovídá všem IP adresám)
- Next-hop: 203.0.113.1 (typicky ISP gateway)

*5. Floating Static Route*

Záložní statická trasa s vyšší AD, použije se při selhání primární trasy.

```
Router(config)# ip route 192.168.5.0 255.255.255.0 10.0.0.2
Router(config)# ip route 192.168.5.0 255.255.255.0 10.0.0.3 150
                                                            ^^^
                                                            Vyšší AD
```

- Primární trasa: via 10.0.0.2 (AD = 1)
- Záložní trasa: via 10.0.0.3 (AD = 150)
- Záložní trasa se aktivuje pouze pokud primární trasa není dostupná

*Praktické příklady konfigurace:*

*Scenario: Základní korporátní síť*

```
! Topologie:
! R1 -- [10.1.1.0/30] -- R2 -- [10.1.2.0/30] -- R3
! |                       |                      |
! 192.168.1.0/24      192.168.2.0/24       192.168.3.0/24

! Konfigurace R1:
R1(config)# ip route 192.168.2.0 255.255.255.0 10.1.1.2
R1(config)# ip route 192.168.3.0 255.255.255.0 10.1.1.2
R1(config)# ip route 0.0.0.0 0.0.0.0 serial0/0/0 10.1.1.2

! Konfigurace R2:
R2(config)# ip route 192.168.1.0 255.255.255.0 10.1.1.1
R2(config)# ip route 192.168.3.0 255.255.255.0 10.1.2.2

! Konfigurace R3:
R3(config)# ip route 192.168.1.0 255.255.255.0 10.1.2.1
R3(config)# ip route 192.168.2.0 255.255.255.0 10.1.2.1
R3(config)# ip route 0.0.0.0 0.0.0.0 10.1.2.1
```

*Ověření konfigurace:*

```
Router# show ip route static
S    192.168.5.0/24 [1/0] via 10.0.0.2
S*   0.0.0.0/0 [1/0] via 203.0.113.1

Router# show ip route 192.168.5.0
Routing entry for 192.168.5.0/24
  Known via "static", distance 1, metric 0
  Routing Descriptor Blocks:
  * 10.0.0.2
      Route metric is 0, traffic share count is 1

Router# show running-config | include ip route
ip route 192.168.5.0 255.255.255.0 10.0.0.2
ip route 0.0.0.0 0.0.0.0 203.0.113.1
```

*Test konektivity:*
```
Router# ping 192.168.5.1
Type escape sequence to abort.
Sending 5, 100-byte ICMP Echos to 192.168.5.1, timeout is 2 seconds:
!!!!!
Success rate is 100 percent (5/5), round-trip min/avg/max = 1/2/4 ms

Router# traceroute 192.168.5.1
Tracing the route to 192.168.5.1
  1 10.0.0.2 4 msec 4 msec 4 msec
  2 192.168.5.1 8 msec 8 msec 8 msec
```

*Odstranění statické trasy:*
```
Router(config)# no ip route 192.168.5.0 255.255.255.0 10.0.0.2
```

*Best Practices pro statické směrování:*

1. *Dokumentace* -- vždy komentujte účel každé statické trasy
2. *Next-hop dostupnost* -- ujistěte se, že next-hop je dostupný
3. *Uložení konfigurace* -- po konfiguraci tras uložte: `copy run start`
4. *Verifikace* -- použijte `show ip route`, `ping`, `traceroute`
5. *Redundance* -- zvažte floating static routes pro záložní cesty
6. *Default route* -- použijte pro stub networks a připojení k ISP
7. *Specifičnost* -- preferujte specifické trasy před výchozí trasou
8. *Administrative Distance* -- upravte AD pro ovlivnění priority tras

= Návrh malé sítě, bezpečnost

== Používaná zařízení v malých sítích a způsoby jejich propojení

Malá síť (Small Business Network) typicky slouží firmám s 50-250 zaměstnanci. Složení infrastruktury závisí na konkrétních potřebách, ale obecně se skládá z následujících komponent.

*Základní zařízení malé sítě:*

*1. Přístupový bod (Access Point -- AP)*

Bezdrátový přístup pro mobilní zařízení a notebooky.

- *Umístění:* Centrálně v kanceláři, eventuálně více AP pro větší pokrytí
- *Počet:* 1-3 AP v závislosti na velikosti a prostoru
- *Funkce:* SSID konfigurace, WPA2/WPA3 zabezpečení, PoE napájení

*2. Přepínač (Switch)*

Jádro místní sítě propojující všechna kabelová zařízení.

- *Vrstva:* L2 (managed switch) nebo L3 (switch se směrovacími schopnostmi)
- *Porty:* 24-48 Gigabit Ethernet portů + uplinky (SFP)
- *PoE:* Power over Ethernet pro AP, IP telefony, kamerové systémy
- *VLAN:* Segmentace sítě (oddělení kancelářských, skladových, serverových sítí)

*3. Směrovač (Router)*

Propojuje interní síť s Internetem a poskytuje služby.

- *Typ:* Typically integrated router/firewall (All-in-One device)
- *Porty:* WAN port (obvykle 1), LAN porty (obvykle 4-8)
- *Funkce:* NAT, DHCP server, firewall, VPN gateway
- *ISP připojení:* Ethernet nebo alternativně DSL/4G

*6. Server nebo Mikropočítač (pro služby)*

Pro DHCP, DNS, doménové služby, tisk apod.

- *OS:* Linux, Windows Server, nebo virtualizace (Hyper-V, VMware)
- *Funkce:* Active Directory, DNS server, DHCP server (pokud router nemá)
- *Příklad:* Malý fyzický server nebo virtuální server v cloudu

*7. IP Telefon / VoIP systém*

Telefonie přes IP síť.

- *Typ:* IP telefony s PoE napájením
- *Komunikace:* SIP (Session Initiation Protocol), Cisco Unified Communications
- *Funkce:* Interní volání, připojení k telekomunikačnímu operátorovi
- *Příklad:* Cisco IP Phone 7841, Avaya 9608G

*Topologie propojení v malé síti:*

*Hierarchická topologie (Recommended):*

```
                    Internet
                       |
                     Router/Firewall (gateway)
                       |
              +---------+----------+
              |                    |
           Switch            Wireless AP
              |                    |
    +---------+---------+      Mobile/Laptops
    |         |         |
  Server    Printer   Kamera
  (NAS)
    |
 (PoE)
```

*Detailní připojení:*

1. *Router WAN port* -- připojeno k ISP modemu nebo přímě k Internetu
2. *Router LAN port* -- připojeno k switchi (uplink)
3. *Switch* -- propojuje všechna kabelová zařízení (server, tiskárna, kamera, IP telefon)
4. *Access Point* -- může být připojeno přímo ke switchi nebo routeru
5. *PoE* -- stejný kabel Ethernet slouží pro napájení (kamera, IP telefon, AP bez vlastního zdroje)

*Alternativní topologie (Mesh, pokud malý prostor):*

```
                    Internet
                       |
                 Router/Firewall
                   |
          Access Point (hlavní)
              |
      Access Points (rozšíření)
      
      (Všechna zařízení v jedné síti bez switche)
```

== Výběr těchto zařízení

Při výběru zařízení pro malou síť je třeba zvážit několik faktorů:

*1. Rozpočet*

- *Iniciální investice:* Malé sítě mají omezený rozpočet na IT infrastrukturu
- *Výběr:* Vyrovnání mezi cenou a výkonem
- *ROI (Return on Investment):* Zařízení by mělo poskytovat dostatečný výkon pro 3-5 let bez výměny

*2. Počet uživatelů a zařízení*

- *Scaling:* Zařízení by mělo podpořit očekávaný růst bez rychlé zastaralosti
- *Příklad:* Switch s 24 porty pro malou firmu, s volnými porty pro budoucí rozšíření
- *VLAN schopnost:* Switch musí podporovat VLAN pro segmentaci

*3. Výkon a propustnost*

- *Přenosová rychlost:* Minimálně Gigabit Ethernet (1 Gbps) pro moderní aplikace
- *PoE výkon:* Switch musí mít dostatečný PoE rozpočet pro AP, telefony, kamery
- *Firewall propustnost:* Měří se v Mbps, měl by zvládat peak traffic z Internetu

*4. Spolehlivost a dostupnost*

- *Redundance:* Zvážit redundantní routery, uplinky
- *Zálohování:* NAS s RAID pro ochranu dat

*5. Správa a administrace*

- *Webové rozhraní:* Jednoduché nastavení bez příkazového řádku
- *SNMP monitoring:* Sledování výkonu zařízení
- *Cloud management:* Cisco Meraki, Ubiquiti UniFi -- centrální správa přes web
- *Jednoduché nasazení:* Plug-and-play nebo minimální konfigurační úsilí

*6. Bezpečnost*

- *Firewall funkce:* IPS/IDS, URL filtrování, antimalware
- *Zastaralost:* Zařízení by mělo dostávat bezpečnostní updaty minimálně 5-7 let
- *Kryptografie:* WPA3 pro wireless, AES šifrování
- *Compliance:* Soulad s GDPR, HIPAA (pokud relevantní)

*8. Energetická spotřeba*

- *Provozní náklady:* Nižší spotřeba = nižší elektrické náklady
- *PoE:* Efektivní napájení zařízení Ethernet kabelem

== Adresace pro malou firmu

Plánování IP adres je klíčové pro správný provoz sítě bez konfliktů a problémů se škálovatelností.

*1. Privátní vs. Veřejné IP adresy*

*Privátní IP adresy (RFC 1918):*

```
10.0.0.0 -- 10.255.255.255 (10.0.0.0/8)           -- Třída A
172.16.0.0 -- 172.31.255.255 (172.16.0.0/12)      -- Třída B
192.168.0.0 -- 192.168.255.255 (192.168.0.0/16)   -- Třída C
```

- Nejsou směrovány na Internetu
- Zdarma k použití v privátních sítích
- Vyžadují NAT pro připojení k Internetu

*Veřejné IP adresy:*

- Přidělovány ISP nebo registrem (RIPE, ARIN, APNIC)
- Jedinečné na celém Internetu
- Dražší alternativa

*Doporučení pro malou firmu:*

- Použít privátní adresy pro interní síť (192.168.x.x pro jednoduchost)
- NAT na routeru pro překlad na veřejné IP při komunikaci s Internetem
- Případně si koupit malý blok veřejných adres pro server/webové služby (pokud je nutné)

*2. Schéma adresace pro malou firmu*

*Příklad pro firmu s 60 zaměstnanci:*

```
Hlavní subnet: 192.168.1.0/24 (254 dostupných adres)

192.168.1.0 -- Network address
192.168.1.1 -- Gateway (Router/Default Gateway)
192.168.1.2-50 -- DHCP rozsah pro počítače
192.168.1.51-100 -- Rezervované pro statické adresy (servery, tiskárny)
192.168.1.100 -- NAS Server
192.168.1.101 -- Domain Controller / DNS server
192.168.1.110 -- IP PBX (telefony)
192.168.1.120-129 -- IP kamery
192.168.1.130-139 -- Síťové tiskárny
192.168.1.150-180 -- Reserva pro budoucí zařízení
192.168.1.255 -- Broadcast address
```

*VLAN segmentace (pro větší firmu):*

```
VLAN 10 (Office):        192.168.10.0/24
  - Kancelářské počítače
  - Default gateway:      192.168.10.1
  - DHCP pool:           192.168.10.100-192.168.10.200
  
VLAN 20 (Servers):      192.168.20.0/24
  - Servery, NAS
  - Default gateway:      192.168.20.1
  - Statické adresy:      192.168.20.10-192.168.20.50
  
VLAN 30 (VoIP):         192.168.30.0/24
  - IP telefony
  - Default gateway:      192.168.30.1
  - DHCP pool:           192.168.30.100-192.168.30.200
  
VLAN 40 (Security):     192.168.40.0/24
  - IP kamery
  - Default gateway:      192.168.40.1
  - Statické adresy:      192.168.40.10-192.168.40.50
  
VLAN 50 (Guest):        192.168.50.0/24
  - Hosté, jednorázový přístup
  - Default gateway:      192.168.50.1
  - DHCP pool:           192.168.50.100-192.168.50.200
```

*3. DHCP konfigurace*

Automatické přidělování IP adres z routeru:

```
Router(config)# ip dhcp pool OFFICE
Router(dhcp-config)# network 192.168.1.0 255.255.255.0
Router(dhcp-config)# default-router 192.168.1.1
Router(dhcp-config)# dns-server 8.8.8.8 8.8.4.4
Router(dhcp-config)# lease 7          # 7 dní

Router(config)# ip dhcp excluded-address 192.168.1.1 192.168.1.99
                                       # Vyloučené adresy
```

*4. DNS konfigurace*

Usnadňuje přístup k serverům pomocí jmen namísto IP adres:

```
Router(config)# ip dns server
Router(config)# ip domain-name example.com

! Nebo použít externí DNS:
Router(config)# ip name-server 8.8.8.8 8.8.4.4
```

*Doporučené DNS servery:*

- *Google Public DNS:* 8.8.8.8, 8.8.4.4
- *Cloudflare:* 1.1.1.1, 1.0.0.1
- *OpenDNS:* 208.67.222.222, 208.67.220.220

*5. Doporučení pro IP adresaci*

- Ponechat dostatek volné kapacity (neminimalista s rozsahy)
- Dokumentovat přidělené adresy (tabulka nebo IPAM systém)
- Používat statické adresy pro servery a síťová zařízení
- DHCP pro klientské počítače a mobilní zařízení
- VLAN pro oddělení různých typů provozu
- Zvážit IPv6 pro budoucí rozšiřitelnost (migrační plán)

== Redundance v malé síti, QoS

*1. Redundance v malé síti*

Redundance je důležitá pro minimalizaci výpadků. I malá firma by měla mít základní záložní mechanismy.

*Typy redundance:*

*A) Redundance ISP připojení*

```
         Internet
          /    \
        ISP1   ISP2
         /        \
      Router1 -- Router2 (fail-over)
         |          |
       Switch
```

- *Primární připojení:* ISP1 (např. optika)
- *Záložní připojení:* ISP2 (např. DSL, 4G/LTE)
- *Automatické přepnutí:* Při výpadku ISP1 se komunikace přepne na ISP2
- *Configuace:* Floating static routes, OSPF s různými AD

*B) Redundance routeru*

```
Active router (172.16.1.1)
        |
        X Výpadek
        |
Standby router (172.16.1.2 -- přebírá IP 172.16.1.1)
```

- *HSRP (Hot Standby Router Protocol):* Cisco vlastnické řešení
- *VRRP (Virtual Router Redundancy Protocol):* Standard (RFC 5798)
- *Automatické přepnutí:* Při selhání aktivního routeru se standby aktivuje
- *Heartbeat:* Pravidelná kontrola dostupnosti

*Konfigurace HSRP:*

```
! Primární router (Router1)
Router1(config)# interface gigabitethernet 0/0
Router1(config-if)# ip address 192.168.1.2 255.255.255.0
Router1(config-if)# standby 1 ip 192.168.1.1
Router1(config-if)# standby 1 priority 110
Router1(config-if)# standby 1 preempt

! Backup router (Router2)
Router2(config)# interface gigabitethernet 0/0
Router2(config-if)# ip address 192.168.1.3 255.255.255.0
Router2(config-if)# standby 1 ip 192.168.1.1
Router2(config-if)# standby 1 priority 100
```

*C) Redundance úložiště*

```
NAS se čtyřmi disky (RAID 5 nebo RAID 6)
- RAID 5: 3 disky pro data, 1 pro paritu (2 TB kapacita z 4x 2TB)
- RAID 6: 2 disky pro paritu (2 TB kapacita z 4x 2TB, ale možnost ztráty 2 disků)
```

Automatické zálohování:

```
! Primární NAS -- Zálohovací NAS v cloudu
NAS1 -----> Cloud Storage (Azure, AWS, Google Drive)
           Denní synchronizace v 2:00 AM
```

*D) Redundance síťového spoje*

```
Switch s redundancními uplinky:
Port 1/49 -- Router1 (primární)
Port 1/50 -- Router2 (backup)

STP (Spanning Tree Protocol) automaticky vybere primární a backup cestu
```

*2. QoS (Quality of Service)*

QoS zajišťuje správnou prioritu pro kritické aplikace.

*Proč QoS?*

- Zabraňuje jedné aplikaci v "hlasitosti" ostatních
- Priorita pro IP telefony (VoIP) -- nesmí být zapoždění
- Snižování priorit peer-to-peer (BitTorrent, eMule)
- Ochrana bandwidth pro business-critical aplikace

*Úrovně prioritu:*

```
DSCP (Differentiated Services Code Point) -- 6 bitů pro prioritu

Priority 6 (Voice):      EF (Expedited Forwarding) -- VoIP, video call
Priority 5 (Video):      AF4 -- Video streaming, video konference
Priority 4 (Business):   AF3 -- CRM, email, HTTP web
Priority 3 (Best effort): AF2 -- Normální data
Priority 2 (Bulk):       AF1 -- Zálohy, torrenty
Priority 1 (Background): CS1 -- DNS lookups
Priority 0 (Scavenger):  CS0 -- Veškerý ostatní provoz
```

*Konfigurace QoS na routeru Cisco:*

```
! Definice class map (identifikace provozu)
Router(config)# class-map VOICE
Router(config-cmap)# match protocol rtp audio
Router(config-cmap)# exit

Router(config)# class-map VIDEO
Router(config-cmap)# match protocol h323
Router(config-cmap)# exit

Router(config)# class-map BUSINESS
Router(config-cmap)# match protocol http
Router(config-cmap)# match protocol https
Router(config-cmap)# exit

! Definice policy map (akce pro danou třídu)
Router(config)# policy-map QoS_POLICY
Router(config-pmap)# class VOICE
Router(config-pmap-c)# priority 25000   # 25 Mbps pro hlasitost
Router(config-pmap-c)# exit
Router(config-pmap)# class VIDEO
Router(config-pmap-c)# bandwidth 50000   # 50 Mbps pro video
Router(config-pmap-c)# exit
Router(config-pmap)# class BUSINESS
Router(config-pmap-c)# bandwidth 100000  # 100 Mbps pro business
Router(config-pmap-c)# exit

! Aplikace policy na rozhraní
Router(config)# interface serial0/0/0
Router(config-if)# service-policy output QoS_POLICY
```

*Kontrola QoS:*

```
Router# show policy-map interface serial0/0/0
Router# show class-map
Router# show policy-map
```

== Služby v malé síti

*1. DHCP (Dynamic Host Configuration Protocol)*

Automatické přidělování IP adres, DNS, default gateway.

- *Výhoda:* Žádné manuální nastavení v klientech
- *Problém:* Přetížený DHCP server může způsobit výpadek
- *Redundance:* Primary + standby DHCP server (nebo router + server)

*Konfigurace DHCP na routeru:*

```
Router(config)# service dhcp
Router(config)# ip dhcp pool OFFICE
Router(dhcp-config)# network 192.168.1.0 255.255.255.0
Router(dhcp-config)# default-router 192.168.1.1
Router(dhcp-config)# dns-server 192.168.1.101 8.8.8.8
Router(dhcp-config)# domain-name example.com
Router(dhcp-config)# lease 3

Router(config)# ip dhcp excluded-address 192.168.1.1 192.168.1.99
```

*2. DNS (Domain Name System)*

Překlad doménových jmen na IP adresy.

- *Interní DNS:* Pro intranet (www.example.local, mail.example.local)
- *Externí DNS:* Veřejné domény (www.example.com, gmail.com)

*Konfigurace:*

```
Router(config)# logging 192.168.1.101
Router(config)# logging trap informational
```

*5. Active Directory / LDAP*

Správa uživatelů a přístupů (Windows domain controller).

- *Autentizace:* Jednotné přihlášení (SSO) pro počítače a aplikace
- *Skupiny:* Nastavení práv a oprávnění na základě skupin
- *Certifikáty:* Vydávání interních certifikátů (root CA)

*Konfigurace na routeru pro RADIUS (přístup k síti):*

```
Router(config)# aaa new-model
Router(config)# aaa authentication login default group radius local
Router(config)# radius server ADSERVER
Router(config-radius)# address ipv4 192.168.1.101
Router(config-radius)# key example123
Router(config-radius)# exit
```

*6. Mail Server (SMTP, POP3, IMAP)*

Lokální nebo cloud mail pro firmu.

- *On-premise:* Vlastní mail server (Microsoft Exchange, Postfix/Dovecot)
- *Cloud:* Microsoft 365, Google Workspace (jednodušší, bez správy)

*SPF/DKIM/DMARC:* DNS záznamy proti spoofingu

```
SPF záznam (prevent spoofing):
v=spf1 include:_spf.google.com ~all

DKIM (digital signature):
Podpisuje emaily privátním klíčem

DMARC (authentication):
p=quarantine (karanténa podezřelých emailů)
```

== Audio a video aplikace

*1. VoIP (Voice over IP)*

Telefonie přes IP síť.

*Komponenty:*

- *IP telefony:* Cisco 7841, Avaya 9608G
- *VoIP gateway:* Propojení s veřejným telefonním systémem (PSTN)
- *Call manager/PBX:* Centrální řídící prvek (Cisco Unified Communications Manager, Avaya Communication Manager)
- *Voicemail:* Система hlasové pošty (Unity, Cisco Unity)

*Výhody VoIP:*

- *Nižší náklady:* Oproti ISDN/analogovému telefonu
- *Flexibilita:* Přenositelnost na jiné zařízení
- *Integrace:* S emaily, instant messaging, videem
- *Funkcionalita:* Call forwarding, call recording, IVR (Interactive Voice Response)

*Konfigurace SIP trunk k ISP:*

```
! Cisco router s VoIP
Router(config)# dial-peer voice 1 voip
Router(config-dial-peer)# description ISP SIP Trunk
Router(config-dial-peer)# destination-pattern 0......
Router(config-dial-peer)# session protocol sipv2
Router(config-dial-peer)# session target ipv4:203.0.113.1
Router(config-dial-peer)# codec g711ulaw

Router(config)# sip-ua
Router(config-sip-ua)# local-address 192.168.1.110
Router(config-sip-ua)# credential default
Router(config-sip-ua-cred)# username pbx_user
Router(config-sip-ua-cred)# password secret123
```

*QoS pro VoIP:*

- *Jitter buffer:* Vybírá balíčky s minimálním zpoždením
- *Codec:* G.711 (64 kbps, vyšší kvalita) vs. G.729 (8 kbps, komprese)
- *Priorita:* EF (Expedited Forwarding) DSCP markování
- *Bandwidth:* Minimálně 100 kbps na cestu (+ overhead protokolu)

*2. Video Konference*

Synchronní videokomunikace pro porady a spolupráci.

*Typy:*

- *Desktop konference:* Počítačová software (Cisco Webex, Microsoft Teams, Zoom)
- *Room system:* Vyhrazené zařízení (Cisco Collaboration Endpoint, Polycom Group Series)
- *Hybrid:* Kombinace desktopů a místností

*Komponenty:*

- *MCU (Multipoint Control Unit):* Propojování více účastníků
- *Bandwidth:* 1-4 Mbps na účastníka (v závislosti na kvalitě)
- *Latency:* Měl by být < 150 ms
- *Codec:* H.264, VP8, VP9

*Konfigurace pro Cisco Webex:*

```
! Router nastavení pro Webex
! Ensure QoS traffic is not rate-limited
Router(config)# class-map VIDEO_CONF
Router(config-cmap)# match protocol webex
Router(config-cmap)# exit

Router(config)# policy-map VIDEO_POLICY
Router(config-pmap)# class VIDEO_CONF
Router(config-pmap-c)# priority 75000   # 75 Mbps
```

*3. Video streaming / IPTV*

Streamování videa pro tréninky, firemní kanály apod.

- *Protokol:* HTTP (YouTube, Vimeo), RTSP (security kamera), RTP (live TV)
- *Bitrate:* 500 kbps - 5 Mbps v závislosti na rozlišení
- *Kapacita:* Pokud 30 zaměstnanců streamuje HD video: 30 \* 2 Mbps = 60 Mbps
- *Caching:* Lokální mezipaměť (content delivery network) zlepšuje rychlost

*4. Audio streaming*

- *Podcast:* Asynchronní distribuce
- *Music streaming:* Spotify, Apple Music (low bitrate 128 kbps)
- *Internet radio:* Streamování hudby 24/7

*Doporučení:*

- *Dedikované VLAN* pro video a audio aplikace
- *QoS* s prioritou pro synchronní komunikaci (VoIP, video konference)
- *Monitorování bandwidth:* SNMP, NetFlow monitoring
- *Nástroje:* Cisco AppDynamics, Cisco DNA Assurance


== Zabezpečení malé sítě

Zabezpečení je nejdůležitější aspekt provozu sítě. Malé firmy jsou často terčem cyberútoků.

*1. Perimetrální bezpečnost (Firewall)*

*Typy firewallu:*

- *Stavový firewall:* Sleduje stav konexí (UDP, TCP handshake)
- *NGF (Next-Generation Firewall):* IPS/IDS, aplikační filtrování, sandboxing
- *Hardware firewall:* Na hranici sítě (router/firewall zařízení)
- *Software firewall:* Na každém PC/serveru (Windows Defender, macOS firewall)

*Konfigurace přístupové kontroly (ACL):*

```
! Povolení webového provozu ven
Router(config)# access-list 101 permit tcp any any eq 80
Router(config)# access-list 101 permit tcp any any eq 443

! Blokování P2P aplikací
Router(config)# access-list 102 deny tcp any any eq 6881:6889
Router(config)# access-list 102 permit ip any any

! Aplikace na rozhraní
Router(config)# interface serial0/0/0
Router(config-if)# ip access-group 101 out
```

*2. Bezpečnost bezdrátové sítě (WLAN)*

- *Šifrování:* Minimum WPA2, ideálně WPA3
- *Heslo:* Silné heslo (14+ znaků, mix velkých, malých, číslic, speciálních znaků)
- *SSID skrytí:* Mírná ochrana (nejde proti určitému útočníkovi)
- *MAC filtrování:* Povolení jen známých zařízení (není proaktivní, pouze reaktivní)
- *Guest network:* Oddělená síť pro návštěvy bez přístupu k důležitým zdrojům

*Konfigurace WPA3 Personal na Cisco AP:*

```
ap# configure terminal
ap(config)# interface Dot11Radio0
ap(config-if)# ssid OFFICE
ap(config-ssid)# authentication open
ap(config-ssid)# authentication key-mgmt wpa3
ap(config-ssid)# wpa-psk ascii-key MySecurePassword123!
ap(config-if)# exit

ap(config)# interface Dot11Radio0
ap(config-if)# encryption key-mgmt wpa3
ap(config-if)# encryption cipher ccmp128
```

*3. Autentizace a autorizace (AAA)*

*AAA (Authentication, Authorization, Accounting):*

- *Autentizace:* Ověření identity (login/password, certifikát, 2FA)
- *Autorizace:* Co je uživatel schopen provádět (role-based access control)
- *Accounting:* Záznam co uživatel dělá (audit logging)

*Protokoly:*

- *RADIUS:* Nejčastěji pro WiFi
- *TACACS+:* Cisco proprietární, pro síťová zařízení
- *LDAP:* Microsoft Active Directory

*Konfigurace RADIUS na AP:*

```
ap# configure terminal
ap(config)# aaa new-model
ap(config)# radius server ADSERVER
ap(config-radius)# address ipv4 192.168.1.101
ap(config-radius)# key shared_secret_123
ap(config-radius)# exit

ap(config)# interface Dot11Radio0
ap(config-if)# ssid ENTERPRISE
ap(config-ssid)# authentication open
ap(config-ssid)# authentication key-mgmt wpa2-ent
ap(config-ssid)# authentication server-override
```

*4. Segmentace sítě (Network Segmentation)*

Rozdělení sítě do izolovaných segmentů s omezeným přístupem mezi nimi.

```
VLAN 10 (Office):     192.168.10.0/24 - Běžné práce
VLAN 20 (Servers):    192.168.20.0/24 - Datový sklad, servery
VLAN 30 (Guests):     192.168.30.0/24 - Návštěvy bez přístupu
VLAN 40 (Security):   192.168.40.0/24 - Kamery, monitoring
VLAN 50 (Developers): 192.168.50.0/24 - Vývojáři s vyšším přístupem

ACL mezi VLANy:
- VLAN 10 -> 20: Povolena čtení ze serverů (port 445)
- VLAN 30 -> INTERNET: Pouze HTTPS (port 443)
- VLAN 40 -> 10/20/30: Blokováno (kamery jen monitorují)
```