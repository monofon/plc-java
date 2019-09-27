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

# Start a local notebook server that can serve to iframes. For that, it uses the
# following configuration from ./jupyter:
#	c.NotebookApp.tornado_settings = {
#		'headers': {
#			'Content-Security-Policy': 
#				"frame-ancestors tramberend.beuth-hochschule.de localhost:* http: https: 'self';"
#			}
#		}
jupyter: 
	env JUPYTER_CONFIG_DIR=jupyter \
	jupyter notebook --port 8192 \
		--NotebookApp.allow_origin='http://localhost:8888' \
		--NotebookApp.token='plc'

# Build the plc-java docker image.
docker-build:
	docker build --tag=plc-java .

# Run plc-java locally on port 8192.
docker-run:
	(sleep 2; open -a safari http://localhost:8192?token=plc)&
	docker run -p 8192:8888 --env JUPYTER_TOKEN=plc plc-java

.PHONY: clean compile run-template install jupyter
