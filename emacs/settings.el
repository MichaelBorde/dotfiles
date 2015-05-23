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

(global-undo-tree-mode 1)
(defalias 'redo 'undo-tree-redo)

(load-theme 'monokai t)

(helm-mode 1)
(helm-autoresize-mode t)
(setq helm-autoresize-max-height 30)
(setq helm-autoresize-min-height 30)
(setq helm-buffers-fuzzy-matching t)
(setq helm-recentf-fuzzy-match t)
(setq helm-lisp-fuzzy-completion t) 
(setq helm-locate-fuzzy-match t)
(setq helm-M-x-fuzzy-match t)
(setq helm-semantic-fuzzy-match t)
(setq helm-imenu-fuzzy-match t)
(setq helm-apropos-fuzzy-match t)

;;(setq ac-use-fuzzy t)
;;(setq ac-ignore-case t)

(add-hook 'after-change-major-mode-hook
          (lambda() (electric-indent-mode -1)))
;;(add-hook 'emacs-startup-hook
;;(lambda () (delete-other-windows)) t)
