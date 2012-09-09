
(unless (boundp 'my-emacs-directory)
  (defvar my-emacs-directory "~/.emacs.d/"))

(unless (boundp 'my-site-lisp-directory)
  (defvar my-site-lisp-directory (concat my-emacs-directory "site-lisp")))

(unless (boundp 'my-inits-directory)
  (defvar my-inits-directory (concat my-emacs-directory "inits")))

(unless (boundp 'my-snippets-directory)
  (defvar my-snippets-directory (concat my-emacs-directory "snippets")))

(add-hook 'after-init-hook
          '(lambda ()
             (cd "~")
             (dired "~")))
