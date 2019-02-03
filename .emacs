;; Load modularized configuration files
(add-to-list 'load-path "~/.emacs.d/lisp/")
(load "path.el")
(load "backup.el")
(load "frame.el")
(load "melpa.el")
(load "theme.el")
(load "crystal.el")
(load "elixir.el")
(load "ruby.el")

;; The silver searcher
(require 'ag)

;; Major mode for JSON files
(require 'json-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(package-selected-packages
   (quote
    (elixir-mode solarized-theme json-mode flymake-ruby flycheck-kotlin flycheck-crystal crystal-mode ag))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
