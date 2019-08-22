# 
# author: henrik.tramberend@beuth-hochschule.de
# 
src-dir = ./src
bin-dir = ./bin

src := $(shell fd .java $(src-dir))

compile: make/allsource.txt
	mkdir -p $(bin-dir)
	javac -d $(bin-dir) $(src)

clean:
	rm -r $(bin-dir)

# Start a local notebook server that can serve to iframes. It uses the
# configuration from ./jupyter.
jupyter: 
	env JUPYTER_CONFIG_DIR=jupyter \
	jupyter notebook \
		--NotebookApp.port=8192

.PHONY: clean compile run-template install jupyter