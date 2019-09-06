;;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,

;; You may delete these explanatory comments.
;;; code:
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))
(package-initialize)

;; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;; list the packages you want
(setq package-list '(xterm-color
                     afternoon-theme
                     exec-path-from-shell
                     rspec-mode
                     mmm-mode
                     ssass-mode
                     google-c-style
                     ;; autodisass-java-bytecode
                     smartparens
                     ;; rainbow-delimiters
                     ;; el-get
                     ;; meghanada
                     rjsx-mode
                     bundler
                     goto-last-change
                     yasnippet
                     yasnippet-snippets
                     ;; minitest
                     counsel
                     better-defaults
                     elpy
                     go-mode
                     undo-tree
                     auto-complete
                     go-autocomplete
                     go-eldoc
                     go-errcheck
                     go-add-tags
                     magit
                     ag
                     web-mode
                     flycheck
                     projectile
                     projectile-rails
                     yaml-mode
                     markdown-mode
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
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(custom-safe-themes
   (quote
    ("3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "2540689fd0bc5d74c4682764ff6c94057ba8061a98be5dd21116bf7bf301acfb" "2df493c5c7f329eef362290abdcd42a45abad98ffe33f639ecc55af084224e8b" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "73c69e346ec1cb3d1508c2447f6518a6e582851792a8c0e57a22d6b9948071b4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default)))
 '(debug-on-error t)
 '(package-selected-packages
   (quote
    (eslint-fix rjsx-mode rubocop bison-mode go-add-tags google-c-style ssass-mode mmm-mode exec-path-from-shell sublime-themes afternoon-theme solarized-theme toml-mode go-eldoc golint vue-html-mode rspec-mode bundler goto-last-change ivy-yasnippet markdown-mode yaml-mode minitest undohist auto-complete magit flylisp ag smartparens web-mode ## flycheck projectile-rails projectile)))
 '(safe-local-variable-values (quote ((whitespace-line-column . 80))))
 '(send-mail-function (quote mailclient-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'afternoon)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

;; magit global key bindings
(global-set-key (kbd "C-x g") 'magit-status)
;; (global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)
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
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))

(setq web-mode-enable-current-column-highlight t)
(setq web-mode-css-indent-offset 2)
(setq web-mode-scss-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-auto-closing t)

;; JS configure
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; (add-hook 'java-mode-hook
;;           (lambda ()
;;             ;; meghanada-mode on
;;             (google-set-c-style)
;;             (google-make-newline-indent)
;;             (meghanada-mode t)
;;             (flycheck-mode +1)
;;             (smartparens-mode t)
;;             (rainbow-delimiters-mode t)
;;             (highlight-symbol-mode t)
;;             (setq c-basic-offset 2)
;;             ;; use code format
;;             (add-hook 'before-save-hook 'meghanada-code-beautify-before-save)))
;; (cond
;;  ((eq system-type 'windows-nt)
;;   (setq meghanada-java-path (expand-file-name "bin/java.exe" (getenv "JAVA_HOME")))
;;   (setq meghanada-maven-path "mvn.cmd"))
;;  (t
;;   (setq meghanada-java-path "java")
;;   (setq meghanada-maven-path "mvn")))

;; Use projectile as global mode
;; projectile
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

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
(require 'smartparens-config)
smartparens-global-mode

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
(global-set-key (kbd "C-c .") 'goto-last-change)
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
;; (require 'ansi-color)
;; (defun colorize-compilation-buffer ()
;;   (toggle-read-only)
;;   (ansi-color-apply-on-region compilation-filter-start (point))
;;   (toggle-read-only))
;; (add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;; (add-hook 'java-mode-hook
;;           (lambda ()
;;             (define-key java-mode-map (kbkd "C-c r .") 'meghanada-exec-main)))
(setq comint-output-filter-functions
      (remove 'ansi-color-process-output comint-output-filter-functions))

(add-hook 'shell-mode-hook
          (lambda () (add-hook 'comint-preoutput-filter-functions 'xterm-color-filter nil t)))

;; Also set TERM accordingly (xterm-256color)

;; You can also use it with eshell (and thus get color output from system ls):

(require 'eshell)

(add-hook 'eshell-before-prompt-hook
          (lambda ()
            (setq xterm-color-preserve-properties t)))

(add-to-list 'eshell-preoutput-filter-functions 'xterm-color-filter)
(setq eshell-output-filter-functions (remove 'eshell-handle-ansi-color eshell-output-filter-functions))
;;  Don't forget to setenv TERM xterm-256color
(setq compilation-environment '("TERM=xterm-256color"))
(add-hook 'compilation-start-hook
          (lambda (proc)
            ;; We need to differentiate between compilation-mode buffers
            ;; and running as part of comint (which at this point we assume
            ;; has been configured separately for xterm-color)
            (when (eq (process-filter proc) 'compilation-filter)
              ;; This is a process associated with a compilation-mode buffer.
              ;; We may call `xterm-color-filter' before its own filter function.
              (set-process-filter
               proc
               (lambda (proc string)
                 (funcall 'compilation-filter proc
                          (xterm-color-filter string)))))))

(require 'rspec-mode)
(eval-after-load 'rspec-mode
  '(rspec-install-snippets))

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(require 'go-autocomplete)
(require 'auto-complete-config)
(add-hook 'go-mode-hook 'go-eldoc-setup)
(ac-config-default)

(if (display-graphic-p)
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1)
      (menu-bar-mode -1)))

(when (eq system-type 'darwin)

  ;; default Latin font (e.g. Consolas)
  (set-face-attribute 'default nil :family "Monaco")

  ;; default font size (point * 10)
  ;;
  ;; WARNING!  Depending on the default font,
  ;; if the size is not supported very well, the frame will be clipped
  ;; so that the beginning of the buffer may not be visible correctly.
  (set-face-attribute 'default nil :height 150)

  ;; use specific font for Korean charset.
  ;; if you want to use different font size for specific charset,
  ;; add :size POINT-SIZE in the font-spec.
  ;; (set-fontset-font t 'hangul (font-spec :name "NanumGothicCoding"))

  ;; you may want to add different for other charset in this way.
  )

(provide 'init)
;;;
(put 'narrow-to-region 'disabled nil)
