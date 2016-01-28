(defun my-rename-system-buffer (name)
  (interactive "sRename buffer (to new *name*): ")
  (rename-buffer (concat "*" name "*")))
