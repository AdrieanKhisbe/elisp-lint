;;; test-helper --- Test helper for elisp-lint

;;; Commentary:
;; test helper inspired from https://github.com/tonini/overseer.el/blob/master/test/test-helper.el

;;; Code:

(require 'f)

(defvar cpt-path
  (f-parent (f-this-file)))

(defvar elisp-lint-test-path
  (f-dirname (f-this-file)))

(defvar elisp-lint-root-path
  (f-parent elisp-lint-test-path))

(defvar elisp-lint-sandbox-path
  (f-expand "sandbox" elisp-lint-test-path))

(when (f-exists? elisp-lint-sandbox-path)
  (error "Something is already in %s. Check and destroy it yourself" elisp-lint-sandbox-path))

(defmacro within-sandbox (&rest body)
  "Evaluate BODY in an empty sandbox directory."
  `(let ((default-directory elisp-lint-sandbox-path))
     (when (f-exists? elisp-lint-sandbox-path)
       (f-delete default-directory :force))
     (f-mkdir elisp-lint-sandbox-path)
     ,@body
     (f-delete default-directory :force)))

(require 'undercover)
(undercover "*.el" "elisp-lint/*.el"
            (:exclude "*-test.el")
            (:send-report nil)
            (:report-file "/tmp/undercover-report.json"))
(require 'ert)
(require 'elisp-lint)

(provide 'test-helper)
;;; test-helper.el ends here
