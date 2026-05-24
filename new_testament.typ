#let book = read("sblgnt/63-Lk-morphgnt.txt").split("\n").map(it => it.split()).filter(it => it.len() > 0)
#set text(size: 18pt)

#let tense_colors = (
  "P": rgb("#7Fcc7f88"), // present — muted green
  "I": rgb("#0088ff88"), // imperfect — muted blue
  "F": rgb("#ffff4488"), // future — muted gold
  "A": rgb("#ff777788"), // aorist — muted red
  "X": rgb("#ff78cc88"), // perfect — muted purple
  "Y": rgb("#44444488"), // pluperfect — slate blue-gray
  "Z": rgb("#ff803388"), // future perfect — muted orange
)
#let case_colors = (
  "N": rgb("#0000ff"),
  "G": rgb("#ff00ff"),
  "D": green,
  "A": red,
  "V":  rgb("#000088"),
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

#grid(
  columns: (50%, 50%),
  for (code, color) in tense_colors {
    block(inset: 3pt, fill: color, {
      tense_names.at(code)
    })
  },
  for (case_code, case_color) in case_colors {
    block(text(fill: case_color, case_names.at(case_code)))
  },
)
= Luke

#let old_chapter = none
#let old_verse = none
#for (loc, part_of_speech, parsing_code, t, word, normalized_word, lemma) in book {
  let chapter = int(loc.slice(2, 4))
  let verse = int(loc.slice(4, 6))
  if old_chapter != chapter {
    [== Chapter #chapter]
    old_chapter = chapter
  }
  if old_verse != verse {
    v(1em)
    old_verse = verse
    super([#verse])
    h(.5em)
  }

  let t = t.replace("⸀", "").replace("⸂", "").replace("⸃", "")

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

  let fill = case_colors.at(case, default: black)


  let tense_color = tense_colors.at(tense, default: white)

  let style = it => it
  if voice == "A" {
    style = it => underline(it)
  } else if voice == "M" {
    style = it => underline(text(style: "italic", it), stroke: (dash: "dashed"))
  } else if voice == "P" {
    style = it => text(style: "italic", it)
  }

  box(style(text(t, fill: fill)), fill: tense_color, outset: (y: 4pt, x: 2pt))
  // * person (1=1st, 2=2nd, 3=3rd)
  // * tense (P=present, I=imperfect, F=future, A=aorist, X=perfect, Y=pluperfect)
  // * voice (A=active, M=middle, P=passive)
  // * mood (I=indicative, D=imperative, S=subjunctive, O=optative, N=infinitive, P=participle)
  // * case (N=nominative, G=genitive, D=dative, A=accusative)
  // * number (S=singular, P=plural)
  // * gender (M=masculine, F=feminine, N=neuter)
  // * degree (C=comparative, S=superlative)


  if not t.ends-with("—") {
    [ ]
  }
}

