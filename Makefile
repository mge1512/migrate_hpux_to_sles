# 1. FILES AND DIRECTORIES
# ------------------------

# Automatically find all .md files and sort them (00-.., 10-.., 20-..)
SOURCES	:= $(sort $(wildcard chapters/*.md))

# Output filenames
PDF_OUT = migrating_from_hpux_to_sles.pdf
EPUB_OUT = migrating_from_hpux_to_sles.epub
ADOC_OUT = migrating_from_hpux_to_sles.adoc
DOCX_OUT = migrating_from_hpux_to_sles.docx

# Assets (Headers, CSS, Images)
# Ensure these files exist in your folder!
LATEX_HEADER = style-latex.tex
EPUB_CSS = style-epub.css
COVER_IMG = 

# Automatically generated history
HISTORY_FILE = chapters/99-history.md
HISTORY_LIMIT = -n 42

# 2. PANDOC OPTIONS
# -----------------

# Common options for all formats
COMMON_FLAGS =	--number-sections		\
		--top-level-division=chapter	\
		--highlight-style=tango		\
		--toc --toc-depth=2

# PDF Specific Flags (The "Modern Professional" Setup)
# Includes the xcolor fixes, booktabs, and KOMA-Script class
PDF_FLAGS = 	--pdf-engine=pdflatex		\
		--standalone			\
		-V geometry:margin=1in		\
		-V colorlinks=true		\
		-V linkcolor=blue		\
		-V urlcolor=blue		\
		-V classoption=table		\
		-V booktabs=true		\
		-V documentclass=scrreprt	\
		-H $(LATEX_HEADER)

# EPUB Specific Flags (The "Ebook" Setup)
# Includes TOC, split chapters, and CSS styling
EPUB_FLAGS_LONG=--css=$(EPUB_CSS) 		\
             	--toc 				\
             	--toc-depth=2 			\
             	--split-level=1 		\
             	--epub-cover-image=$(COVER_IMG)

EPUB_FLAGS =	--css=$(EPUB_CSS) 		\
             	--toc 				\
             	--toc-depth=2 

# 3. TARGETS
# ----------

.PHONY: all pdf epub clean help

all: migrating_from_hpux_to_sles.pdf migrating_from_hpux_to_sles.adoc migrating_from_hpux_to_sles.docx migrating_from_hpux_to_sles.epub

# Generator for Version History
history:
	@echo "Generating Version History from Git..."
	@echo "# Version History {-}" > $(HISTORY_FILE)
	@echo "" >> $(HISTORY_FILE)
	@echo "| Date | Commit | Author | Description |" >> $(HISTORY_FILE)
	@echo "|:---|:---|:---|:---|" >> $(HISTORY_FILE)
	@git log $(HISTORY_LIMIT) --date=short --pretty=format:"| %cd | %h | %an | %s |" >> $(HISTORY_FILE)
	@echo "" >> $(HISTORY_FILE)
	@echo ": Recent Changes (Auto-generated)" >> $(HISTORY_FILE)

migrating_from_hpux_to_sles.md: history $(SOURCES)
	cat $(SOURCES) > $@

%.pdf: %.tex 
	pdflatex $< ; pdflatex $<

%.tex: %.md 
	pandoc --from markdown --to latex $(COMMON_FLAGS) $(PDF_FLAGS) --output=$@ $+

%.docx: %.md 
	pandoc --from markdown --to=docx $(COMMON_FLAGS) --output=$@ $+

%.adoc: %.md 
	pandoc --from markdown --to asciidoc $(COMMON_FLAGS) -o $@ $+

%.epub: %.md 
	pandoc --from markdown --to epub $(COMMON_FLAGS) $(EPUB_FLAGS) -o $@ $+

clean:
	rm -f $(PDF_OUT) $(EPUB_OUT) $(ADOC_OUT) $(DOCX_OUT)  migrating_from_hpux_to_sles.aux migrating_from_hpux_to_sles.log migrating_from_hpux_to_sles.nav migrating_from_hpux_to_sles.snm migrating_from_hpux_to_sles.tex migrating_from_hpux_to_sles.toc migrating_from_hpux_to_sles.vrb migrating_from_hpux_to_sles.md

output:	$(PDF_OUT) $(EPUB_OUT) $(ADOC_OUT) $(DOCX_OUT)
	cp -a $(PDF_OUT) $(EPUB_OUT) $(ADOC_OUT) $(DOCX_OUT) output

view:	migrating_from_hpux_to_sles.pdf
	okular migrating_from_hpux_to_sles.pdf

