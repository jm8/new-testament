#import "lib_new_testament.typ": tense_colors, tense_names, case_colors, case_names, _render_word
#let sblgnt_filename = sys.inputs.at("sblgnt_filename")
#let book_name = sys.inputs.at("book_name")
#let version = sys.inputs.at("version", default: none)
#let book = read(sblgnt_filename).split("\n").map(it => it.split()).filter(it => it.len() > 0)
#let kjv = json(bytes(read("kjv/json/verses-1769.json")))
#let esv = if version == none { none } else {
  json(bytes(read("bible-translations/" + version + "/" + version + "_bible.json")))
}
#set text(size: 18pt)

#let chapter_counter = counter("chapter")
#chapter_counter.update(1)

#set page(
  paper: "us-letter",
  header: grid(
    columns: (50%, 50%),
    align(left, text(rgb("#444444"), context [#book_name #chapter_counter.get().first()])),
    align(right, text(rgb("#444444"), [SBLGNT#if version != none [#"/" #version]])),
  ),
  margin: (
    top: 1in,
    bottom: .5in,
    left: .5in,
    right: .5in,
  ),
)

#grid(
  columns: (50%, 50%),
  for (code, color) in tense_colors {
    block(inset: 3pt, fill: color, {
      tense_names.at(code)
    })
  },
  {
    for (case_code, case_color) in case_colors {
      block(text(fill: case_color, case_names.at(case_code)))
    }

    block([active])
    block(underline(text(style: "italic", [middle]), stroke: (dash: "dashed")))
    block(text(style: "italic", [passive]))
  },
)

#v(1em)

#align(center, smallcaps[
  = #book_name
])

#v(1em)

#show heading: it => {
  v(1em)
  it
  v(1em)
}

#let chapters = ()
#let old_chapter = none
#let old_verse = none
#for row in book {
  let (
    loc,
    part_of_speech,
    parsing_code,
    t,
    word,
    normalized_word,
    lemma,
  ) = row

  let chapter = int(loc.slice(2, 4))
  let verse = int(loc.slice(4, 6))
  if old_chapter != chapter {
    chapters.push(())
    assert(chapter == old_chapter + 1)
    old_chapter = chapter
    old_verse = none
  }
  if old_verse != verse {
    chapters.last().push(())
    while chapters.last().len() < verse {
      chapters.last().push(())
    }
    // assert(verse == old_verse + 1 or old_verse == none)
    old_verse = verse
  }


  chapters
    .last()
    .last()
    .push(_render_word(row))
}

#let kjv_verse(book, chapter, verse) = {
  show regex("\[[^\]]+\]"): it => text(style: "italic", it.text.replace("[", "").replace("]", ""))
  par(justify: false, text(
    kjv.at(book + " " + str(chapter) + ":" + str(verse), default: "").replace("#", "").trim(),
    size: 14pt,
  ))
}
#let esv_verse(book, chapter, verse) = {
  show regex("\[[^\]]+\]"): it => text(style: "italic", it.text.replace("[", "").replace("]", ""))
  par(justify: false, text(
    esv.at(book).at(str(chapter), default: (:)).at(str(verse), default: "").trim().split().join(" "),
    size: 14pt,
  ))
}

#set grid.cell(breakable: false)

#for (i, chapter) in chapters.enumerate(start: 1) {
  [== Chapter #i]
  chapter_counter.update(i)
  for (j, verse) in chapter.enumerate(start: 1) {
    grid(
      columns: if version == none { (.5em, 1fr) } else { (.5em, 6fr, 4fr) },
      column-gutter: .5em,
      super([#j]),
      verse.join(""),
      ..if version != none {
        if version == "KJV" {
          (kjv_verse(book_name, i, j),)
        } else {
          (esv_verse(book_name, i, j),)
        }
      } else {
        ()
      }
    )
  }
}

