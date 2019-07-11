(defun my-rename-system-buffer (name)
  (interactive "sRename buffer (to new *name*): ")
  (rename-buffer (concat "*" name "*")))

(defun my-new-untitled-buffer ()
  "Create and switch to untitled buffer."
  (interactive)
  (switch-to-buffer (generate-new-buffer "Untitled")))
