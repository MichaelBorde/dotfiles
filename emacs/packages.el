(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
	  		 ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

(require 'dockerfile-mode)
(require 'undo-tree)
(require 'helm-config)

(autoload 'markdown-mode "markdown-mode" 
  "Major mode for editing Markdown files" t)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

(require 'ac-helm)
