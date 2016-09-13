;; el-get
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))
(add-to-list 'load-path (locate-user-emacs-file "el-get"))
(require 'el-get)
(setq el-get-dir (locate-user-emacs-file "lisp"))

;; Install package
(el-get-bundle auto-complete)
(el-get-bundle markdown-mode)
(el-get-bundle dockerfile-mode)
(el-get-bundle yaml-mode)
(el-get-bundle terraform-mode)

;; Set window
(tool-bar-mode 0)

;; Set color
(load-theme 'tango-dark t)

;; Set key-bind
(define-key global-map "\C-x\C-b" 'electric-buffer-list)
(define-key global-map "\C-cr" 'replace-string)
(define-key global-map "\C-cp" 'markdown-preview)

;; Don't create backup file
(setq make-backup-files nil)

;; Python
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
