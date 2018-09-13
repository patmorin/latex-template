sources=$(wildcard *.ipe)

pdfs=$(sources:.ipe=.pdf)
burstpdfs=$(sources:.ipe=-1.pdf)

all: $(pdfs) $(burstpdfs)

epss: $(pdfs)
	./makeepss

%-1.pdf : %.pdf
	pdftk $< burst output $(<:.pdf=-%d.pdf)

%.pdf : %.ipe
	ipetoipe -pdf $<

clean :
	rm -f ./*.pdf ./*.eps

kpfonts:
	sed -i 's/<preamble><\/preamble>/<preamble>\\usepackage{kpfonts}<\/preamble>/' *.ipe
	make

plainfonts:
	sed -i 's/\\usepackage{kpfonts}//' *.ipe
	make

