.PHONY: clean

paper.pdf: paper.tex plot-data.png
	pdflatex paper.tex

plot-%.png: %.dat plot.py
	./plot.py -i $*.dat -o $@

clean:
	find . -type f -name "plot-*.png" -exec rm {} +
	find . -type f -name "paper*" ! -name "paper.tex" -exec rm {} +