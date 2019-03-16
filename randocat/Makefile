all: package deploy run

package:
	sls package

deploy:
	sls deploy

run:
	sls invoke -f hello --log