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
		--NotebookApp.port=8192 \
		--NotebookApp.token=plc

# Build the plc-java docker image.
docker-build:
	docker build --tag=plc-java .

# Run plc-java locally on port 8192.
docker-run:
	(sleep 2; open -a safari http://localhost:8192?token=plc)&
	docker run -p 8192:8888 --env JUPYTER_TOKEN=plc plc-java

.PHONY: clean compile run-template install jupyter