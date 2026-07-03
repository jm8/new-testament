#let _book_files = (
  "Matthew": "61-Mt-morphgnt.txt",
  "Matt": "61-Mt-morphgnt.txt",
  "Mt": "61-Mt-morphgnt.txt",

  "Mark": "62-Mk-morphgnt.txt",
  "Mk": "62-Mk-morphgnt.txt",

  "Luke": "63-Lk-morphgnt.txt",
  "Lk": "63-Lk-morphgnt.txt",

  "John": "64-Jn-morphgnt.txt",
  "Jn": "64-Jn-morphgnt.txt",

  "Acts": "65-Ac-morphgnt.txt",
  "Ac": "65-Ac-morphgnt.txt",

  "Romans": "66-Ro-morphgnt.txt",
  "Rom": "66-Ro-morphgnt.txt",
  "Ro": "66-Ro-morphgnt.txt",

  "1 Corinthians": "67-1Co-morphgnt.txt",
  "1 Cor": "67-1Co-morphgnt.txt",
  "1Co": "67-1Co-morphgnt.txt",

  "2 Corinthians": "68-2Co-morphgnt.txt",
  "2 Cor": "68-2Co-morphgnt.txt",
  "2Co": "68-2Co-morphgnt.txt",

  "Galatians": "69-Ga-morphgnt.txt",
  "Gal": "69-Ga-morphgnt.txt",
  "Ga": "69-Ga-morphgnt.txt",

  "Ephesians": "70-Eph-morphgnt.txt",
  "Eph": "70-Eph-morphgnt.txt",

  "Philippians": "71-Php-morphgnt.txt",
  "Phil": "71-Php-morphgnt.txt",
  "Php": "71-Php-morphgnt.txt",

  "Colossians": "72-Col-morphgnt.txt",
  "Col": "72-Col-morphgnt.txt",

  "1 Thessalonians": "73-1Th-morphgnt.txt",
  "1 Thess": "73-1Th-morphgnt.txt",
  "1 Th": "73-1Th-morphgnt.txt",
  "1Th": "73-1Th-morphgnt.txt",

  "2 Thessalonians": "74-2Th-morphgnt.txt",
  "2 Thess": "74-2Th-morphgnt.txt",
  "2 Th": "74-2Th-morphgnt.txt",
  "2Th": "74-2Th-morphgnt.txt",

  "1 Timothy": "75-1Ti-morphgnt.txt",
  "1 Tim": "75-1Ti-morphgnt.txt",
  "1Ti": "75-1Ti-morphgnt.txt",

  "2 Timothy": "76-2Ti-morphgnt.txt",
  "2 Tim": "76-2Ti-morphgnt.txt",
  "2Ti": "76-2Ti-morphgnt.txt",

  "Titus": "77-Tit-morphgnt.txt",
  "Tit": "77-Tit-morphgnt.txt",

  "Philemon": "78-Phm-morphgnt.txt",
  "Phlm": "78-Phm-morphgnt.txt",
  "Phm": "78-Phm-morphgnt.txt",

  "Hebrews": "79-Heb-morphgnt.txt",
  "Heb": "79-Heb-morphgnt.txt",

  "James": "80-Jas-morphgnt.txt",
  "Jas": "80-Jas-morphgnt.txt",

  "1 Peter": "81-1Pe-morphgnt.txt",
  "1 Pet": "81-1Pe-morphgnt.txt",
  "1Pe": "81-1Pe-morphgnt.txt",

  "2 Peter": "82-2Pe-morphgnt.txt",
  "2 Pet": "82-2Pe-morphgnt.txt",
  "2Pe": "82-2Pe-morphgnt.txt",

  "1 John": "83-1Jn-morphgnt.txt",
  "1 Jn": "83-1Jn-morphgnt.txt",
  "1Jn": "83-1Jn-morphgnt.txt",

  "2 John": "84-2Jn-morphgnt.txt",
  "2 Jn": "84-2Jn-morphgnt.txt",
  "2Jn": "84-2Jn-morphgnt.txt",

  "3 John": "85-3Jn-morphgnt.txt",
  "3 Jn": "85-3Jn-morphgnt.txt",
  "3Jn": "85-3Jn-morphgnt.txt",

  "Jude": "86-Jud-morphgnt.txt",
  "Jud": "86-Jud-morphgnt.txt",

  "Revelation": "87-Re-morphgnt.txt",
  "Rev": "87-Re-morphgnt.txt",
  "Re": "87-Re-morphgnt.txt",
)

#let tense_colors = (
  "P": rgb("#5Fcc5f88"), // present — muted green
  "I": rgb("#0088ff88"), // imperfect — muted blue
  "F": rgb("#ffff4488"), // future — muted gold
  "A": rgb("#ff333388"), // aorist — muted red
  "X": rgb("#ff78cc88"), // perfect — muted purple
  "Y": rgb("#44444488"), // pluperfect — slate blue-gray
  "Z": rgb("#ff803388"), // future perfect — muted orange
)
#let case_colors = (
  "N": rgb("#0000ff"),
  "G": rgb("#ff00ff"),
  "D": green,
  "A": red,
  "V": rgb("#000088"),
)
#let case_names = (
  "N": "nominative",
  "G": "genitive",
  "D": "dative",
  "A": "accusitive",
  "V": "vocative",
)

#let tense_names = (
  "P": "present",
  "I": "imperfect",
  "F": "future",
  "A": "aorist",
  "X": "perfect",
  "Y": "pluperfect",
  "Z": "future perfect",
)

#let _load_book(book_name) = read("sblgnt/" + _book_files.at(book_name)).split("\n").map(it => it.split()).filter(it => it.len() > 0)

#let _render_word(row) = {
  let (
    loc,
    part_of_speech,
    parsing_code,
    t,
    word,
    normalized_word,
    lemma,
  ) = row

  let t = t
    .replace("⸀", "")
    .replace("⸁", "")
    .replace("⸂", "")
    .replace("⸃", "")

  let (
    person,
    tense,
    voice,
    mood,
    case,
    number,
    gender,
    degree,
  ) = parsing_code.codepoints()

  let text_fill = case_colors.at(case, default: black)
  let background = tense_colors.at(tense, default: white)

  let style = it => it
  if voice == "A" {
    style = it => underline(it)
  } else if voice == "M" {
    style = it => underline(
      text(style: "italic", it),
      stroke: (dash: "dashed"),
    )
  } else if voice == "P" {
    style = it => text(style: "italic", it)
  }

  let mood_indicator = none
  if mood == "D" {
    mood_indicator = "!"
  } else if mood == "S" {
    mood_indicator = "S"
  } else if mood == "O" {
    mood_indicator = "O"
  } else if mood == "N" {
    mood_indicator = "I"
  }

  let spacing = {}
  if mood_indicator != none {
    mood_indicator = text(
      size: 10pt,
      fill: rgb(0, 0, 0, 40%),
      $cal(#mood_indicator)$,
    )
    spacing = h(.2em)
  }

  [
    #box(
      box(
        text(
          fill: text_fill,
          [
            #mood_indicator
            #spacing
            #style(t)
            #spacing
            #mood_indicator
          ],
        ),
        fill: background,
        outset: (x: 2pt, y: 4pt),
      )
    )
    #if not t.ends-with("—") {
      h(.25em)
    }
  ]
}

#let _load_verse(rows, chapter, verse) = {
  rows.filter(row => {
    let (loc, ..) = row
    return int(loc.slice(2, 4)) == chapter and int(loc.slice(4, 6)) == verse
  })
}

#let verse(book, chapter, verse) = {
  let book = _load_book(book)
  let verse = _load_verse(book, chapter, verse)
  verse.map(_render_word).join()
}

#verse("Ephesians", 1, 2)


