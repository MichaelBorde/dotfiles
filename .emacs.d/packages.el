(require 'package)
(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")))
(setq package-enable-at-startup nil)
(package-initialize)

(require 'misc)

(defun install-packages ()
  (interactive)
  (unless package-archive-contents
    (package-refresh-contents))
  (mapcar (lambda (package)
            (unless (package-installed-p package)
              (package-install package)))
          '(web-mode
            js2-mode
            markdown-mode
            dockerfile-mode
            adoc-mode
            color-theme-solarized)))

(install-packages)

(autoload 'web-mode "web-mode" nil t)
(autoload 'js2-mode "js2-mode" nil t)
(autoload 'markdown-mode "markdown-mode" nil t)
(autoload 'dockerfile-mode "dockerfile-mode" nil t)
(autoload 'adoc-mode "adoc-mode" nil t)

