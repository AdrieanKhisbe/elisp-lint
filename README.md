Elisp Lint
==========

*Basic linting for Emacs Lisp*

<!-- temporary pointing toward my repo -->
[![Build Status](https://travis-ci.org/AdrieanKhisbe/elisp-lint.svg)](https://travis-ci.org/AdrieanKhisbe/elisp-lint) [![Coverage Status](https://coveralls.io/repos/AdrieanKhisbe/elisp-lint/badge.svg)](https://coveralls.io/r/AdrieanKhisbe/elisp-lint) [![Tag Version](https://img.shields.io/github/tag/AdrieanKhisbe/elisp-lint.svg)](https://github.com/AdrieanKhisbe/elisp-lint/tags) [![License] (http://img.shields.io/:license-gpl3-blue.svg)](http://www.gnu.org/licenses/gpl-3.0.html)


## Usage

This is a tool for finding certain problems in Emacs Lisp files. Use it on the command line like this:

    emacs -Q --batch -l elisp-lint.el -f elisp-lint-files-batch *.el

You can disable individual checks, by passing flags on the command line:

    emacs -Q --batch -l elisp-lint.el -f elisp-lint-files-batch --no-indent *.el

Alternatively, you can disable checks using file variables or the following `.dir.locals` file:

    ((nil . ((elisp-lint-ignored-validators . ("fill-column")))))

## Validators

Here is the list of linting validators:

### byte-compile

Byte-compiles the file with all warnings enabled.

### package-format

Calls `package-buffer-info` to validate some file metadata.

### indent

Verifies that each line is indented according to emacs-lisp-mode.

### fill-column
Verifies that no line exceeds the number of columns in fill-column. Use a file variable or a .dir.locals file to override the value.


## Notes

Pull requests for further tests are welcome.
