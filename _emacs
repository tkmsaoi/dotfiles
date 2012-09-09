(defvar my-emacs-directory "~/.emacs.d/")
(defvar my-site-lisp-directory (concat my-emacs-directory "site-lisp"))
(defvar my-inits-directory (concat my-emacs-directory "inits"))
(defvar my-snippets-directory (concat my-emacs-directory "snippets"))

(defun add-load-path-recursive (path)
  (dolist (dir (let ((dir (expand-file-name path)))
                 (list dir (format "%s%d" dir emacs-major-version))))
    (when (and (stringp dir) (file-directory-p dir))
      (let ((default-directory dir))
        (setq load-path (cons default-directory load-path))
        (normal-top-level-add-subdirs-to-load-path)))))

(add-load-path-recursive my-site-lisp-directory)

(require 'init-loader)
(init-loader-load my-inits-directory)

(setq user-full-name "Takamasa Aoi")
(setq user-mail-address "tkms.aoi@gmail.com")

(add-to-list 'default-frame-alist '(width . 100))
(add-to-list 'default-frame-alist '(height . 40))
(add-to-list 'default-frame-alist '(top . 0))
(add-to-list 'default-frame-alist '(left . 0))
(add-to-list 'default-frame-alist '(alpha . (85 85 85 85)))
