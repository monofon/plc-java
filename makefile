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

# Start a notebook server that can serve to iframes
jupyter: 
	jupyter notebook --NotebookApp.tornado_settings='{"headers":{"Content-Security-Policy":"frame-ancestors self http://localhost:8888; report-uri /api/security/csp-report" }}' --port 9999 notebook/vec3-example.ipynb

.PHONY: clean compile run-template install