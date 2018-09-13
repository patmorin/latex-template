
name=freecoll

$(name).pdf : $(name).tex $(name).bib figs/
	(cd figs; make)
	latexmk -pdf $(name)

reset : clean $(name).pdf

clean :
	rm -f $(name).pdf

install: $(name).pdf
	scp $< cglab.ca:public_html/publications/drafts/$(name)/$(name)-`date --iso`.pdf
