all: main.pdf

main.pdf: main.tex
	latexmk -pdf $<

clean:
	git clean -f
