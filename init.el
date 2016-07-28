;; el-get
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))
(add-to-list 'load-path (locate-user-emacs-file "el-get"))
(require 'el-get)
(setq el-get-dir (locate-user-emacs-file ""))

;; Install package
(el-get-bundle auto-complete)
(el-get-bundle markdown-mode)
(el-get-bundle python-pep8)

;; Set key-bind
(define-key global-map "\C-x\C-b" 'electric-buffer-list)
(define-key global-map "\C-cr" 'replace-string)
(define-key global-map "\C-c8" 'pep8)
(define-key global-map "\C-cp" 'markdown-preview)

;; Don't create backup file
(setq make-backup-files nil)

;; Dockerfile
(setq auto-mode-alist (cons '("Dockerfile" . conf-mode) auto-mode-alist))
