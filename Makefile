fmt:
	yarn run prettier-write

fmt-check:
	# Install using: `brew install editorconfig-checker`
	editorconfig-checker
	yarn run prettier-check

setup-git-hooks:
	rm -rf .git/hooks
	(cd .git && ln -s ../.git-hooks hooks)

gitstats:
	docker run -w /workspace \
		-v $(shell pwd)/.git:/workspace/.git:ro \
		-v $(shell pwd)/.gitstats:/workspace/.gitstats_output:rw \
		nixery.dev/git/gitstats \
		gitstats . .gitstats_output
