;; Settings
(setq github-user ""
      github-pass "")
(when (eq system-type 'gnu/linux)
  (setq grip-program "/usr/local/bin/grip"
	flake8-program "/usr/local/bin/flake8"))

;; El-get
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))
(add-to-list 'load-path (locate-user-emacs-file "el-get"))
(require 'el-get)
(setq el-get-dir (locate-user-emacs-file "elisp"))

;; Install package
(el-get-bundle auto-complete)
(el-get-bundle ctags)
(el-get-bundle helm)
(el-get-bundle helm-projectile)
(el-get-bundle helm-etags-plus)
(el-get-bundle markdown-mode)
(el-get-bundle scala-mode)
(el-get-bundle dockerfile-mode)
(el-get-bundle powershell)
(el-get-bundle yaml-mode)
(el-get-bundle terraform-mode)

;; Decoration
(tool-bar-mode 0)
(load-theme 'tango-dark t)

;; About backup and auto-save
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Helm
(when (and (require 'helm-projectile)
	   (require 'helm-etags+))
  (custom-set-variables
   '(helm-mini-default-sources '(helm-source-buffers-list
				 helm-source-recentf
				 helm-source-projectile-files-list
				 helm-source-etags-select))))

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
      (list flake8-program (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
	       '("\\.py\\'" flymake-flake8-init)))
(defun flymake-show-help ()
  (when (get-char-property (point) 'flymake-overlay)
    (let ((help (get-char-property (point) 'help-echo)))
      (if help (message "%s" help)))))
(add-hook 'post-command-hook 'flymake-show-help)

;; Ctags
(when (require 'ctags nil t)
  (setq tags-revert-without-query t)
  (setq ctags-command "ctags -Re --fields=\"+afikKlmnsSzt\" "))

;; Markdown
(defun my-markdown-preview ()
  (interactive)
  (when (get-process "grip") (kill-process "grip"))
  (when (get-process "grip<1>") (kill-process "grip<1>"))
  (start-process "grip" "*grip*" grip-program (format "--user=%s" github-user) (format "--pass=%s" github-pass) "--browser" buffer-file-name)
  (when (get-process "grip") (set-process-query-on-exit-flag (get-process "grip") nil))
  (when (get-process "grip<1>") (set-process-query-on-exit-flag (get-process "grip<1>") nil))
  )

;; Org-mode
(require 'ox-latex)
(setq org-latex-with-hyperref nil)
(setq org-latex-default-class "jsarticle")
(setq org-latex-pdf-process
      '("platex %f"
	"platex %f"
	"xdvipdfmx %b.dvi"))
(add-to-list 'org-latex-classes
	     '("jsarticle"
	       "\\documentclass[11pt,a4paper]{jsarticle}
                [NO-PACKAGES]
                [NO-DEFAULT-PACKAGES]"
	       ("\\section{%s}" . "\\section*{%s}")
	       ("\\subsection{%s}" . "\\subsection*{%s}")
	       ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	       ("\\paragraph{%s}" . "\\paragraph*{%s}")
	       ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; Define key
(define-key global-map (kbd "C-c r") 'replace-string)
(define-key global-map (kbd "C-c p") 'my-markdown-preview)
(define-key global-map (kbd "C-c h") 'helm-mini)
(define-key global-map (kbd "C-c s") 'rgrep)
(define-key global-map (kbd "C-c t") 'ctags-create-or-update-tags-table)
(define-key global-map (kbd "C-t") 'other-window)
(define-key global-map (kbd "<f5>") 'revert-buffer)
