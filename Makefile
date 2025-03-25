serve: build
	bundle exec jekyll serve --incremental --draft --livereload --watch --future

clean:
	bundle exec jekyll clean

build: clean
	bundle exec jekyll build

install:
	bundle install

info:
	bundle info minimal-mistakes-jekyll

## blc: broken-link-checker, which checks whether URL work
## since the research page contains a large number of external links, which can accidentally be reported as problematic, usually it suffices to run blc on other pages.
blc:
	blc http://localhost:4000 -o || echo "Done with homepage"
	blc http://localhost:4000/about -o || echo "Done with about"
	blc http://localhost:4000/outreach -o || echo "Done with outreach"

## running on research only upon request
blc-research:
	blc http://localhost:4000/research -o || echo "Done with research"

blc-all: blc blc-research

.PHONY: serve install info
