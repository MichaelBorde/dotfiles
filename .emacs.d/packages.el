(require 'package)
(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")))
(setq package-enable-at-startup nil)
(package-initialize)

(require 'misc)

(autoload 'web-mode "web-mode" nil t)
(autoload 'js2-mode "js2-mode" nil t)
(autoload 'markdown-mode "markdown-mode" nil t)
(autoload 'dockerfile-mode "dockerfile-mode" nil t)
(autoload 'adoc-mode "adoc-mode" nil t)
