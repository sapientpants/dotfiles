(require 'elixir-mode)
(add-to-list 'auto-mode-alist '("\\.elixir2\\'" . elixir-mode))
(add-hook 'elixir-mode-hook
          (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))
