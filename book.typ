#import "lib_new_testament.typ": _load_book, _render_word, case_colors, case_names, tense_colors, tense_names

#let books = (
  ("ΚΑΤΑ ΜΑΘΘΑΙΟΝ", "Matthew"),
  ("ΚΑΤΑ ΜΑΡΚΟΝ", "Mark"),
  ("ΚΑΤΑ ΛΟΥΚΑΝ", "Luke"),
  ("ΚΑΤΑ ΙΩΑΝΝΗΝ", "John"),
  ("ΠΡΑΞΕΙΣ ΑΠΟΣΤΟΛΩΝ", "Acts"),
  ("ΠΡΟΣ ΡΩΜΑΙΟΥΣ", "Romans"),
  ("ΠΡΟΣ ΚΟΡΙΝΘΙΟΥΣ Α", "1 Corinthians"),
  ("ΠΡΟΣ ΚΟΡΙΝΘΙΟΥΣ Β", "2 Corinthians"),
  ("ΠΡΟΣ ΓΑΛΑΤΑΣ", "Galatians"),
  ("ΠΡΟΣ ΕΦΕΣΙΟΥΣ", "Ephesians"),
  ("ΠΡΟΣ ΦΙΛΙΠΠΗΣΙΟΥΣ", "Philippians"),
  ("ΠΡΟΣ ΚΟΛΑΣΣΑΕΙΣ", "Colossians"),
  ("ΠΡΟΣ ΘΕΣΣΑΛΟΝΙΚΕΙΣ Α", "1 Thessalonians"),
  ("ΠΡΟΣ ΘΕΣΣΑΛΟΝΙΚΕΙΣ Β", "2 Thessalonians"),
  ("ΠΡΟΣ ΤΙΜΟΘΕΟΝ Α", "1 Timothy"),
  ("ΠΡΟΣ ΤΙΜΟΘΕΟΝ Β", "2 Timothy"),
  ("ΠΡΟΣ ΤΙΤΟΝ", "Titus"),
  ("ΠΡΟΣ ΦΙΛΗΜΟΝΑ", "Philemon"),
  ("ΠΡΟΣ ΕΒΡΑΙΟΥΣ", "Hebrews"),
  ("ΙΑΚΩΒΟΥ ΕΠΙΣΤΟΛΗ", "James"),
  ("ΠΕΤΡΟΥ ΕΠΙΣΤΟΛΗ Α", "1 Peter"),
  ("ΠΕΤΡΟΥ ΕΠΙΣΤΟΛΗ Β", "2 Peter"),
  ("ΙΩΑΝΝΟΥ ΕΠΙΣΤΟΛΗ Α", "1 John"),
  ("ΙΩΑΝΝΟΥ ΕΠΙΣΤΟΛΗ Β", "2 John"),
  ("ΙΩΑΝΝΟΥ ΕΠΙΣΤΟΛΗ Γ", "3 John"),
  ("ΙΟΥΔΑ ΕΠΙΣΤΟΛΗ", "Jude"),
  ("ΑΠΟΚΑΛΥΨΙΣ ΙΩΑΝΝΟΥ", "Revelation"),
)

#let width = 6in
#let height = 9in
#let left_margin = .75in
#let outside_margin = 0.75in
#let inside_margin = 1.5in

#let kjv = json(bytes(read("kjv/json/verses-1769.json")))

#let chapter_counter = counter("chapter")
#let verse_counter = counter("verse")
#let book_counter = counter("book")

#set page(width: width * 2, height: height, margin: (
  left: left_margin,
  right: outside_margin,
  top: outside_margin,
  bottom: outside_margin,
))
#set text(size: 12pt)
#let pagegrid = (..args) => grid(
  columns: (width - left_margin - inside_margin, width - outside_margin - inside_margin),
  column-gutter: inside_margin * 2,
  ..args,
)

#let kjv_verse(book, chapter, verse) = {
  show regex("\[[^\]]+\]"): it => text(style: "italic", it.text.replace("[", "").replace("]", ""))
  par(justify: true, text(
    kjv.at(book + " " + str(chapter) + ":" + str(verse), default: "").replace("#", "").trim(),
    size: 12pt,
  ))
}

#let do_verse(i, j, it) = {
  let num = if j == 1 {
    text(size: 36pt, weight: "bold", [#i])
  } else {
    move(text(size: 10pt, [#j]), dy: 0pt)
  }
  box(
    grid(
      columns: (0in, 1fr),
      column-gutter: 0in,
      align(right, box(num, inset: (right: .15in))), it,
    ),
    inset: (y: .1in),
  )
}

#let render_book(book_num) = {
  let book_name = books.at(book_num).at(1)
  let book = _load_book(book_name)

  let chapters = ()
  let old_chapter = none
  let old_verse = none
  for row in book {
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

    chapters.last().last().push(_render_word(row, extraspace: h(.05em)))
  }

  let grid_elements = ()

  for (i, chapter) in chapters.enumerate(start: 1) {
    for (j, verse) in chapter.enumerate(start: 1) {
      grid_elements.push({
        chapter_counter.update(i)
        verse_counter.update(j)
      })
      grid_elements.push({
        chapter_counter.update(i)
        verse_counter.update(j)
      })
      grid_elements.push(do_verse(i, j, par(justify: true, verse.join(""))))
      grid_elements.push(do_verse(i, j, kjv_verse(book_name, i, j)))
    }
  }

  chapter_counter.update(1)
  verse_counter.update(1)
  book_counter.update(book_num)
  page(
    pagegrid(..grid_elements, row-gutter: (0pt, 1fr)),
  )
}

#let header(lang) = context {
  set text(fill: rgb("#444444"))
  let book_name = books.at(book_counter.get().first()).at(lang)
  grid(
    columns: (0in, 1fr, 0in),
    align(left, [#chapter_counter.display():#verse_counter.display()]), align(center, book_name), align(right, counter(page).display()),
  )
}

#set page(header: pagegrid(
  header(0),
  header(1),
  align: center,
))

#render_book(22)



