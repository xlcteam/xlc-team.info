
TMPDIR  := $(shell mktemp -d)
BROWSER := chromium


generate:
	nanoc
	mv output/* $(TMPDIR)
	rm tmp/*
	git checkout master
	cp -R $(TMPDIR)/* .
	git add .
	git commit -am "built $(shell cat .git/refs/heads/source)"
		

clean:
	rm -rf output/
	rm -rf tmp/

show:
	nanoc
	nanoc view& 
	$(BROWSER) http://0.0.0.0:3000/&


