SHELL=/bin/bash
ESY=npx esy@0.6.12
DUNE=$(ESY) dune

.PHONY: default
default: build-watch

################################################################################
# Dependency management

.PHONY: install-deps
install-deps:
	$(ESY) 

################################################################################
# Developer build commands

.PHONY: build-watch
build-watch:
	$(ESY) watch

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
	$(ESY) clean || rm -rf _build
	rm -rf _build.prev

.PHONY: distclean
distclean: clean
	rm -rf _esy
	rm -rf node_modules
