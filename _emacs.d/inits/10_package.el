(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)

;; For important compatibility libraries like cl-lib
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(defvar my/installing-packages
  '(
    elixir-mode
    php-mode
    ))

(when (boundp 'package-pinned-packages)
  (add-to-list 'package-pinned-packages '(elixir-mode . "melpa-stable") t))

(package-initialize)

(let ((not-installed (loop for x in my/installing-packages
                           when (not (package-installed-p x))
                           collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (package not-installed)
      (package-install package))))
