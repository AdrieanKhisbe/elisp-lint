(require 'f)

(defvar elisp-lint-support-path
  (f-dirname load-file-name))

(defvar elisp-lint-features-path
  (f-parent elisp-lint-support-path))

(defvar elisp-lint-root-path
  (f-parent elisp-lint-features-path))

(add-to-list 'load-path elisp-lint-root-path)

(require 'undercover)
(undercover "*.el" "elisp-lint/*.el"
            (:exclude "*-test.el")
            (:report-file "/tmp/undercover-report.json"))
(require 'elisp-lint)
(require 'espuds)
(require 'ert)

(Setup
 ;; Before anything has run
 )

(Before
 ;; Before each scenario is run
 )

(After
 ;; After each scenario is run
 )

(Teardown
 ;; After when everything has been run
 )
