#import "lib_new_testament.typ": _load_book, _render_word, case_colors, case_names, tense_colors, tense_names

#let books = (
  ("ΚΑΤΑ ΜΑΘΘΑΙΟΝ", "Matthew", "ΕΥΑΓΓΕΛΙΟΝ ΚΑΤΑ ΜΑΘΘΑΙΟΝ", "The Gospel According to St. Matthew"),
  ("ΚΑΤΑ ΜΑΡΚΟΝ", "Mark", "ΕΥΑΓΓΕΛΙΟΝ ΚΑΤΑ ΜΑΡΚΟΝ", "The Gospel According to St. Mark"),
  ("ΚΑΤΑ ΛΟΥΚΑΝ", "Luke", "ΕΥΑΓΓΕΛΙΟΝ ΚΑΤΑ ΛΟΥΚΑΝ", "The Gospel According to St. Luke"),
  ("ΚΑΤΑ ΙΩΑΝΝΗΝ", "John", "ΕΥΑΓΓΕΛΙΟΝ ΚΑΤΑ ΙΩΑΝΝΗΝ", "The Gospel According to St. John"),
  ("ΠΡΑΞΕΙΣ ΑΠΟΣΤΟΛΩΝ", "Acts", "ΠΡΑΞΕΙΣ ΤΩΝ ΑΠΟΣΤΟΛΩΝ", "The Acts of the Apostles"),
  ("ΠΡΟΣ ΡΩΜΑΙΟΥΣ", "Romans", "ΠΡΟΣ ΡΩΜΑΙΟΥΣ ΕΠΙΣΤΟΛΗ", "The Epistle of Paul the Apostle to the Romans"),
  ("ΠΡΟΣ ΚΟΡΙΝΘΙΟΥΣ Α", "1 Corinthians", "ΠΡΟΣ ΚΟΡΙΝΘΙΟΥΣ ΕΠΙΣΤΟΛΗ ΠΡΩΤΗ", "The First Epistle of Paul the Apostle to the Corinthians"),
  ("ΠΡΟΣ ΚΟΡΙΝΘΙΟΥΣ Β", "2 Corinthians", "ΠΡΟΣ ΚΟΡΙΝΘΙΟΥΣ ΕΠΙΣΤΟΛΗ ΔΕΥΤΕΡΑ", "The Second Epistle of Paul the Apostle to the Corinthians"),
  ("ΠΡΟΣ ΓΑΛΑΤΑΣ", "Galatians", "ΠΡΟΣ ΓΑΛΑΤΑΣ ΕΠΙΣΤΟΛΗ", "The Epistle of Paul the Apostle to the Galatians"),
  ("ΠΡΟΣ ΕΦΕΣΙΟΥΣ", "Ephesians", "ΠΡΟΣ ΕΦΕΣΙΟΥΣ ΕΠΙΣΤΟΛΗ", "The Epistle of Paul the Apostle to the Ephesians"),
  ("ΠΡΟΣ ΦΙΛΙΠΠΗΣΙΟΥΣ", "Philippians", "ΠΡΟΣ ΦΙΛΙΠΠΗΣΙΟΥΣ ΕΠΙΣΤΟΛΗ", "The Epistle of Paul the Apostle to the Philippians"),
  ("ΠΡΟΣ ΚΟΛΑΣΣΑΕΙΣ", "Colossians", "ΠΡΟΣ ΚΟΛΟΣΣΑΕΙΣ ΕΠΙΣΤΟΛΗ", "The Epistle of Paul the Apostle to the Colossians"),
  ("ΠΡΟΣ ΘΕΣΣΑΛΟΝΙΚΕΙΣ Α", "1 Thessalonians", "ΠΡΟΣ ΘΕΣΣΑΛΟΝΙΚΕΙΣ ΕΠΙΣΤΟΛΗ ΠΡΩΤΗ", "The First Epistle of Paul the Apostle to the Thessalonians"),
  ("ΠΡΟΣ ΘΕΣΣΑΛΟΝΙΚΕΙΣ Β", "2 Thessalonians", "ΠΡΟΣ ΘΕΣΣΑΛΟΝΙΚΕΙΣ ΕΠΙΣΤΟΛΗ ΔΕΥΤΕΡΑ", "The Second Epistle of Paul the Apostle to the Thessalonians"),
  ("ΠΡΟΣ ΤΙΜΟΘΕΟΝ Α", "1 Timothy", "ΠΡΟΣ ΤΙΜΟΘΕΟΝ ΕΠΙΣΤΟΛΗ ΠΡΩΤΗ", "The First Epistle of Paul the Apostle to Timothy"),
  ("ΠΡΟΣ ΤΙΜΟΘΕΟΝ Β", "2 Timothy", "ΠΡΟΣ ΤΙΜΟΘΕΟΝ ΕΠΙΣΤΟΛΗ ΔΕΥΤΕΡΑ", "The Second Epistle of Paul the Apostle to Timothy"),
  ("ΠΡΟΣ ΤΙΤΟΝ", "Titus", "ΠΡΟΣ ΤΙΤΟΝ ΕΠΙΣΤΟΛΗ", "The Epistle of Paul the Apostle to Titus"),
  ("ΠΡΟΣ ΦΙΛΗΜΟΝΑ", "Philemon", "ΠΡΟΣ ΦΙΛΗΜΟΝΑ ΕΠΙΣΤΟΛΗ", "The Epistle of Paul the Apostle to Philemon"),
  ("ΠΡΟΣ ΕΒΡΑΙΟΥΣ", "Hebrews", "ΠΡΟΣ ΕΒΡΑΙΟΥΣ ΕΠΙΣΤΟΛΗ", "The Epistle of Paul the Apostle to the Hebrews"),
  ("ΙΑΚΩΒΟΥ ΕΠΙΣΤΟΛΗ", "James", "ΙΑΚΩΒΟΥ ΕΠΙΣΤΟΛΗ ΚΑΘΟΛΙΚΗ", "The General Epistle of James"),
  ("ΠΕΤΡΟΥ ΕΠΙΣΤΟΛΗ Α", "1 Peter", "ΠΕΤΡΟΥ ΕΠΙΣΤΟΛΗ ΚΑΘΟΛΙΚΗ ΠΡΩΤΗ", "The First Epistle General of Peter"),
  ("ΠΕΤΡΟΥ ΕΠΙΣΤΟΛΗ Β", "2 Peter", "ΠΕΤΡΟΥ ΕΠΙΣΤΟΛΗ ΚΑΘΟΛΙΚΗ ΔΕΥΤΕΡΑ", "The Second Epistle General of Peter"),
  ("ΙΩΑΝΝΟΥ ΕΠΙΣΤΟΛΗ Α", "1 John", "ΙΩΑΝΝΟΥ ΕΠΙΣΤΟΛΗ ΚΑΘΟΛΙΚΗ ΠΡΩΤΗ", "The First Epistle General of John"),
  ("ΙΩΑΝΝΟΥ ΕΠΙΣΤΟΛΗ Β", "2 John", "ΙΩΑΝΝΟΥ ΕΠΙΣΤΟΛΗ ΚΑΘΟΛΙΚΗ ΔΕΥΤΕΡΑ", "The Second Epistle General of John"),
  ("ΙΩΑΝΝΟΥ ΕΠΙΣΤΟΛΗ Γ", "3 John", "ΙΩΑΝΝΟΥ ΕΠΙΣΤΟΛΗ ΚΑΘΟΛΙΚΗ ΤΡΙΤΗ", "The Third Epistle General of John"),
  ("ΙΟΥΔΑ ΕΠΙΣΤΟΛΗ", "Jude", "ΙΟΥΔΑ ΕΠΙΣΤΟΛΗ ΚΑΘΟΛΙΚΗ", "The General Epistle of Jude"),
  ("ΑΠΟΚΑΛΥΨΙΣ ΙΩΑΝΝΟΥ", "Revelation", "ΑΠΟΚΑΛΥΨΙΣ ΙΩΑΝΝΟΥ", "The Revelation of St. John"),
)

#let width = 6in
#let height = 9in
#let left_margin = 1in
#let outside_margin = 1in
#let inside_margin = 1.5in

#let kjv = json(bytes(read("kjv/json/verses-1769.json")))

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
#let max_gutter = 0.5in

#let kjv_verse(book, chapter, verse) = {
  show regex("\[[^\]]+\]"): it => text(style: "italic", it.text.replace("[", "").replace("]", ""))
  par(justify: true, text(
    kjv.at(book + " " + str(chapter) + ":" + str(verse), default: "").replace("#", "").trim(),
    size: 12pt,
  ))
}

#let do_verse(i, j, it) = {
  let num = if j == 1 {
    text(size: 28pt, fill: rgb("#444444"), weight: "bold", [#i])
  } else {
    move(text(fill: rgb("#444444"), size: 10pt, [#j]), dy: 0pt)
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

// Header for one physical half-page: shows the chapter:verse of the
// first verse on the page (passed in explicitly, computed from the
// pagination below), the short book name, and the page number.
#let page_header(book_names, lang, i, j) = context {
  set text(fill: rgb("#444444"))
  let p = 2 * counter(page).get().first() + lang - 1
  grid(
    columns: (0in, 1fr, 0in),
    align(left, [#i:#j]), align(center, book_names.at(lang)), align(right, [#p]),
  )
}
#let page_header_row(book_names, i, j) = pagegrid(
  page_header(book_names, 0, i, j),
  page_header(book_names, 1, i, j),
  align: center,
)

#let render_book(book_num) = {
  let (short_gr, short_en, title_gr, title_en) = books.at(book_num)
  let book_name = short_en
  let book_names = (short_gr, short_en)
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

  let title_gap = .35in
  let title_gr_content = align(center, text(size: 20pt, weight: "bold", title_gr))
  let title_en_content = align(center, text(size: 20pt, weight: "bold", title_en))

  context {
    // Simulate pagination so we know, per page, how much leftover
    // vertical space there is to distribute between verses (clamped
    // 1fr-style spacing instead of an unbounded 1fr). The first page of
    // the book is shorter than the rest: it must also fit the chapter
    // title above the verses.
    let title_height = calc.max(
      measure(box(width: col_width, title_gr_content)).height,
      measure(box(width: col_width, title_en_content)).height,
    )
    let first_page_height = content_height - title_height - title_gap

    let pages = ()
    let cur = ()
    let cur_height = 0pt
    for (i, j, greek, kjv) in verses {
      let gh = measure(box(width: col_width, do_verse(i, j, greek))).height
      let kh = measure(box(width: col_width, do_verse(i, j, kjv))).height
      let h = calc.max(gh, kh)
      let gaps = cur.len()
      let page_height = if pages.len() == 0 { first_page_height } else { content_height }
      let required = cur_height + h + gaps * min_gutter
      if cur.len() == 0 or required <= page_height {
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
      let is_first = page_idx == 0
      let page_height = if is_first { first_page_height } else { content_height }
      let gaps = page_verses.len() - 1
      let gutter = if gaps <= 0 {
        0pt
      } else {
        let g = (page_height - sum_h) / gaps
        calc.max(min_gutter, calc.min(max_gutter, g))
      }

      let grid_elements = ()
      for (i, j, greek, kjv, h) in page_verses {
        grid_elements.push(do_verse(i, j, greek))
        grid_elements.push(do_verse(i, j, kjv))
      }

      let (first_i, first_j, ..) = page_verses.first()
      let row_gutters = (gutter,) * (page_verses.len() - 1)

      page_content.push(pagebreak(weak: true))
      if is_first {
        page_content.push(page(header: none)[
          #pagegrid(
            title_gr_content, title_en_content,
            ..grid_elements,
            row-gutter: (title_gap,) + row_gutters,
          )
        ])
      } else {
        page_content.push(page(header: page_header_row(book_names, first_i, first_j))[
          #pagegrid(..grid_elements, row-gutter: row_gutters)
        ])
      }
    }
    page_content.join()
  }
}

#render_book(0)



