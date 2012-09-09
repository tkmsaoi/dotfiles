(require 'anything-startup)

(defvar anything-c-source-coding-system
  '((name . "Coding Systems")
    (candidates . anything-coding-system-candidates)
    (action . (("set-buffer-file-coding-system" . set-buffer-file-coding-system)
               ("revert-buffer-with-coding-system" . revert-buffer-with-coding-system)))))

(defvar anything-coding-system-candidates
  '(("utf-8-unix" . utf-8-unix)
    ("utf-8-mac" . utf-8-mac)
    ("utf-8-dos" . utf-8-dos)
    ("euc-jp-unix" . euc-jp-unix)
    ("euc-jp-mac" . euc-jp-mac)
    ("euc-jp-dos" . euc-jp-dos)
    ("sjis-unix" . sjis-unix)
    ("sjis-mac" . sjis-mac)
    ("sjis-dos" . sjis-dos)))

(defun anything-coding-system ()
  (interactive)
  (anything-other-buffer
   '(anything-c-source-coding-system)
   "*anything-coding-system*"))
