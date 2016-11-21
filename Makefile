all: update

update:
	git submodule update --init --recursive .

.PHONY: all update
.DEFAULT_GOAL=all
