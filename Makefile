.PHONY: default build clean docs git-hook pretty lint test run

default: build

build: _site

clean:
	rm --force --recursive _site node_modules

docs:
	@echo "No documentation included by default."

git-hook:
	echo "make pretty" > .git/hooks/pre-commit

pretty: node_modules
	npm exec -- biome check --write --no-errors-on-unmatched
	npm pkg fix

lint: node_modules
	npm exec -- biome check .

test:
	@echo "No tests included by default."

run: node_modules
	npm exec -- hugo server --buildDrafts


node_modules:
	npm install

_site: node_modules
	npm exec -- hugo --environment production --minify
