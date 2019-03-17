all: package deploy run

package:
	sls package --verbose --package=mypackage

deploy:
	sls deploy --verbose --package=mypackage

hello:
	sls invoke -f hello --log

dbversion:
	sls invoke -f dbversion --log

run: dbversion