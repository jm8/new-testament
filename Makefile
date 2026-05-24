all:
	rm -rf out
	mkdir -p out/kjv out/esv out/nasb out/none

	typst compile new_testament.typ --input version=KJV --input sblgnt_filename=sblgnt/61-Mt-morphgnt.txt --input book_name="Matthew" out/kjv/"Matthew".pdf
	typst compile new_testament.typ --input version=KJV --input sblgnt_filename=sblgnt/62-Mk-morphgnt.txt --input book_name="Mark" out/kjv/"Mark".pdf
	typst compile new_testament.typ --input version=KJV --input sblgnt_filename=sblgnt/63-Lk-morphgnt.txt --input book_name="Luke" out/kjv/"Luke".pdf
	typst compile new_testament.typ --input version=KJV --input sblgnt_filename=sblgnt/64-Jn-morphgnt.txt --input book_name="John" out/kjv/"John".pdf
	typst compile new_testament.typ --input version=KJV --input sblgnt_filename=sblgnt/65-Ac-morphgnt.txt --input book_name="Acts" out/kjv/"Acts".pdf
	typst compile new_testament.typ --input version=KJV --input sblgnt_filename=sblgnt/66-Ro-morphgnt.txt --input book_name="Romans" out/kjv/"Romans".pdf
	typst compile new_testament.typ --input version=KJV --input sblgnt_filename=sblgnt/67-1Co-morphgnt.txt --input book_name="1 Corinthians" out/kjv/"1_Corinthians".pdf
	typst compile new_testament.typ --input version=KJV --input sblgnt_filename=sblgnt/68-2Co-morphgnt.txt --input book_name="2 Corinthians" out/kjv/"2_Corinthians".pdf
	typst compile new_testament.typ --input version=KJV --input sblgnt_filename=sblgnt/69-Ga-morphgnt.txt --input book_name="Galatians" out/kjv/"Galatians".pdf
	typst compile new_testament.typ --input version=KJV --input sblgnt_filename=sblgnt/70-Eph-morphgnt.txt --input book_name="Ephesians" out/kjv/"Ephesians".pdf
	typst compile new_testament.typ --input version=KJV --input sblgnt_filename=sblgnt/71-Php-morphgnt.txt --input book_name="Philippians" out/kjv/"Philippians".pdf
	typst compile new_testament.typ --input version=KJV --input sblgnt_filename=sblgnt/72-Col-morphgnt.txt --input book_name="Colossians" out/kjv/"Colossians".pdf
	typst compile new_testament.typ --input version=KJV --input sblgnt_filename=sblgnt/73-1Th-morphgnt.txt --input book_name="1 Thessalonians" out/kjv/"1_Thessalonians".pdf
	typst compile new_testament.typ --input version=KJV --input sblgnt_filename=sblgnt/74-2Th-morphgnt.txt --input book_name="2 Thessalonians" out/kjv/"2_Thessalonians".pdf
	typst compile new_testament.typ --input version=KJV --input sblgnt_filename=sblgnt/75-1Ti-morphgnt.txt --input book_name="1 Timothy" out/kjv/"1_Timothy".pdf
	typst compile new_testament.typ --input version=KJV --input sblgnt_filename=sblgnt/76-2Ti-morphgnt.txt --input book_name="2 Timothy" out/kjv/"2_Timothy".pdf
	typst compile new_testament.typ --input version=KJV --input sblgnt_filename=sblgnt/77-Tit-morphgnt.txt --input book_name="Titus" out/kjv/"Titus".pdf
	typst compile new_testament.typ --input version=KJV --input sblgnt_filename=sblgnt/78-Phm-morphgnt.txt --input book_name="Philemon" out/kjv/"Philemon".pdf
	typst compile new_testament.typ --input version=KJV --input sblgnt_filename=sblgnt/79-Heb-morphgnt.txt --input book_name="Hebrews" out/kjv/"Hebrews".pdf
	typst compile new_testament.typ --input version=KJV --input sblgnt_filename=sblgnt/80-Jas-morphgnt.txt --input book_name="James" out/kjv/"James".pdf
	typst compile new_testament.typ --input version=KJV --input sblgnt_filename=sblgnt/81-1Pe-morphgnt.txt --input book_name="1 Peter" out/kjv/"1_Peter".pdf
	typst compile new_testament.typ --input version=KJV --input sblgnt_filename=sblgnt/82-2Pe-morphgnt.txt --input book_name="2 Peter" out/kjv/"2_Peter".pdf
	typst compile new_testament.typ --input version=KJV --input sblgnt_filename=sblgnt/83-1Jn-morphgnt.txt --input book_name="1 John" out/kjv/"1_John".pdf
	typst compile new_testament.typ --input version=KJV --input sblgnt_filename=sblgnt/84-2Jn-morphgnt.txt --input book_name="2 John" out/kjv/"2_John".pdf
	typst compile new_testament.typ --input version=KJV --input sblgnt_filename=sblgnt/85-3Jn-morphgnt.txt --input book_name="3 John" out/kjv/"3_John".pdf
	typst compile new_testament.typ --input version=KJV --input sblgnt_filename=sblgnt/86-Jud-morphgnt.txt --input book_name="Jude" out/kjv/"Jude".pdf
	typst compile new_testament.typ --input version=KJV --input sblgnt_filename=sblgnt/87-Re-morphgnt.txt --input book_name="Revelation" out/kjv/"Revelation".pdf

	typst compile new_testament.typ --input version=ESV --input sblgnt_filename=sblgnt/61-Mt-morphgnt.txt --input book_name="Matthew" out/esv/"Matthew".pdf
	typst compile new_testament.typ --input version=ESV --input sblgnt_filename=sblgnt/62-Mk-morphgnt.txt --input book_name="Mark" out/esv/"Mark".pdf
	typst compile new_testament.typ --input version=ESV --input sblgnt_filename=sblgnt/63-Lk-morphgnt.txt --input book_name="Luke" out/esv/"Luke".pdf
	typst compile new_testament.typ --input version=ESV --input sblgnt_filename=sblgnt/64-Jn-morphgnt.txt --input book_name="John" out/esv/"John".pdf
	typst compile new_testament.typ --input version=ESV --input sblgnt_filename=sblgnt/65-Ac-morphgnt.txt --input book_name="Acts" out/esv/"Acts".pdf
	typst compile new_testament.typ --input version=ESV --input sblgnt_filename=sblgnt/66-Ro-morphgnt.txt --input book_name="Romans" out/esv/"Romans".pdf
	typst compile new_testament.typ --input version=ESV --input sblgnt_filename=sblgnt/67-1Co-morphgnt.txt --input book_name="1 Corinthians" out/esv/"1_Corinthians".pdf
	typst compile new_testament.typ --input version=ESV --input sblgnt_filename=sblgnt/68-2Co-morphgnt.txt --input book_name="2 Corinthians" out/esv/"2_Corinthians".pdf
	typst compile new_testament.typ --input version=ESV --input sblgnt_filename=sblgnt/69-Ga-morphgnt.txt --input book_name="Galatians" out/esv/"Galatians".pdf
	typst compile new_testament.typ --input version=ESV --input sblgnt_filename=sblgnt/70-Eph-morphgnt.txt --input book_name="Ephesians" out/esv/"Ephesians".pdf
	typst compile new_testament.typ --input version=ESV --input sblgnt_filename=sblgnt/71-Php-morphgnt.txt --input book_name="Philippians" out/esv/"Philippians".pdf
	typst compile new_testament.typ --input version=ESV --input sblgnt_filename=sblgnt/72-Col-morphgnt.txt --input book_name="Colossians" out/esv/"Colossians".pdf
	typst compile new_testament.typ --input version=ESV --input sblgnt_filename=sblgnt/73-1Th-morphgnt.txt --input book_name="1 Thessalonians" out/esv/"1_Thessalonians".pdf
	typst compile new_testament.typ --input version=ESV --input sblgnt_filename=sblgnt/74-2Th-morphgnt.txt --input book_name="2 Thessalonians" out/esv/"2_Thessalonians".pdf
	typst compile new_testament.typ --input version=ESV --input sblgnt_filename=sblgnt/75-1Ti-morphgnt.txt --input book_name="1 Timothy" out/esv/"1_Timothy".pdf
	typst compile new_testament.typ --input version=ESV --input sblgnt_filename=sblgnt/76-2Ti-morphgnt.txt --input book_name="2 Timothy" out/esv/"2_Timothy".pdf
	typst compile new_testament.typ --input version=ESV --input sblgnt_filename=sblgnt/77-Tit-morphgnt.txt --input book_name="Titus" out/esv/"Titus".pdf
	typst compile new_testament.typ --input version=ESV --input sblgnt_filename=sblgnt/78-Phm-morphgnt.txt --input book_name="Philemon" out/esv/"Philemon".pdf
	typst compile new_testament.typ --input version=ESV --input sblgnt_filename=sblgnt/79-Heb-morphgnt.txt --input book_name="Hebrews" out/esv/"Hebrews".pdf
	typst compile new_testament.typ --input version=ESV --input sblgnt_filename=sblgnt/80-Jas-morphgnt.txt --input book_name="James" out/esv/"James".pdf
	typst compile new_testament.typ --input version=ESV --input sblgnt_filename=sblgnt/81-1Pe-morphgnt.txt --input book_name="1 Peter" out/esv/"1_Peter".pdf
	typst compile new_testament.typ --input version=ESV --input sblgnt_filename=sblgnt/82-2Pe-morphgnt.txt --input book_name="2 Peter" out/esv/"2_Peter".pdf
	typst compile new_testament.typ --input version=ESV --input sblgnt_filename=sblgnt/83-1Jn-morphgnt.txt --input book_name="1 John" out/esv/"1_John".pdf
	typst compile new_testament.typ --input version=ESV --input sblgnt_filename=sblgnt/84-2Jn-morphgnt.txt --input book_name="2 John" out/esv/"2_John".pdf
	typst compile new_testament.typ --input version=ESV --input sblgnt_filename=sblgnt/85-3Jn-morphgnt.txt --input book_name="3 John" out/esv/"3_John".pdf
	typst compile new_testament.typ --input version=ESV --input sblgnt_filename=sblgnt/86-Jud-morphgnt.txt --input book_name="Jude" out/esv/"Jude".pdf
	typst compile new_testament.typ --input version=ESV --input sblgnt_filename=sblgnt/87-Re-morphgnt.txt --input book_name="Revelation" out/esv/"Revelation".pdf

	typst compile new_testament.typ --input version=NASB1995 --input sblgnt_filename=sblgnt/61-Mt-morphgnt.txt --input book_name="Matthew" out/nasb/"Matthew".pdf
	typst compile new_testament.typ --input version=NASB1995 --input sblgnt_filename=sblgnt/62-Mk-morphgnt.txt --input book_name="Mark" out/nasb/"Mark".pdf
	typst compile new_testament.typ --input version=NASB1995 --input sblgnt_filename=sblgnt/63-Lk-morphgnt.txt --input book_name="Luke" out/nasb/"Luke".pdf
	typst compile new_testament.typ --input version=NASB1995 --input sblgnt_filename=sblgnt/64-Jn-morphgnt.txt --input book_name="John" out/nasb/"John".pdf
	typst compile new_testament.typ --input version=NASB1995 --input sblgnt_filename=sblgnt/65-Ac-morphgnt.txt --input book_name="Acts" out/nasb/"Acts".pdf
	typst compile new_testament.typ --input version=NASB1995 --input sblgnt_filename=sblgnt/66-Ro-morphgnt.txt --input book_name="Romans" out/nasb/"Romans".pdf
	typst compile new_testament.typ --input version=NASB1995 --input sblgnt_filename=sblgnt/67-1Co-morphgnt.txt --input book_name="1 Corinthians" out/nasb/"1_Corinthians".pdf
	typst compile new_testament.typ --input version=NASB1995 --input sblgnt_filename=sblgnt/68-2Co-morphgnt.txt --input book_name="2 Corinthians" out/nasb/"2_Corinthians".pdf
	typst compile new_testament.typ --input version=NASB1995 --input sblgnt_filename=sblgnt/69-Ga-morphgnt.txt --input book_name="Galatians" out/nasb/"Galatians".pdf
	typst compile new_testament.typ --input version=NASB1995 --input sblgnt_filename=sblgnt/70-Eph-morphgnt.txt --input book_name="Ephesians" out/nasb/"Ephesians".pdf
	typst compile new_testament.typ --input version=NASB1995 --input sblgnt_filename=sblgnt/71-Php-morphgnt.txt --input book_name="Philippians" out/nasb/"Philippians".pdf
	typst compile new_testament.typ --input version=NASB1995 --input sblgnt_filename=sblgnt/72-Col-morphgnt.txt --input book_name="Colossians" out/nasb/"Colossians".pdf
	typst compile new_testament.typ --input version=NASB1995 --input sblgnt_filename=sblgnt/73-1Th-morphgnt.txt --input book_name="1 Thessalonians" out/nasb/"1_Thessalonians".pdf
	typst compile new_testament.typ --input version=NASB1995 --input sblgnt_filename=sblgnt/74-2Th-morphgnt.txt --input book_name="2 Thessalonians" out/nasb/"2_Thessalonians".pdf
	typst compile new_testament.typ --input version=NASB1995 --input sblgnt_filename=sblgnt/75-1Ti-morphgnt.txt --input book_name="1 Timothy" out/nasb/"1_Timothy".pdf
	typst compile new_testament.typ --input version=NASB1995 --input sblgnt_filename=sblgnt/76-2Ti-morphgnt.txt --input book_name="2 Timothy" out/nasb/"2_Timothy".pdf
	typst compile new_testament.typ --input version=NASB1995 --input sblgnt_filename=sblgnt/77-Tit-morphgnt.txt --input book_name="Titus" out/nasb/"Titus".pdf
	typst compile new_testament.typ --input version=NASB1995 --input sblgnt_filename=sblgnt/78-Phm-morphgnt.txt --input book_name="Philemon" out/nasb/"Philemon".pdf
	typst compile new_testament.typ --input version=NASB1995 --input sblgnt_filename=sblgnt/79-Heb-morphgnt.txt --input book_name="Hebrews" out/nasb/"Hebrews".pdf
	typst compile new_testament.typ --input version=NASB1995 --input sblgnt_filename=sblgnt/80-Jas-morphgnt.txt --input book_name="James" out/nasb/"James".pdf
	typst compile new_testament.typ --input version=NASB1995 --input sblgnt_filename=sblgnt/81-1Pe-morphgnt.txt --input book_name="1 Peter" out/nasb/"1_Peter".pdf
	typst compile new_testament.typ --input version=NASB1995 --input sblgnt_filename=sblgnt/82-2Pe-morphgnt.txt --input book_name="2 Peter" out/nasb/"2_Peter".pdf
	typst compile new_testament.typ --input version=NASB1995 --input sblgnt_filename=sblgnt/83-1Jn-morphgnt.txt --input book_name="1 John" out/nasb/"1_John".pdf
	typst compile new_testament.typ --input version=NASB1995 --input sblgnt_filename=sblgnt/84-2Jn-morphgnt.txt --input book_name="2 John" out/nasb/"2_John".pdf
	typst compile new_testament.typ --input version=NASB1995 --input sblgnt_filename=sblgnt/85-3Jn-morphgnt.txt --input book_name="3 John" out/nasb/"3_John".pdf
	typst compile new_testament.typ --input version=NASB1995 --input sblgnt_filename=sblgnt/86-Jud-morphgnt.txt --input book_name="Jude" out/nasb/"Jude".pdf
	typst compile new_testament.typ --input version=NASB1995 --input sblgnt_filename=sblgnt/87-Re-morphgnt.txt --input book_name="Revelation" out/nasb/"Revelation".pdf

	typst compile new_testament.typ --input sblgnt_filename=sblgnt/61-Mt-morphgnt.txt --input book_name="Matthew" out/none/"Matthew".pdf
	typst compile new_testament.typ --input sblgnt_filename=sblgnt/62-Mk-morphgnt.txt --input book_name="Mark" out/none/"Mark".pdf
	typst compile new_testament.typ --input sblgnt_filename=sblgnt/63-Lk-morphgnt.txt --input book_name="Luke" out/none/"Luke".pdf
	typst compile new_testament.typ --input sblgnt_filename=sblgnt/64-Jn-morphgnt.txt --input book_name="John" out/none/"John".pdf
	typst compile new_testament.typ --input sblgnt_filename=sblgnt/65-Ac-morphgnt.txt --input book_name="Acts" out/none/"Acts".pdf
	typst compile new_testament.typ --input sblgnt_filename=sblgnt/66-Ro-morphgnt.txt --input book_name="Romans" out/none/"Romans".pdf
	typst compile new_testament.typ --input sblgnt_filename=sblgnt/67-1Co-morphgnt.txt --input book_name="1 Corinthians" out/none/"1_Corinthians".pdf
	typst compile new_testament.typ --input sblgnt_filename=sblgnt/68-2Co-morphgnt.txt --input book_name="2 Corinthians" out/none/"2_Corinthians".pdf
	typst compile new_testament.typ --input sblgnt_filename=sblgnt/69-Ga-morphgnt.txt --input book_name="Galatians" out/none/"Galatians".pdf
	typst compile new_testament.typ --input sblgnt_filename=sblgnt/70-Eph-morphgnt.txt --input book_name="Ephesians" out/none/"Ephesians".pdf
	typst compile new_testament.typ --input sblgnt_filename=sblgnt/71-Php-morphgnt.txt --input book_name="Philippians" out/none/"Philippians".pdf
	typst compile new_testament.typ --input sblgnt_filename=sblgnt/72-Col-morphgnt.txt --input book_name="Colossians" out/none/"Colossians".pdf
	typst compile new_testament.typ --input sblgnt_filename=sblgnt/73-1Th-morphgnt.txt --input book_name="1 Thessalonians" out/none/"1_Thessalonians".pdf
	typst compile new_testament.typ --input sblgnt_filename=sblgnt/74-2Th-morphgnt.txt --input book_name="2 Thessalonians" out/none/"2_Thessalonians".pdf
	typst compile new_testament.typ --input sblgnt_filename=sblgnt/75-1Ti-morphgnt.txt --input book_name="1 Timothy" out/none/"1_Timothy".pdf
	typst compile new_testament.typ --input sblgnt_filename=sblgnt/76-2Ti-morphgnt.txt --input book_name="2 Timothy" out/none/"2_Timothy".pdf
	typst compile new_testament.typ --input sblgnt_filename=sblgnt/77-Tit-morphgnt.txt --input book_name="Titus" out/none/"Titus".pdf
	typst compile new_testament.typ --input sblgnt_filename=sblgnt/78-Phm-morphgnt.txt --input book_name="Philemon" out/none/"Philemon".pdf
	typst compile new_testament.typ --input sblgnt_filename=sblgnt/79-Heb-morphgnt.txt --input book_name="Hebrews" out/none/"Hebrews".pdf
	typst compile new_testament.typ --input sblgnt_filename=sblgnt/80-Jas-morphgnt.txt --input book_name="James" out/none/"James".pdf
	typst compile new_testament.typ --input sblgnt_filename=sblgnt/81-1Pe-morphgnt.txt --input book_name="1 Peter" out/none/"1_Peter".pdf
	typst compile new_testament.typ --input sblgnt_filename=sblgnt/82-2Pe-morphgnt.txt --input book_name="2 Peter" out/none/"2_Peter".pdf
	typst compile new_testament.typ --input sblgnt_filename=sblgnt/83-1Jn-morphgnt.txt --input book_name="1 John" out/none/"1_John".pdf
	typst compile new_testament.typ --input sblgnt_filename=sblgnt/84-2Jn-morphgnt.txt --input book_name="2 John" out/none/"2_John".pdf
	typst compile new_testament.typ --input sblgnt_filename=sblgnt/85-3Jn-morphgnt.txt --input book_name="3 John" out/none/"3_John".pdf
	typst compile new_testament.typ --input sblgnt_filename=sblgnt/86-Jud-morphgnt.txt --input book_name="Jude" out/none/"Jude".pdf
	typst compile new_testament.typ --input sblgnt_filename=sblgnt/87-Re-morphgnt.txt --input book_name="Revelation" out/none/"Revelation".pdf

