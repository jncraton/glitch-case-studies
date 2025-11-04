all: main.pdf paper.zip slides.html

main.pdf: main.tex
	latexmk -pdf $<

paper.zip: main.tex refs.bib
	zip $@ $^

slides.html: slides.md reveal.js
	pandoc --mathjax -t revealjs --template=revealjs-template.html --standalone -V revealjs-url=reveal.js -V theme:white -V history=true -o $@ $<
	qrencode "https://jncraton.github.io/glitch-case-studies/slides.html" -o "qr.png"

reveal.js:
	git clone --depth=1 --branch 5.2.0 https://github.com/hakimel/reveal.js
	rm -rf reveal.js/.git

spellcheck:
	aspell --home-dir=. --check --dont-backup main.tex

install-deb-deps:
	sudo apt install texlive texlive-latex-extra texlive-bibtex-extra latexmk biber pandoc

clean:
	git clean -f
	rm -rf reveal.js
