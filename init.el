;; el-get
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))
(add-to-list 'load-path (locate-user-emacs-file "el-get"))
(require 'el-get)
(setq el-get-dir (locate-user-emacs-file "lisp"))

;; Install package
(el-get-bundle auto-complete)
(el-get-bundle ctags)
(el-get-bundle markdown-mode)
(el-get-bundle dockerfile-mode)
(el-get-bundle yaml-mode)
(el-get-bundle terraform-mode)
(el-get-bundle multi-term)
(el-get-bundle helm)
(el-get-bundle helm-projectile)
(el-get-bundle helm-etags-plus)

;; Set window
(tool-bar-mode 0)

;; Set color
(load-theme 'tango-dark t)

;; Set key-bind
(define-key global-map "\C-x\C-b" 'electric-buffer-list)
(define-key global-map "\C-cr" 'replace-string)
(define-key global-map "\C-cp" 'markdown-preview)

;; About backup and auto-save
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Python
(setq flymake-allowed-file-name-masks '())
(add-hook 'find-file-hook 'flymake-find-file-hook)
(when (load "flymake" t)
  (defun flymake-flake8-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
		       'flymake-create-temp-inplace))
	   (local-file (file-relative-name
			temp-file
			(file-name-directory buffer-file-name))))
      (list "/usr/local/bin/flake8"  (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
	       '("\\.py\\'" flymake-flake8-init)))
(defun flymake-show-help ()
  (when (get-char-property (point) 'flymake-overlay)
    (let ((help (get-char-property (point) 'help-echo)))
      (if help (message "%s" help)))))
(add-hook 'post-command-hook 'flymake-show-help)

;; Cua
(cua-mode t)
(setq cua-enable-cua-keys nil)

;; Ctags
(when (require 'ctags nil t)
  (setq tags-revert-without-query t)
  (setq ctags-command "ctags -Re --fields=\"+afikKlmnsSzt\" "))

;; Shell
(when (require 'multi-term nil t)
  (setq multi-term-program "/bin/bash"))
