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
#let left_margin = 1in
#let outside_margin = 1in
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

#let col_width = width - left_margin - inside_margin
#let content_height = height - outside_margin - outside_margin - 2pt
#let min_gutter = 0.25in
#let max_gutter = 1in

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

  let verses = ()
  for (i, chapter) in chapters.enumerate(start: 1) {
    for (j, verse) in chapter.enumerate(start: 1) {
      verses.push((i, j, par(justify: true, verse.join("")), kjv_verse(book_name, i, j)))
    }
  }

  chapter_counter.update(1)
  verse_counter.update(1)
  book_counter.update(book_num)

  context {
    // Simulate pagination so we know, per page, how much leftover
    // vertical space there is to distribute between verses (clamped
    // 1fr-style spacing instead of an unbounded 1fr).
    let pages = ()
    let cur = ()
    let cur_height = 0pt
    for (i, j, greek, kjv) in verses {
      let gh = measure(box(width: col_width, do_verse(i, j, greek))).height
      let kh = measure(box(width: col_width, do_verse(i, j, kjv))).height
      let h = calc.max(gh, kh)
      let gaps = cur.len()
      let required = cur_height + h + gaps * min_gutter
      if cur.len() == 0 or required <= content_height {
        cur.push((i, j, greek, kjv, h))
        cur_height += h
      } else {
        pages.push((cur, cur_height))
        cur = ((i, j, greek, kjv, h),)
        cur_height = h
      }
    }
    if cur.len() > 0 {
      pages.push((cur, cur_height))
    }

    let page_content = ()
    for (page_idx, (page_verses, sum_h)) in pages.enumerate() {
      let gaps = page_verses.len() - 1
      let gutter = if gaps <= 0 {
        0pt
      } else {
        let g = (content_height - sum_h) / gaps
        calc.max(min_gutter, calc.min(max_gutter, g))
      }

      let grid_elements = ()
      for (i, j, greek, kjv, h) in page_verses {
        grid_elements.push({
          chapter_counter.update(i)
          verse_counter.update(j)
        })
        grid_elements.push({
          chapter_counter.update(i)
          verse_counter.update(j)
        })
        grid_elements.push(do_verse(i, j, greek))
        grid_elements.push(do_verse(i, j, kjv))
      }

      let row_gutters = range(2 * page_verses.len() - 1).map(idx => if calc.rem(idx, 2) == 0 { 0pt } else { gutter })

      page_content.push(pagebreak(weak: true))
      page_content.push(pagegrid(..grid_elements, row-gutter: row_gutters))
    }
    page_content.join()
  }
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

#render_book(26)



