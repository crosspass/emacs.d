;;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,

; You may delete these explanatory comments.
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))
(package-initialize)

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; list the packages you want
(setq package-list '(better-defaults
                     undo-tree
                     auto-complete
                     magit
                     ag
                     web-mode
                     flycheck
                     projectile
                     projectile-rails))
; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (undohist auto-complete magit flylisp ag smartparens web-mode ## flycheck projectile-rails projectile))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq-default indent-tabs-mode nil)
(setq ruby-insert-encoding-magic-comment nil)


;; Use projectile-rails as global mode

;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))


;; Use projectile as global mode
;; projectile
(projectile-mode)

;; Use projectile-rails as global mode
;; You can use Projectile's commands for greping (or acking) files, run tests, switch between projects, etc
;; projectile-rails
(projectile-rails-global-mode)
;; dirty fix for having AC everywhere
(define-globalized-minor-mode real-global-auto-complete-mode
                              auto-complete-mode (lambda ()
                                                   (if (not (minibufferp (current-buffer)))
                                                     (auto-complete-mode 1))
                                                   ))
(real-global-auto-complete-mode t)
;; ruby fold
(add-hook 'ruby-mode-hook
          (lambda () (hs-minor-mode)))
(eval-after-load "hideshow"
                 '(add-to-list 'hs-special-modes-alist
                               `(ruby-mode
                                  ,(rx (or "def" "class" "module" "do" "{" "[")) ; Block start
                                  ,(rx (or "}" "]" "end"))                       ; Block end
                                  ,(rx (or "#" "=begin"))                        ; Comment start
                                  ruby-forward-sexp nil)))

(global-set-key (kbd "C-c h") 'hs-hide-block)
(global-set-key (kbd "C-c s") 'hs-show-block)

;; Smartparens is a minor mode for dealing with pairs in Emacs.
;; https://github.com/Fuco1/smartparens
;; (add-to-list 'load-path "~/.emacs.d/smartparens")
;; (require 'smartparens-config)

;; undo-tree
(global-undo-tree-mode)

;; flycheck
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
