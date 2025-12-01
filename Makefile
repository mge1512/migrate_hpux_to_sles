default: migrating_from_hpux_to_sles.pdf migrating_from_hpux_to_sles.adoc migrating_from_hpux_to_sles.docx

%.pdf: %.tex
	pdflatex $< ; pdflatex $<

%.tex: %.md
	pandoc --to=latex --standalone --output=$@ $+

%.docx: %.md
	pandoc --to=docx --standalone --output=$@ $+

%.adoc: %.md
	pandoc --from markdown --to asciidoc -o $@ $+

clean:
	rm -f migrating_from_hpux_to_sles.pdf migrating_from_hpux_to_sles.adoc migrating_from_hpux_to_sles.aux migrating_from_hpux_to_sles.log migrating_from_hpux_to_sles.nav migrating_from_hpux_to_sles.snm migrating_from_hpux_to_sles.tex migrating_from_hpux_to_sles.toc migrating_from_hpux_to_sles.vrb migrating_from_hpux_to_sles.docx

view:	migrating_from_hpux_to_sles.pdf
	okular migrating_from_hpux_to_sles.pdf

