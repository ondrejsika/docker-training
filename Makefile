fmt:
	yarn run prettier-write

fmt-check:
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

print-pull-images:
	cat images.txt | xargs -n 1 echo docker pull

pull-images:
	cat images.txt | xargs -n 1 docker pull

save-image-list:
	docker image ls --format '{{.Repository}}:{{.Tag}}' | sort > images.txt
