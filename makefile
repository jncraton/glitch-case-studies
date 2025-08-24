all: main.pdf paper.zip

main.pdf: main.tex
	latexmk -pdf $<

paper.zip: main.tex refs.bib
	zip $@ $^

spellcheck:
	aspell --home-dir=. --check --dont-backup main.tex

install-deb-deps:
	sudo apt install texlive texlive-latex-extra texlive-bibtex-extra latexmk biber

clean:
	git clean -f
