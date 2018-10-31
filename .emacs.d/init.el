;; Added by Package.el
(package-initialize)

;; Settings
(setq github-user ""
      github-pass "")
(when (eq system-type 'gnu/linux)
  (setq grip-program "~/.local/bin/grip"))

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
(el-get-bundle flycheck)
(el-get-bundle markdown-mode)
(el-get-bundle scala-mode)
(el-get-bundle dockerfile-mode)
(el-get-bundle powershell)
(el-get-bundle yaml-mode)
(el-get-bundle terraform-mode)
(el-get-bundle go-mode)
(el-get-bundle adoc-mode)

;; Decoration
(tool-bar-mode 0)
(load-theme 'tango-dark t)

;; About backup and auto-save
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Tab
(setq-default tab-width 4 indent-tabs-mode nil)

;; Helm
(when (and (require 'helm-projectile)
           (require 'helm-etags-plus))
  (custom-set-variables
   '(helm-mini-default-sources '(helm-source-buffers-list
                                 helm-source-projectile-files-list
                                 helm-source-etags-select
                                 helm-source-recentf))))

;; Python
(add-hook 'python-mode-hook 'flycheck-mode)

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

;; Org
(when (require 'ox-latex nil t)
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
  )


;; Go
(add-hook 'go-mode-hook
          (lambda ()
            (setq c-basic-offset 4)
            (setq tab-width 4)
            (setq indent-tabs-mode t)
            ))

;; Asciidoc
(add-to-list 'auto-mode-alist '("\\.asc\\'" . adoc-mode))
(add-to-list 'auto-mode-alist '("\\.adoc\\'" . adoc-mode))
(add-hook 'adoc-mode-hook
          (lambda ()
            (custom-set-faces
             '(markup-complex-replacement-face ((t (:inherit markup-meta-face :foreground "plum1" :box (:line-width 2 :style released-button)))))
             '(markup-list-face ((t (:inherit markup-meta-face :foreground "plum1"))))
             '(markup-meta-face ((t (:stipple nil :foreground "color-248" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil
                                              :slant normal :weight normal :height 90 :width normal :foundry "unknown" :family "Monospace"))))
             '(markup-meta-hide-face ((t (:inherit markup-meta-face :height 0.8))))
             '(markup-table-face ((t (:inherit markup-meta-face :foreground "dodger blue"))))
             '(markup-verbatim-face ((t nil))))
            ))

;; *.env
(add-to-list 'auto-mode-alist '("\\.env\\'" . shell-script-mode))

;; Define key
(define-key global-map (kbd "C-o") 'helm-mini)
(define-key global-map (kbd "C-t") 'other-window)
(define-key global-map (kbd "C-c r") 'replace-string)
(define-key global-map (kbd "C-c p") 'my-markdown-preview)
(define-key global-map (kbd "C-c t") 'ctags-create-or-update-tags-table)
(define-key global-map (kbd "<f5>") 'revert-buffer)