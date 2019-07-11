(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(when (boundp 'package-pinned-packages)
  (setq package-pinned-packages
        '(
          (elixir-mode . "melpa-stable")
          )))

(defvar my-installing-packages
  '(
    ac-php
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
    groovy-mode
    helm
    helm-ag
    helm-projectile
    hlinum
    markdown-mode
    omnisharp
    php-mode
    prettier-js
    projectile
    protobuf-mode
    recentf-ext
    rjsx-mode
    ruby-electric
    s
    smartparens
    typescript-mode
    wgrep-ag
    yaml-mode
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
