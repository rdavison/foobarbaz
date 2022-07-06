SHELL=/bin/bash
ESY=npx esy@0.6.12
DUNE=$(ESY) dune

.PHONY: default
default: build-watch

################################################################################
# Dependency management

.PHONY: install-deps
install-deps:
	make -C bar install-deps
	make -C baz install-deps
	$(ESY) 

################################################################################
# Developer build commands

.PHONY: build-watch
build-watch:
	$(ESY) watch

.PHONY: start
start:
	tmux new-session -s foo \
		'make -C bar build-watch' \; \
		split-window \
		'make -C baz build-watch' \; \
		split-window \
		'make build-watch' \; \
		select-layout even-vertical

.PHONY: build
build:
	$(ESY)

.PHONY: utop
utop:
	$(DUNE) utop

################################################################################
# Run tests

.PHONY: test
test:
	$(DUNE) build @runtest

################################################################################
# Clean commands

.PHONY: clean
clean:
	make -C bar clean
	make -C baz clean
	$(ESY) clean || rm -rf _build
	rm -rf _build.prev

.PHONY: distclean
distclean: clean
	make -C bar distclean
	make -C baz distclean
	rm -rf _esy
	rm -rf node_modules
