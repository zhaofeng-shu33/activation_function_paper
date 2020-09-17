BUILD_DIR = ./build

.PHONY: all

all: $(BUILD_DIR)/exportlist.bib $(BUILD_DIR)/af_main.pdf

$(BUILD_DIR)/exportlist.bib: exportlist.bib
	mkdir -p $(BUILD_DIR)
	cp exportlist.bib $(BUILD_DIR)/


$(BUILD_DIR)/af_main.pdf: af_main.tex $(BUILD_DIR)/exportlist.bib
	mkdir -p $(BUILD_DIR)
	pdflatex -output-directory=$(BUILD_DIR) af_main.tex
	cd $(BUILD_DIR) && bibtex af_main.aux && cd ..
	pdflatex -output-directory=$(BUILD_DIR) af_main.tex
	pdflatex -output-directory=$(BUILD_DIR) af_main.tex
