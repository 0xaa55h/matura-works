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
  = Cisco Packet Tracer
  === Souhrn k maturitě
])

#outline(
  title: "Obsah"
)

== Režimy v konzoli v Packet Traceru

V Cisco Packet Traceru existují různé režimy, které umožňují uživatelům konfigurovat a spravovat síťová zařízení. Níže jsou uvedeny hlavní režimy:

- *User EXEC Mode*: Tento režim je určen pro základní operace a poskytuje omezený přístup k příkazům. Uživatelé mohou zobrazit základní informace o zařízení, ale nemohou provádět žádné změny konfigurace.
  - Co umí:
    - Základní příkazy pro zobrazení stavu
    - Testování konektivity (např. ping)

- *Privileged EXEC Mode*: Tento režim poskytuje širší přístup k příkazům a umožňuje uživatelům provádět pokročilejší operace. Přístup do tohoto režimu je obvykle chráněn heslem.
```bash
Router> enable
Router#
```
  - Co umí:
    - Přístup k pokročilým diagnostickým příkazům
    - Možnost přechodu do režimu konfigurace

- *Global Configuration Mode*: Tento režim umožňuje uživatelům provádět změny v celkové konfiguraci zařízení. Přístup do tohoto režimu je získán z Privileged EXEC Mode.
```bash
Router> enable
Router# configure terminal
Router(config)#
```
  - Co umí:
    - Konfigurace rozhraní
    - Nastavení protokolů a služeb

- *Interface Configuration Mode*: Tento režim je specifický pro konfiguraci jednotlivých síťových rozhraní.
```bash
Router(config)# interface GigabitEthernet0/0
Router(config-if)#
```
  - Co umí:
    - Nastavení IP adresy a subnet masky
    - Konfigurace rychlosti a duplexu

- *Line Configuration Mode*: Tento režim umožňuje konfiguraci přístupových linek, jako jsou konzolové a VTY linky.
```bash
Router(config)# line console 0
Router(config-line)#
```
  - Co umí:
    - Nastavení hesel pro přístup
    - Konfigurace časových limitů a dalších parametrů

- *Další režimy specifické pro různé rozhraní*: do nich lze obvykle přistoupit z Global Configuration Mode.

#figure(
  image("/assets/image.png", width: 50%),
)

== Typy \*castu na síti

- *Broadcast* -- zpráva odeslaná všem zařízením v síti. Zpravidla na adresu FF:FF:FF:FF:FF:FF (MAC) nebo na poslední IPv4 adresu v podsíti (např. 192.168.0.255 pro podsíť /24).
  - Použití: ARP požadavky, DHCP Discover zprávy (pro získání překlad IP adresy na MAC adresu).
- *Unicast* -- zpráva odeslaná konkrétnímu zařízení na základě jeho MAC nebo IP adresy.
  - Použití: běžná komunikace mezi dvěma zařízeními (např. webový provoz, e-maily, ping -- ICMP).
- *Multicast* -- zpráva odeslanána skupině zařízení, která se přihlásila k odběru určité multicastové adresy.
  - Použití: streamování videa, IP televize, některé typy konferenčních hovorů.
- *Anycast* -- zpráva odeslaná na nejbližší zařízení z určité skupiny zařízení, která sdílejí stejnou IP adresu.
  - Použití: CDN (Content Delivery Networks), DNS servery.

== Základní nastavení a příkazy v Packet Traceru

=== Nastavení názvu zařízení (hostname)

```bash
Router> enable
Router# configure terminal
Router(config)# hostname RoutrikUwU
RoutrikUwU(config)#
```

=== Nastavení hesla pro přístup do Privileged EXEC Mode

```bash
RoutrikUwU(config)# enable secret mojeHeslo123
```

=== Nastavení hesla pro konzolový přístup

```bash
RoutrikUwU(config)# line console 0
RoutrikUwU(config-line)# password konzoloveHeslo
RoutrikUwU(config-line)# login
<Ctrl-C>
# Nastavení šifrování hesel (volitelné, ale doporučené)
RoutrikUwU(config)# service password-encryption
```

=== Uložení konfigurace

```bash
RoutrikUwU# copy running-config startup-config
RoutrikUwU# show running-config # nebo show startup-config
```

=== Zobrazení IP konfigurace

```bash
RoutrikUwU# show ip interface brief
```

== IPv4 adresace (statická)

=== Výpočet IP adresy a podsítě

- *Co je to IP adresa?* \
  IP adresa je jedinečný identifikátor zařízení v síti. Skládá se ze čtyř oktetů (8 bitů každý), oddělených tečkami, například:
  - 192.168.0.10
  - 192.168.0.1
  - 192.168.0.255
- *Co je to maska podsítě?* \
  Maska podsítě určuje, která část IP adresy představuje síťovou část a která část představuje hostitelskou část. Nejčastěji používané masky jsou:
  - 255.255.255.0 (/24) -- 256 adres (254 použitelné pro zařízení -- síťová (první) a broadcast (poslední) adresa jsou rezervovány)

=== Nastavení statické IP adresy na rozhraní

```bash
RoutrikUwU(config)# interface GigabitEthernet0/0
RoutrikUwU(config-if)# ip address 192.168.0.10 255.255.255.0 # Nastavení IP adresy a subnet masky
RoutrikUwU(config-if)# no shutdown # Aktivace rozhraní (DŮLEŽITÉ, pokud vypnuté)
```

Pro jednoduchou komunikaci mezi dvěma zařízeními v rámci stejné podsítě, není potřeba nastavovat výchozí bránu (default gateway), nebo DNS server. Tyto parametry jsou potřeba pouze pro komunikaci mimo lokální síť (např. přístup na internet). *Router tedy není potřeba.*

=== Nastavení výchozí brány pro komunikaci mimo lokální síť

Připravíme si jednoduchou síť s dvěmi počítači (PC1 a PC2) a routerem (R1). PC1 a PC2 budou ve jiných subnetech, takže pro komunikaci mezi nimi bude potřeba router.

```bash
# Na PC1
PC1(config)# interface FastEthernet0
PC1(config-if)# ip address 192.168.1.10 255.255.255.0
PC1(config-if)# ip default-gateway 192.168.1.1
PC1(config-if)# no shutdown # Pokud není (spíše bude)
```

```bash
# Na PC2
PC2(config)# interface FastEthernet0
PC2(config-if)# ip address 192.168.2.10 255.255.255.0
PC2(config-if)# ip default-gateway 192.168.2.1
PC2(config-if)# no shutdown # Pokud není (spíše bude)
```

```bash
# Na R1
# G0/0 připojeno k PC1, G0/1 připojeno k PC2
R1(config)# interface GigabitEthernet0/0
R1(config-if)# ip address 192.168.1.1 255.255.255.0
R1(config-if)# no shutdown
R1(config)# interface GigabitEthernet0/1
R1(config-if)# ip address 192.168.2.1 255.255.255.0
R1(config-if)# no shutdown
```

Z PC1 by nyní mělo jít pingnout PC2 IPv4 adresu a naopak.

== DHCP

```bash
Router> enable
Router# configure terminal
Router(config)# interface GigabitEthernet0/0
Router(config-if)# ip address 192.168.1.1 255.255.255.0
Router(config-if)# no shutdown
Router(config-if)# exit
# Vynechání adres pro např. statické přiřazení (obě adresy jsou inkluzivní)
Router(config)# ip dhcp excluded-address 192.168.1.1 192.168.1.10 

Router(config)# ip dhcp pool LAN_POOL
# Nastavení informací o síťi pro DHCP klienty
Router(dhcp-config)# network 192.168.1.0 255.255.255.0
# Nastavení výchozí brány
Router(dhcp-config)# default-router 192.168.1.1
```

Na PC by mělo být nastaveno získávání IP adresy automaticky (DHCP).
O IP adresu lze požádat pomocí příkazu `ipconfig /renew` v příkazovém řádku (CMD) ve Windows. Pro odebrání aktuální IP adresy lze použít `ipconfig /release` (stejně jako na Windows).

== VLAN

VLAN nabízí způsob, jak logicky oddělit sítě na úrovni druhé vrstvy (linkové vrstvy) OSI modelu, i když jsou fyzicky připojeny ke stejnému switchi. To umožňuje zlepšit bezpečnost a optimalizovat síťový provoz.

VLANy obvykle konfigurujeme na switchích. Každá VLAN má své vlastní ID (číslo) a název, který pomáhá identifikovat její účel.

=== Vytvoření VLAN na switchi

```bash
# Vytvoření VLANek
Switch> enable
Switch# configure terminal
Switch(config)# vlan 10
Switch(config-vlan)# name SPSTZaci
Switch(config)# vlan 20
Switch(config-vlan)# name SPSTUcitele

# Přiřazení portů do VLANek
# Přiřazení portů 1-5 do VLAN 10
Switch(config)# interface range fa0/1 - 5
Switch(config-if-range)# switchport mode access
Switch(config-if-range)# switchport access vlan 10
# Přiřazení portů 6-10 do VLAN 20
Switch(config)# interface range fa0/6 - 10
Switch(config-if-range)# switchport mode access
Switch(config-if-range)# switchport access vlan 20
```

=== Trunking mezi switchi (Router-on-a-Stick)

Trunking umožňuje přenos více VLAN přes jeden fyzický spoj mezi dvěma switchi. To je užitečné, když chcete, aby více VLAN mohlo komunikovat přes stejný kabel. 

Typickým příkladem použítí může být situace, kdy máte více switchů a chcete, aby spolu komunikovaly stejné VLANy na obou switchích.

```bash
# Switch1
Switch1> enable
Switch1# configure terminal

Switch1(config)# vlan 10
Switch1(config-vlan)# name Ucitele
Switch1(config-vlan)# exit
Switch1(config)# vlan 20
Switch1(config-vlan)# name Studenti
Switch1(config-vlan)# exit

# Nastavení 2 VLANek
Switch1(config)# interface range fa0/1 - 2
Switch1(config-if-range)# switchport mode access
Switch1(config-if-range)# switchport access vlan 10
Switch1(config)# interface range fa0/3 - 4
Switch1(config-if-range)# switchport mode access
Switch1(config-if-range)# switchport access vlan 20

# Nastavit port pro trunking
Switch1(config)# interface fa0/24
Switch1(config-if)# switchport mode trunk
# Přidat tag s VLAN informacemi pomocí 802.1Q encapsulace
Switch1(config-if)# switchport trunk encapsulation dot1q
```

Stejný proces opakujeme na Switch2, kde také nastavíme trunk port.
Nyní je potřeba nastavit router.

```bash
Router> enable
Router# configure terminal

Router(config)# interface fa0/0.10
Router(config-subif)# encapsulation dot1Q 10
Router(config-subif)# ip address 192.168.10.1 255.255.255.0

Router(config)# interface fa0/0.20
Router(config-subif)# encapsulation dot1Q 20
Router(config-subif)# ip address 192.168.20.1 255.255.255.0
```

Je nutno si uvědomit, že toto umožní komunikaci mezi VLANami (inter-VLAN routing). Pokud tomuto chceme zabránit, je potřeba na routeru nastavit přístupové seznamy (ACL).

Pozor: Pokud nastavujeme VLANy a zároveň DHCP, je potřeba vytvořit samostatný DHCP pool pro každou VLAN.

=== Etherchannel

Etherchannel je technologie, která umožňuje sloučit více fyzických spojů mezi dvěma síťovými zařízeními (například mezi dvěma switchi) do jednoho logického spoje. Tím se zvyšuje propustnost a zajišťuje redundance.

Rozlišujeme dva hlavní režimy Etherchannelu:
- *PAgP* -- Cisco proprietární (Auto/Desirable)
- *LACP* -- Standard IEEE 802.3ad (Active/Passive)

```bash
# Vybrat rozhraní pro Etherchannel
Switch1(config)# interface range fa0/1 - 2
# Nastavení LACP režimu; pro PAgP použít mode desirable
Switch1(config-if-range)# channel-group 1 mode active
Switch1(config-if-range)# exit

# Namísto použití fyzických rozhraní, přistoupíme k logickému rozhraní a nakonfigurujeme trunk (pokud je potřeba)
Switch1(config)# interface port-channel 1
Switch1(config-if)# switchport mode trunk
Switch1(config-if)# switchport trunk encapsulation dot1q
```

== WLAN

== Praktické příklady

=== Konfigurace jednoduché sítě s routerem, switchem a dvěma počítači
=== Konfigurace středně velké sítě s routerem, dvěma switchi a čtyřmi počítači