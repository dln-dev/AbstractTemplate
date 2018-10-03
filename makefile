projname = abstract
compile = pdflatex #pdflatex or lualatex
bib = bibtex #bibtex or biber

all: abstract compress clean
	
	
abstract: $(projname).tex
	$(compile) $(projname).tex
	$(bib) $(projname).aux #.bcf
	$(compile) $(projname).tex
	$(compile) $(projname).tex

compress: $(projname).pdf # bug: references get deleted in compressed file
	@@gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dDOPDFMARKS -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$(projname)_compressed.pdf $(projname).pdf

clean: 
	rm -f $(projname).{aux,aux.bbl,aux.blg,bbl,blg,fdb_latexmk,fls,log,nav,out,snm,toc}
