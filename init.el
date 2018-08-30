;;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,

;; You may delete these explanatory comments.
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))
(package-initialize)

;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))


;; list the packages you want
(setq package-list '(google-c-style
                     autodisass-java-bytecode
                     smartparens
                     rainbow-delimiters
                     meghanada
                     bundler
                     goto-last-change
                     yasnippet
                     yasnippet-snippets
                     minitest
                     counsel
                     better-defaults
                     elpy
                     go-mode
                     undo-tree
                     auto-complete
                     magit
                     ag
                     web-mode
                     flycheck
                     projectile
                     projectile-rails
                     ))
;; install the missing packages
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
    (bundler goto-last-change ivy-yasnippet markdown-mode yaml-mode minitest undohist auto-complete magit flylisp ag smartparens web-mode ## flycheck projectile-rails projectile)))
 '(send-mail-function (quote mailclient-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; magit global key bindings
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)
;; org global key bindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)
;; set ident tab
(setq-default indent-tabs-mode nil)
(setq ruby-insert-encoding-magic-comment nil)

;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(setq web-mode-enable-current-column-highlight t)
(setq web-mode-css-indent-offset 2)
(setq web-mode-scss-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-auto-closing t)


(add-hook 'java-mode-hook
          (lambda ()
            ;; meghanada-mode on
            (google-set-c-style)
            (google-make-newline-indent)
            (meghanada-mode t)
            (flycheck-mode +1)
            (smartparens-mode t)
            (rainbow-delimiters-mode t)
            (highlight-symbol-mode t)
            (setq c-basic-offset 2)
            ;; use code format
            (add-hook 'before-save-hook 'meghanada-code-beautify-before-save)))
(cond
 ((eq system-type 'windows-nt)
  (setq meghanada-java-path (expand-file-name "bin/java.exe" (getenv "JAVA_HOME")))
  (setq meghanada-maven-path "mvn.cmd"))
 (t
  (setq meghanada-java-path "java")
  (setq meghanada-maven-path "mvn")))

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

;; python
(elpy-enable)

;; undo-tree
(global-undo-tree-mode)

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; yasnippet
(yas-global-mode 1)

(require 'ido)
(ido-mode t)

;;Ivy and Swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(setq ivy-count-format "(%d/%d) ")
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
(setq magit-completing-read-function 'ivy-completing-read)
(setq projectile-completion-system 'ivy)

(setq select-enable-clipboard t)

;; autoindent width
(setq indent-tabs-mode nil)
(setq c-basic-offset 2)
(setq js-indent-level 2)
(setq scss-indent-level 2)
(setq css-indent-offset 2)

(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying t    ; Don't delink hardlinks
      version-control t      ; Use version numbers on backups
      delete-old-versions t  ; Automatically delete excess backups
      kept-new-versions 20   ; how many of the newest versions to keep
      kept-old-versions 5    ; and how many of the old
      )
(put 'dired-find-alternate-file 'disabled nil)

(defun indent-buffer ()
  "Indent an entire buffer using the default intenting scheme."
  (interactive)
  (save-excursion
    (delete-trailing-whitespace)
    (indent-region (point-min) (point-max) nil)
    (untabify (point-min) (point-max))))
(global-set-key "\C-x\\" 'indent-buffer)
(global-set-key (kbd "C-c w") 'whitespace-mode)
(put 'set-goal-column 'disabled nil)

;; set flycheck for eslint
(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))

(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)

;; version of ivy-yank-word to yank from start of word
(defun bjm/ivy-yank-whole-word ()
  "Pull next word from buffer into search string."
  (interactive)
  (let (amend)
    (with-ivy-window
      ;;move to last word boundary
      (re-search-backward "\\b")
      (let ((pt (point))
            (le (line-end-position)))
        (forward-word 1)
        (if (> (point) le)
            (goto-char pt)
          (setq amend (buffer-substring-no-properties pt (point))))))
    (when amend
      (insert (replace-regexp-in-string "  +" " " amend)))))

;; bind it to M-j
(define-key ivy-minibuffer-map (kbd "M-j") 'bjm/ivy-yank-whole-word)

;;
(global-set-key (kbd "C-c ,") 'goto-last-change)
;;

(defun get-current-test-name ()
  (save-excursion
    (let ((pos)
          (test-name))
      (re-search-backward "test [\'\"]\\([^\"]+\\)[\'\"] do")
      (setq test-name (buffer-substring-no-properties (match-beginning 1) (match-end 1)))
      (concat "test_" (replace-regexp-in-string " " "_" test-name)))))


(defun run-test-current-file ()
  (interactive)
  (let ((root-dir (projectile-project-root)))
    (compile (format "%s/bin/rails test %s" root-dir (expand-file-name (buffer-file-name)) ))))

(defun run-test-at-point ()
  (interactive)
  (let ((root-dir (projectile-project-root)))
    (compile (format "%s/bin/rails test %s -n %s" root-dir (expand-file-name (buffer-file-name)) (get-current-test-name)))))

(define-key projectile-rails-mode-map (kbd "C-c r ,") 'run-test-at-point)
(define-key projectile-rails-mode-map (kbd "C-c r .") 'run-test-current-file)

;; color for compile mode
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region compilation-filter-start (point))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;; hide menu bar
(unless (display-graphic-p)
  (menu-bar-mode -1))
(add-hook 'java-mode-hook
          (lambda ()
            (define-key java-mode-map (kbkd "C-c r .") 'meghanada-exec-main)))

(provide 'init)
