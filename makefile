all: main.pdf

main.pdf: main.tex
	latexmk -pdf $<

install-deb-deps:
	sudo apt install texlive texlive-bibtex-extra latexmk biber

clean:
	git clean -f
