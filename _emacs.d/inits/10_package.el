(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)

;; For important compatibility libraries like cl-lib
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(when (boundp 'package-pinned-packages)
  (setq package-pinned-packages
        '(
          (editorconfig . "melpa-stable")
          (elixir-mode . "melpa-stable")
          (helm . "melpa-stable")
          )))

(defvar my/installing-packages
  '(
    ag
    auto-complete
    csharp-mode
    dracula-theme
    editorconfig
    elixir-mode
    emmet-mode
    enh-ruby-mode
    exec-path-from-shell
    flycheck
    helm
    helm-ag
    helm-gtags
    helm-projectile
    hlinum
    js2-mode
    markdown-mode
    omnisharp
    php-mode
    projectile
    ruby-electric
    s
    spacegray-theme
    wgrep-ag
    yasnippet
    ))

(package-initialize)

(let ((not-installed (loop for x in my/installing-packages
                           when (not (package-installed-p x))
                           collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (package not-installed)
      (package-install package))))
