CASK ?= cask
EMACS ?= emacs

all: test

test: unit ecukes lint

unit:
	${CASK} exec ert-runner

ecukes:
	${CASK} exec ecukes

lint:
	${CASK} exec emacs -Q --batch -l elisp-lint.el -f elisp-lint-files-batch *.el

install:
	${CASK} install
