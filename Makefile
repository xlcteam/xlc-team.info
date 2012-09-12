
TMPDIR  := $(shell mktemp -d)


generate:
	nanoc
	mv output/* $(TMPDIR)
	rm tmp/*
	git checkout master
	cp -R $(TMPDIR)/* .
	git add .
	git commit -am "built"
		



