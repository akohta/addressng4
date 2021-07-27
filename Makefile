TARGET := example.pdf
.PHONY: all clean
CNT := 2

all: $(TARGET)

%.pdf: %.dvi
	dvipdfmx $<

%.dvi: %.tex
	for i in `seq 1 $(CNT)`; do platex -interaction=batchmode $<; done

clean:
	@rm -f *.aux *.log *.dvi *.toc

