;; Added by Package.el
(package-initialize)

;; Settings
(setq github-user ""
      github-pass "")
(when (eq system-type 'gnu/linux)
  (setq grip-program "~/.local/bin/grip")
  (setq marp-program "/usr/local/bin/marp")
  (setq google-chrome-program "/usr/bin/google-chrome")
  )

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
(el-get-bundle dockerfile-mode)
(el-get-bundle powershell)
(el-get-bundle yaml-mode)
(el-get-bundle terraform-mode)
(el-get-bundle go-mode)
(el-get-bundle protobuf-mode)

;; Decoration
(tool-bar-mode 0)
(load-theme 'tango-dark t)

;; Mode line
(line-number-mode t)
(column-number-mode t)

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
   '(helm-mini-default-sources '(
                                 helm-source-recentf
                                 helm-source-buffers-list
                                 helm-source-projectile-files-list
                                 helm-source-etags-select
                                 ))))

;; Python
(add-hook 'python-mode-hook 'flycheck-mode)

;; Ctags
(when (require 'ctags nil t)
  (setq tags-revert-without-query t)
  (setq ctags-command "ctags -Re --fields=\"+afikKlmnsSzt\" "))

;; Markdown
(defun markdown-grip-preview ()
  (interactive)
  (when (get-process "grip") (kill-process "grip"))
  (when (get-process "grip<1>") (kill-process "grip<1>"))
  (start-process "grip" "*grip*" grip-program (format "--user=%s" github-user) (format "--pass=%s" github-pass) "--browser" buffer-file-name)
  (when (get-process "grip") (set-process-query-on-exit-flag (get-process "grip") nil))
  (when (get-process "grip<1>") (set-process-query-on-exit-flag (get-process "grip<1>") nil))
  (message "Start grip")
  )
(defun markdown-marp-preview ()
  (interactive)
  (when (get-process "marp") (kill-process "marp"))
  (when (get-process "marp<1>") (kill-process "marp<1>"))
  (start-process "marp" "*marp*" marp-program "--server" (file-name-directory buffer-file-name))
  (when (get-process "marp") (set-process-query-on-exit-flag (get-process "marp") nil))
  (when (get-process "marp<1>") (set-process-query-on-exit-flag (get-process "marp<1>") nil))
  (message "Start marp")
  (sleep-for 1)
  (start-process "google-chrome" "*google-chrome*" google-chrome-program "http://localhost:8080")
  )

;; Go
(add-to-list 'auto-mode-alist '("go.mod" . go-mode))
(add-hook 'go-mode-hook
          (lambda ()
            (setq c-basic-offset 4)
            (setq tab-width 4)
            (setq indent-tabs-mode t)
            ))

;; Terminal
(defun bash ()
  (interactive)
  (term "/bin/bash")
  )
(add-hook 'term-mode-hook
          (lambda ()
            (term-set-escape-char ?\C-x)
            (define-key term-raw-map "\C-o" 'helm-mini)
            (define-key term-raw-map "\C-t" 'other-window)
            ))

;; Other
(defun kill-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

;; Define key
(define-key global-map (kbd "C-o") 'helm-mini)
(define-key global-map (kbd "C-t") 'other-window)
(define-key global-map (kbd "C-c r") 'replace-string)
(define-key global-map (kbd "C-c p") 'markdown-grip-preview)
(define-key global-map (kbd "C-c m") 'markdown-marp-preview)
(define-key global-map (kbd "C-c t") 'ctags-create-or-update-tags-table)
(define-key global-map (kbd "C-c k") 'kill-all-buffers)
(define-key global-map (kbd "<f5>") 'revert-buffer)
