(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 ;; '(ansi-color-names-vector
 ;;   (vector "#eaeaea" "#d54e53" "#b9ca4a" "#e7c547" "#7aa6da" "#c397d8" "#70c0b1" "#424242"))
 ;; '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" default)))
 '(fci-rule-color "#424242")
 '(global-highlight-parentheses-mode t)
 '(hl-paren-background-colors (quote ("burlywood1")))
 '(hl-paren-colors (quote ("black")))
 '(hl-paren-delay 0)
 '(imenu-list-size 0.15)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(package-selected-packages
   (quote
    (company auto-compile auto-complete csharp-mode haskell-mode smart-mode-line)))
 '(show-paren-delay 0)
 '(vc-annotate-background nil)
 ;; '(vc-annotate-color-map
 ;;   (quote
 ;;    ((20 . "#d54e53")
 ;;     (40 . "#e78c45")
 ;;     (60 . "#e7c547")
 ;;     (80 . "#b9ca4a")
 ;;     (100 . "#70c0b1")
 ;;     (120 . "#7aa6da")
 ;;     (140 . "#c397d8")
 ;;     (160 . "#d54e53")
 ;;     (180 . "#e78c45")
 ;;     (200 . "#e7c547")
 ;;     (220 . "#b9ca4a")
 ;;     (240 . "#70c0b1")
 ;;     (260 . "#7aa6da")
 ;;     (280 . "#c397d8")
 ;;     (300 . "#d54e53")
 ;;     (320 . "#e78c45")
 ;;     (340 . "#e7c547")
 ;;     (360 . "#b9ca4a"))))
 '(vc-annotate-very-old-color nil))

(server-start)
;;(load-theme 'wombat)
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/lisp_lib/helm")
(add-to-list 'load-path "~/.emacs.d/lisp_lib/async")
(add-to-list 'load-path "~/.emacs.d/lisp_lib/highlight-parentheses")
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/lisp_lib/monokai")
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/lisp_lib/zenburn")
;;(add-to-list 'load-path "~/.emacs.d/lisp_lib/color-theme-sanityinc-tomorrow");
;;(add-to-list 'load-path "~/.emacs.d/lisp_lib/sr-speedbar")
;;(add-to-list 'load-path "~/.emacs.d/lisp_lib/Highlight-Indentation-for-Emacs")

;;(add-to-list 'load-path "~/.emacs.d/lisp_lib/imenu-list")
;; (require 'package)
;; (add-to-list 'package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
;;                                  ("marmalade" . "https://marmalade-repo.org/packages/")
;;                                  ("melpa-stable" . "https://stable.melpa.org/packages/"))
;;              (package-initialize))

(require 'helm-config)
;;(require 'sr-speedbar)
;;(require 'color-theme-sanityinc-tomorrow)
;;(require 'highlight-indentation)
(require 'async)

;; Highlight-indentation
;; (highlight-indentation-mode)
;; (highlight-indentation-current-column-mode)
;; (set-face-background 'highlight-indentation-face "#4d4f51")
;; (set-face-background 'highlight-indentation-current-column-face "white")
;; (set-face-font 'highlight-indentation-face "Arial")
;; (set-face-attribute 'highlight-indentation-face nil :height 55)
;; (add-hook 'python-mode-hook 'highlight-indentation-mode)
;;                                         ;(add-hook 'python-mode-hook 'highlight-indentation-current-column-mode)
;; (add-hook 'c-mode-hook 'highlight-indentation-mode)
;;                                         ;(add-hook 'c-mode-hook 'highlight-indentation-current-column-mode)
;; (add-hook 'c++-mode-hook 'highlight-indentation-mode)
;;                                         ;(add-hook 'c++-mode-hook 'highlight-indentation-current-column-mode)
;; (add-hook 'java-mode-hook 'highlight-indentation-mode)
;;                                         ;(add-hook 'java-mode-hook 'highlight-indentation-current-column-mode)
;; (add-hook 'js2-mode-hook 'highlight-indentation-mode)

;;                                         ;(add-hook 'js2-mode-hook 'highlight-indentation-current-column-mode)

;; Helm-mode
(helm-mode 1)
(global-set-key (kbd "C-'") 'helm-semantic-or-imenu)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
                                        ;(global-set-key (kbd "C-s") 'helm-occur)
(global-set-key (kbd "M-x") 'helm-M-x)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
(setq helm-split-window-in-side-p t)
(setq helm-semantic-fuzzy-match t helm-imenu-fuzzymatch t)
(semantic-mode 1)
(with-eval-after-load 'helm-semantic
  (push '(c-mode . semantic-format-tag-summarize) helm-semantic-display-style)
  (push '(c++-mode . semantic-format-tag-summarize) helm-semantic-display-style))



;; Random crap
(setq ring-bell-function 'ignore)
(setq-default indent-tabs-mode nil) ; tabs to spaces
;; (add-hook 'python-mode-hook
;;           (lambda () (setq python-indent-offset 4)))
(add-hook 'html-mode-hook
          (lambda ()
            ;; Default indentation is usually 2 spaces, changing to 4.
            (set (make-local-variable 'sgml-basic-offset) 4)))
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq scroll-step 1)
(setq undo-limit 20000000)
(setq undo-strong-limit 40000000)
(setq inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode)
(setq inhibit-default-init t)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq tab-always-indent 'complete)

;; {
;; }   instead of: function() {
;;                 }
(setq c-default-style "linux"
      c-basic-offset 4)


;; Menu
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(fringe-mode '(0 . 0))
(global-visual-line-mode t)
(split-window-horizontally)
(ido-mode) ; emacs on steroids
(setq column-number-mode t)

;; Code style
(require 'paren)
(setq show-paren-delay 0)
;;(set-face-background 'show-paren-match "#ff9028")
;;(set-face-foreground 'show-paren-match "black")
;;(set-face-attribute 'show-paren-match nil)
(require 'highlight-parentheses)
(global-highlight-parentheses-mode t)
(show-paren-mode 0) ; highlight parenthesis
;;(setq hl-paren-background-colors '("burlywood1")) ;; at top of file
;;(setq hl-paren-colors '("black")) ;; at top of file

;; Comment format
(defun insert-doc-comment () (interactive)
       (insert "\t/*  */"))
(define-key global-map [(S-f1)] 'insert-doc-comment)
(defun insert-doc-comment2 () (interactive)
       (insert "\t/**\n\t * \n\t * @param \n\t * @return \n\t */"))
(define-key global-map [(S-f2)] 'insert-doc-comment2)
(defun insert-doc-comment3 () (interactive)
       (insert "\t/**\n\t * \n\t * @param \n\t * @return \n\t * @exception \n\t */"))
(define-key global-map [(S-f3)] 'insert-doc-comment3)

;; Mode line moved to top of screen
(setq-default header-line-format mode-line-format)
(setq-default mode-line-format nil)
(setq sml/no-confirm-load-theme t)
(setq sml/theme nil)
(sml/setup) ; smart-mode-line

;; Color and cursor
;;(load-theme 'monokai t)
;;(load-theme 'zenburn t)
;;(color-theme-sanityinc-tomorrow-night)
(add-to-list 'default-frame-alist '(foreground-color . "#8B8B8B"))
(add-to-list 'default-frame-alist '(background-color . "#303030"))
(set-face-attribute 'font-lock-comment-face nil :foreground "#379935")
(set-face-attribute 'font-lock-string-face nil :foreground "#8B8B8B")
(set-face-attribute 'font-lock-constant-face nil :foreground "#8B8B8B")
(set-face-attribute 'font-lock-keyword-face nil :foreground "#8B8B8B")
(set-face-attribute 'font-lock-builtin-face nil :foreground "#8B8B8B")
(set-face-attribute 'font-lock-type-face nil :foreground "#8B8B8B")
(set-face-attribute 'font-lock-function-name-face nil
                    :foreground "#8B8B8B")
(set-face-attribute 'font-lock-variable-name-face nil
                    :foreground "#8B8B8B")
                                        ;(global-hl-line-mode 1)
;; (set-face-foreground 'header-line "black")
;; (set-face-background 'header-line "NavajoWhite2")
;; (set-face-bold-p 'bold nil)
;; (set-foreground-color "DeepSkyBlue2") ; Text
;; (set-cursor-color "orange")
(add-to-list 'default-frame-alist '(cursor-color . "orange"))
;; (set-face-attribute 'default nil :height 110)
;; (set-face-attribute 'region nil :background "brown" :foreground "white")
;; (set-face-attribute 'hl-line nil :background "gray11" :underline nil)
;;(set-face-foreground 'highlight nil)
(blink-cursor-mode 0)
(delete-selection-mode 1)
(transient-mark-mode 0)


;; Bright-red TODOs Green NOTEs and specific KEY words
(setq fixme-modes '(c++-mode c-mode emacs-lisp-mode java-mode python-mode))
(make-face 'font-lock-fixme-face)
(make-face 'font-lock-note-face)
(make-face 'font-lock-jasper-face)
(make-face 'font-lock-jeng-face)
(mapc (lambda (mode)
        (font-lock-add-keywords
         mode
         '(("\\<\\(TODO\\)" 1 'font-lock-fixme-face t)
           ("\\<\\(NOTE\\)" 1 'font-lock-note-face t)
           ("\\<\\(JASPER\\)" 1 'font-lock-jasper-face t)
           ("\\<\\(JENG\\)" 1 'font-lock-jeng-face t))))
      fixme-modes)
(modify-face 'font-lock-fixme-face "White" "Red" nil t nil t nil nil)
(modify-face 'font-lock-note-face "Pink" "Black" nil t nil t nil nil)
(modify-face 'font-lock-jasper-face "Red" "White" nil t nil t nil nil)
(modify-face 'font-lock-jeng-face "Red" "White" nil t nil t nil nil)

;; Syntax
;; (add-to-list 'default-frame-alist '(font . "Source Code Pro-10"))
;; (set-face-attribute 'default t :font "Source Code Pro-10")
;; Fonts: Source Code Pro, Bitstream Vera Sans Mono, Consolas, mononoki
(add-to-list 'default-frame-alist '(font . "Consolas-11"))
(set-face-attribute 'default t :font "Consolas-11")

;; (set-face-attribute 'font-lock-builtin-face nil :bold nil :foreground "#5FD7FF")
;; (set-face-attribute 'font-lock-comment-face nil :bold nil :foreground "white")
;; (set-face-attribute 'font-lock-constant-face nil :bold nil :foreground "white")
;; (set-face-attribute 'font-lock-doc-face nil :bold nil :foreground "#AD7FA8")
;; (set-face-attribute 'font-lock-function-name-face nil :bold nil :foreground "burlywood2")
;; (set-face-attribute 'font-lock-keyword-face nil :bold nil :foreground "#FF9028")
;; (set-face-attribute 'font-lock-string-face nil :bold nil :foreground "#AD7FA8")
;; (set-face-attribute 'font-lock-type-face nil :bold nil :foreground "#86FFAF")
;; (set-face-attribute 'font-lock-variable-name-face nil :bold nil :foreground "burlywood2")


;; Window  and other key-bindings
(setq x-select-enable-clipboard t) ; emacs->system clipboard, vice versa
(setq-default frame-title-format "%b (%f)") ; buffer and file name window title
(global-set-key [C-S-tab] 'other-window)
(global-set-key [(control tab)] 'prev-window)
(defun prev-window ()
  (interactive)
  (other-window -1))

(global-set-key (kbd "<f5>")         'compile)
(setq compilation-read-command nil)
(global-set-key (kbd "<f6>")         'first-error)
(global-set-key (kbd "<f7>")         'previous-error)
(global-set-key (kbd "<f8>")         'next-error)


(global-set-key (kbd "<C-M-up>")         'next-buffer)
(global-set-key (kbd "<C-M-down>")       'previous-buffer)
(global-set-key (kbd "C-1")              'recenter)
(global-set-key (kbd "C-/")              'comment-region)
(global-set-key (kbd "C-?")              'uncomment-region)
(global-set-key (kbd "C-z")              'undo)
(global-set-key (kbd "<M-up>")  (lambda () (interactive) (scroll-down 3 )))
(global-set-key (kbd "<M-down>")  (lambda () (interactive) (scroll-up 3 )))
(global-set-key (kbd "M-p")  (lambda () (interactive) (scroll-down 3 )))
(global-set-key (kbd "M-n")  (lambda () (interactive) (scroll-up 3 )))
(global-unset-key (kbd "C-x C-z")) ; remove suspend key

(defun prev-line-4 ()
  (interactive)
  (previous-line)
  (previous-line)
  (previous-line)
  )
(defun next-line-4 ()
  (interactive)
  (next-line)
  (next-line)
  (next-line)
  )

;; Smooth scrolling
(setq scroll-conservatively 10000
      scroll-preserve-screen-position 1)

(global-set-key (kbd "<C-up>") (lambda () (interactive) (previous-line 4)))
(global-set-key (kbd "<C-down>") (lambda () (interactive) (next-line 4)))

(defun indent-buffer ()
  "Indents an entire buffer using the default intenting scheme."
  (interactive)
  (save-excursion (delete-trailing-whitespace)
                  (indent-region (point-min) (point-max) nil)
                  (untabify (point-min) (point-max))))
(global-set-key (kbd "C-2") 'indent-buffer)

;; Used for my-backward-delete-word
(defun my-delete-word (arg)
  (interactive "p")
  (delete-region (point) (progn (forward-word arg) (point))))

;; Requires my-delete-word
(defun my-backward-delete-word (arg)
  (interactive "p")
  (my-delete-word (- arg)))

(global-set-key (kbd "<C-backspace>") 'my-backward-delete-word)

;; Store autosave files into temp directory
(setq backup-directory-alist `(("." . "C:/Users/JJ/Saves")))
(setq backup-by-copying t)

;; Start up files
(find-file "C:/Users/JJ/EmacsKeyBindings")
(find-file "~/.emacs")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(show-paren-match ((t nil))))
