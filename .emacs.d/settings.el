(setq initial-major-mode 'text-mode)

(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(width . 140))
(setq initial-scratch-message nil)
(set-language-environment "UTF-8")
(setq-default transient-mark-mode t)
(line-number-mode 1)
(column-number-mode 1)
(setq standard-indent 2)
(setq-default indent-tabs-mode nil) 
(setq inhibit-startup-message t)
(setq inhibit-startup-buffer-menu t)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)
(setq scroll-step 1)
(setq system-uses-terminfo nil)
(setq explicit-shell-file-name "/bin/zsh")
(menu-bar-mode -1)
(setq create-lockfiles nil)

(global-undo-tree-mode 1)
(defalias 'redo 'undo-tree-redo)

(load-theme 'monokai t)

(add-hook 'after-change-major-mode-hook
          (lambda() (electric-indent-mode -1)))

