#let work(
  title: "Jméno díla",
  author: "Autor",
  year: 2023,
  characteristics: (
    obsah: [],
    utvary: [],
    name-meaning: [],
    tema: [],
  ),
  literary-context: (
    umelecke-smer: [],
    historicke-souvislosti: [],
    soucasnici: [],
    autoruv-zivot: [],
    dalsi-dila: [],
  ),
  kompozice: [],
  obsah-dila: [],
  postavy: [],
  vypravecsky-zpusob: [],
  jazyk-dila: [],
  ohlas-dila: [],
  ctenar: [],
) = {
  set page(
    paper: "a4",
    margin: (
      left: 0.5cm,
      right: 0.5cm,
      top: 0.5cm,
      bottom: 0.5cm,
    ),
  )
  set text(font: "New Computer Modern", size: 8pt)
  show heading.where(level: 1): set text(size: 14pt, weight: "bold")
  show heading: set block(below: 6pt, above: 6pt)
  show heading.where(level: 2): set text(size: 12pt, weight: "bold", fill: red)
  show heading.where(level: 3): set text(size: 10pt, weight: "bold", fill: red)
  show heading.where(level: 5): set text(size: 8pt, weight: "regular")

  columns(2, [
      #heading(level: 1, [#title])
      *#author* | *#year*

      == Charakteristika díla
      ==== Podle obsahu/formy (poezie, próza, drama)
      #characteristics.obsah
      ==== Konkrétní útvary a znaky (lyrika, epika, drama, útvar)
      #characteristics.utvary
      ==== Význam názvu
      #characteristics.name-meaning
      ==== Téma
      #characteristics.tema

      == Literárněhistorický kontext
      ==== Přiřazení k uměleckému směru, tematickému okruhu, hnutí, skupině + časové vymezení
      #literary-context.umelecke-smer

      ==== Historické souvislosti
      #literary-context.historicke-souvislosti

      ==== Autorovi současníci v domácí/zahraniční literatuře 
      ===== _(zejména srovnání s díly se stejnou tematikou)_
      #literary-context.soucasnici

      ==== Rámcové údaje týkající se autorova života 
      ===== _(a okolnosti ovlivňující napsání díla)_
      #literary-context.autoruv-zivot

      ==== Další autorova díla
      #literary-context.dalsi-dila

      == Kompozice díla 
      ===== _(chronologická, retrospektivní, paralelní, rámcová, řetězová, rozsah díla, kapitoly a jejich označení, návaznost částí, dějství, výstupy, sbírka básní, motto, prolog, doslov atp.)_
      #kompozice

      == Obsah díla 
      ===== _(zasazení výňatku do kontextu díla, základní dějová linie, zejména zásadní a zlomové situace, závěr, typ a charakteristika básní)_
      #obsah-dila

      == Postavy
      ===== _(hlavní -- vedlejší + charakteristika (přímá, nepřímá, opisem), vývoj postav v průběhu díla)_
      #postavy

      == Vypravěčský způsob a vypravěč 
      ===== _(ich/er forma, jedna z postav příběhu, vševědoucí vypravěč, vypravěč  vstupující do díla, role lyrického subjektu)_
      #vypravecsky-zpusob

      == Jazyk díla 
      ===== _(spisovný/nespisovný a jeho varianty, větná stavba, motivované nebo nemotivované odchylky od větné stavby (viz výňatek z díla), umělecké jazykové prostředky (tropy a figury) a jejich funkce, účinek použitého jazyka na čtenáře)_
      #jazyk-dila

      == Ohlas díla 
      ===== _(pohled literární kritiky a čtenářů (i v různých dobách, pokud se jedná o dílo starší), (překlady), inspirace pro jiná umělecká zpracování)_
      #ohlas-dila
    ])
}

#work(
  title: "Jméno díla",
  author: "Autor",
  year: 2023,
  characteristics: (
    obsah: [],
    utvary: [],
    name-meaning: [],
    tema: [],
  ),
  literary-context: (
    umelecke-smer: [],
    historicke-souvislosti: [],
    soucasnici: [],
    dalsi-dila: [],
    autoruv-zivot: [],
  ),
  kompozice: [],
  obsah-dila: [],
  postavy: [],
  vypravecsky-zpusob: [],
  jazyk-dila: [],
  ohlas-dila: [],
)