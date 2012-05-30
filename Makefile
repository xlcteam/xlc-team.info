
TMPDIR  := $(shell mktemp -d)


generate:
	nanoc
	cp -R output/* $(TMPDIR)
	git checkout master
	cp -R $(TMPDIR)/* .
	git add .
	git commit -am "built"
		



