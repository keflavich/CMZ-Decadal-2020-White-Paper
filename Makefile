# latex Makefile
ifndef texpath
texpath=/usr/texbin/
endif
PDFLATEX=${texpath}pdflatex -halt-on-error -synctex=1 --interaction=nonstopmode
SKIPERR=${texpath}pdflatex --interaction=nonstopmode
LATEX=${PDFLATEX}
BIBTEX=bibtex
DVIPS=dvips
PS2PDF=ps2pdf
SHELL=/bin/bash

all: main


.PHONY: main
main: 
	echo "texpath: ${texpath}"
	python make.py --texpath=${texpath}
	gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=main_compressed.pdf main.pdf
