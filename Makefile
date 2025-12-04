default: migrating_from_hpux_to_sles.pdf migrating_from_hpux_to_sles.adoc migrating_from_hpux_to_sles.docx migrating_from_hpux_to_sles.epub

migrating_from_hpux_to_sles.md: chapters/00-00.md chapters/00-01.md chapters/01-00.md chapters/01-01.md chapters/01-02.md chapters/02-00.md chapters/02-01.md chapters/02-02.md chapters/03-00.md chapters/03-01.md chapters/03-02.md chapters/03-03.md chapters/03-04.md chapters/04-00.md chapters/04-01.md chapters/04-02.md chapters/99-00.md
	cat $^ > $@

%.pdf: %.tex 
	pdflatex $< ; pdflatex $<

%.tex: %.md 
	pandoc --to=latex --standalone --number-sections --top-level-division=chapter -V geometry:margin=1in -V colorlinks=true -V linkcolor=blue -V urlcolor=blue -V classoption=table -V booktabs=true -V documentclass=scrreprt -H style-latex.tex --output=$@ $+

%.docx: %.md 
	pandoc --to=docx --standalone --output=$@ $+

%.adoc: %.md 
	pandoc --from markdown --to asciidoc -o $@ $+

%.epub: %.md 
	pandoc --from markdown --to epub --css=style-epub.css --toc --toc-depth=2 -o $@ $+
###	pandoc --from markdown --to epub --css=style-epub.css --toc --toc-depth=2 --epub-cover-image=cover.jpg --split-level=1 -o $@ $+

clean:
	rm -f migrating_from_hpux_to_sles.pdf migrating_from_hpux_to_sles.adoc migrating_from_hpux_to_sles.aux migrating_from_hpux_to_sles.log migrating_from_hpux_to_sles.nav migrating_from_hpux_to_sles.snm migrating_from_hpux_to_sles.tex migrating_from_hpux_to_sles.toc migrating_from_hpux_to_sles.vrb migrating_from_hpux_to_sles.docx migrating_from_hpux_to_sles.md migrating_from_hpux_to_sles.epub

view:	migrating_from_hpux_to_sles.pdf
	okular migrating_from_hpux_to_sles.pdf

