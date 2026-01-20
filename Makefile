.PHONY: build deploy

build:
	hugo --gc --minify

deploy: build
	# Push Source (Markdown/Research)
	git add .
	git commit -m "Update tradecraft source: $$(date)"
	git push origin main

	# Push Live Site (Static HTML)
	cd public && \
	git add . && \
	git commit -m "Intelligence Feed Update: $$(date)" && \
	git push origin main