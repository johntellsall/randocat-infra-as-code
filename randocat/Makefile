all: package deploy run

package:
	sls package --verbose --package=mypackage
	gls -sh mypackage/*.zip

deploy:
	sls deploy --package=mypackage

hello:
	sls invoke -f hello --log

dbversion:
	sls invoke -f dbversion --log

run: dbversion
