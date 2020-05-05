serve: 
	bundle exec jekyll serve --incremental --draft --livereload --watch --future
	
clean:
	bundle exec jekyll clean

build: clean
	bundle exec jekyll build

install:
	bundle install

info:
	bundle info minimal-mistakes-jekyll

.PHONY: serve install info
