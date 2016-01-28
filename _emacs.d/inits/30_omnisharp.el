(require 'omnisharp)

(setq omnisharp-server-executable-path
      (concat (getenv "HOME") "/src/omnisharp-server/OmniSharp/bin/Debug/OmniSharp.exe"))

(add-hook 'csharp-mode-hook '(lambda () (omnisharp-mode)))
