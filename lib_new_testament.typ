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
  "P": rgb("#AAE4AA"), // present — muted green
  "I": rgb("#77C0FF"), // imperfect — muted blue
  "F": rgb("#FFFF9B"), // future — muted gold
  "A": rgb("#FF9292"), // aorist — muted red
  "X": rgb("#FFB7E4"), // perfect — muted purple
  "Y": rgb("#9B9B9B"), // pluperfect — slate blue-gray
  "Z": rgb("#FFBB92"), // future perfect — muted orange
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

#let _load_book(book_name) = (
  read("sblgnt/" + _book_files.at(book_name)).split("\n").map(it => it.split()).filter(it => it.len() > 0)
)

#let active = it => underline(it)
#let middle = it => underline(
  text(style: "italic", it),
  stroke: (dash: "dashed"),
)
#let passive = it => text(style: "italic", it)

#let moodify(it, mood_indicator, person_indicator) = {
  let mood_indicator = if mood_indicator == none { none } else if mood_indicator == "!" {
    box(move(
      text(
        size: .6em,
        fill: rgb(0, 0, 0, 40%),
        style: "italic",
        weight: "bold",
        [!],
      ),
      dy: -.06em,
    ))
  } else {
    box(move(
      text(
        size: .55em,
        fill: rgb(0, 0, 0, 40%),
        $cal(#mood_indicator)$,
      ),
      dy: -.06em,
    ))
  }
  let person_indicator = if person_indicator == none { none } else {
    box(move(
      text(
        size: .6em,
        fill: rgb(0, 0, 0, 40%),
        style: "normal",
        smallcaps(person_indicator),
      ),
      dy: -.06em,
    ))
  }

  if mood_indicator != none {
    mood_indicator
    h(.2em)
  }
  it
  if person_indicator != none {
    h(.2em)
    person_indicator
  }
}

#let _render_word(row, extraspace: [], gloss: none) = {
  let (
    loc,
    part_of_speech,
    parsing_code,
    t,
    word,
    normalized_word,
    lemma,
  ) = row

  let t = t.replace("⸀", "").replace("⸁", "").replace("⸂", "").replace("⸃", "").replace("⸄", "").replace("⸅", "")

  // Split off leading/trailing punctuation so it isn't colored or boxed.
  // The elision mark (’) is kept as part of the word, since it stands in
  // for a dropped vowel rather than functioning as sentence punctuation.
  let lead_m = t.match(regex("^[^\p{L}\p{M}\u{2019}]+"))
  let lead = if lead_m != none { lead_m.text } else { "" }
  let trail_m = t.match(regex("[^\p{L}\p{M}\u{2019}]+$"))
  let trail = if trail_m != none { trail_m.text } else { "" }
  let core = t.slice(lead.len(), t.len() - trail.len())

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
  let background = tense_colors.at(tense, default: none)

  let style = it => it
  if voice == "A" {
    style = active
  } else if voice == "M" {
    style = middle
  } else if voice == "P" {
    style = passive
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

  let person_indicator = none
  if mood_indicator != none or mood == "I" {
    if person != "-" {
      person_indicator = person
    }
    if number != "-" {
      person_indicator = [#person_indicator#number]
    }
  }

  let spacing = {}
  [
    #box[#lead#box(
      box(
        text(
          fill: text_fill,
          moodify(style(core), mood_indicator, person_indicator),
        ),
        fill: background,
        outset: (y: 4pt),
        inset: (x: if background != none { 2pt } else { 0pt }),
      ),
    )#if gloss != none {
      [ ]
      text(size: 23pt, fill: rgb("#444444"))[(#gloss)]
    }#trail]
    #if not t.ends-with("—") {
      extraspace
    }
  ]
}

#let _load_verse(rows, chapter, verse) = {
  rows.filter(row => {
    let (loc, ..) = row
    return int(loc.slice(2, 4)) == chapter and int(loc.slice(4, 6)) == verse
  })
}

#let verse(bookn, chaptern, versen, skip: 0, count: none, glosses: (:), ellipses: ()) = {
  let book = _load_book(bookn)
  let verse = _load_verse(book, chaptern, versen)
  for (i, word) in verse.enumerate() {
    if i in ellipses {
      if i - 1 not in ellipses {
        [...]
      }
    } else if i >= skip and (count == none or i < skip + count) {
      _render_word(word, gloss: glosses.at(str(i), default: none))
    }
  }
  par(text(size: .7em)[#bookn #chaptern:#versen])
}

#verse("Ephesians", 1, 2)


