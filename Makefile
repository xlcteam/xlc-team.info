
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
		
	git checkout source
clean:
	rm -rf output/
	rm -rf tmp/

upload:
	git checkout master
	rsync --exclude '.git/*' -r . root@direct.shu.io:/var/www/xlc-team.info/html''
	git checkout source

show:
	nanoc
	cd output; python2 -m SimpleHTTPServer&
	$(BROWSER) http://0.0.0.0:8000/&


