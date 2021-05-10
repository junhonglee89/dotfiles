MD_FILES=$(shell find . -name \*.md)
HTML_FILES=$(MD_FILES:.md=.html)
BUILD_HTML_FILES=$(HTML_FILES:%=%)

all: $(BUILD_HTML_FILES)

%.html: %.md
	pandoc --quiet $^ -s -o $@
