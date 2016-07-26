
TMPDIR  := $(shell mktemp -d)
BROWSER := chromium


generate:
	nanoc
	mv output/* $(TMPDIR)
	rm -rf tmp/*
	git checkout master
	cp -R $(TMPDIR)/* .
	git add .
	! git commit -am "built $(shell cat .git/refs/heads/source)"
	git checkout source

clean:
	rm -rf output/
	rm -rf tmp/

upload:
	ssh xlc-team.info -l xlc-web -i ./deploy_key /home/xlc-web/fetch-new.sh
show:
	nanoc
	cd output; python2 -m SimpleHTTPServer&
	$(BROWSER) http://0.0.0.0:8000/&


