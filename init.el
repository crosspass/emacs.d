;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,

;; You may delete these explanatory comments.
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))
(package-initialize)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  '(package-selected-packages
     (quote
       (dracula-theme flylisp ag smartparens web-mode ## flycheck projectile-rails projectile evil))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  )

; (add-to-list 'load-path "~/.emacs.d/evil")
; (require 'evil)
; (evil-mode t)
; ;; The following snippet will make Evil treat an Emacs symbol as a word.
; (with-eval-after-load 'evil
;                       (defalias #'forward-evil-word #'forward-evil-symbol))



(setq-default indent-tabs-mode nil)
(setq ruby-insert-encoding-magic-comment nil)


;; Use projectile-rails as global mode

(add-to-list 'load-path "~/.emacs.d/web-mode")
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))


;; Use projectile as global mode
(add-to-list 'load-path "~/.emacs.d/projectile")
(projectile-global-mode)

;; Use projectile-rails as global mode
;; You can use Projectile's commands for greping (or acking) files, run tests, switch between projects, etc
(add-to-list 'load-path "~/.emacs.d/projectile-rails")
(projectile-rails-global-mode)

;; Smartparens is a minor mode for dealing with pairs in Emacs.
;; https://github.com/Fuco1/smartparens
(add-to-list 'load-path "~/.emacs.d/smartparens")
(require 'smartparens-config)

(add-to-list 'load-path "~/.emacs.d/flycheck")
(add-hook 'after-init-hook #'global-flycheck-mode)

(require 'ido)
(ido-mode t)

(setq x-select-enable-clipboard t)

;; autoindent width
(setq indent-tabs-mode nil)
(setq c-basic-offset 2)
(setq js-indent-level 2)
(setq scss-indent-level 2)
(setq css-indent-offset 2)

(setq web-mode-css-indent-offset 2)
(setq web-mode-scss-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-auto-closing t)

(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying t    ; Don't delink hardlinks
      version-control t      ; Use version numbers on backups
      delete-old-versions t  ; Automatically delete excess backups
      kept-new-versions 20   ; how many of the newest versions to keep
      kept-old-versions 5    ; and how many of the old
      )
(put 'dired-find-alternate-file 'disabled nil)
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;;(load-theme 'dracula t)

