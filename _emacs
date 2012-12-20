(defun add-load-path-recursive (path)
  (dolist (dir (let ((dir (expand-file-name path)))
                 (list dir (format "%s%d" dir emacs-major-version))))
    (when (and (stringp dir) (file-directory-p dir))
      (let ((default-directory dir))
        (setq load-path (cons default-directory load-path))
        (normal-top-level-add-subdirs-to-load-path)))))

(add-load-path-recursive "~/.emacs.d/site-lisp")

(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")

(if (file-exists-p "~/.emacs.local")
 (load "~/.emacs.local"))
