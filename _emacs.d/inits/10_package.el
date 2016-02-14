(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)

;; For important compatibility libraries like cl-lib
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(when (boundp 'package-pinned-packages)
  (setq package-pinned-packages
        '(
          (elixir-mode . "melpa-stable")
          )))

(defvar my-installing-packages
  '(
    ag
    company
    csharp-mode
    dracula-theme
    editorconfig
    elixir-mode
    emmet-mode
    enh-ruby-mode
    exec-path-from-shell
    flycheck
    ggtags
    helm
    helm-ag
    helm-projectile
    hlinum
    js2-mode
    markdown-mode
    magit
    omnisharp
    php-mode
    projectile
    recentf-ext
    ruby-electric
    s
    smartparens
    typescript-mode
    wgrep-ag
    yasnippet
    ))

(package-initialize)

(let ((not-installed (loop for x in my-installing-packages
                           when (not (package-installed-p x))
                           collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (package not-installed)
      (package-install package))))
