default: migrating_from_hpux_to_sles.pdf migrating_from_hpux_to_sles.adoc migrating_from_hpux_to_sles.docx

migrating_from_hpux_to_sles.md: chapters/header.md chapters/preface.md chapters/part01.md chapters/ch01.md chapters/ch02.md chapters/ch03.md chapters/ch04.md chapters/ch05.md chapters/part02.md chapters/ch06.md chapters/ch07.md chapters/ch08.md chapters/ch09.md chapters/ch10.md chapters/part03.md chapters/ch11.md chapters/ch12.md chapters/ch13.md chapters/ch14.md chapters/ch15.md chapters/part04.md chapters/ch16.md chapters/ch17.md chapters/ch18.md chapters/ch19.md chapters/ch20.md chapters/appendix01.md
	cat $^ > $@

%.pdf: %.tex 
	pdflatex $< ; pdflatex $<

%.tex: %.md 
	pandoc --to=latex --standalone --number-sections --top-level-division=chapter -V geometry:margin=1in -V colorlinks=true -V linkcolor=blue -V urlcolor=blue -V documentclass=scrreprt --output=$@ $+

%.docx: %.md 
	pandoc --to=docx --standalone --output=$@ $+

%.adoc: %.md 
	pandoc --from markdown --to asciidoc -o $@ $+

clean:
	rm -f migrating_from_hpux_to_sles.pdf migrating_from_hpux_to_sles.adoc migrating_from_hpux_to_sles.aux migrating_from_hpux_to_sles.log migrating_from_hpux_to_sles.nav migrating_from_hpux_to_sles.snm migrating_from_hpux_to_sles.tex migrating_from_hpux_to_sles.toc migrating_from_hpux_to_sles.vrb migrating_from_hpux_to_sles.docx migrating_from_hpux_to_sles.md

view:	migrating_from_hpux_to_sles.pdf
	okular migrating_from_hpux_to_sles.pdf

