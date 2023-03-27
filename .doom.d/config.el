;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(server-start)

(setq user-full-name "LEE"
      user-mail-address "lee@imre.al")

(setq display-line-numbers-type t)

(setq org-directory "~/org/")

(setq doom-font (font-spec :family "PragmataPro Mono" :size 19))

(setq confirm-kill-emacs nil)
(setq doom-themes-treemacs-enable-variable-pitch nil)
;; (setq doom-theme 'doom-tomorrow-night)
(setq doom-theme 'doom-gruvbox)

(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

(after! org
  (setq org-hide-emphasis-markers t))

(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(default :background "#1D2122"))

;; vterm
(setq vterm-shell "fish")
(setq vterm-toggle-hide-method nil)

(setq buffer-cd (if buffer-file-name (file-name-directory buffer-file-name) default-directory)) ;; directory of file in current buffer

(defun vterm-in-directory (directory)
  "Open vterm in DIRECTORY. Primarily for use with emacsclient."
  (interactive "Directory: ")
  (cd directory)
  (vterm-toggle-cd))

;; control + delete/backspace whole word
(defun delete-word (arg)
  (interactive "p")
  (delete-region (point) (progn (forward-word arg) (point))))

(defun backward-delete-word (arg)
  (interactive "p")
  (delete-word (- arg)))

(global-set-key (kbd "C-<backspace>") 'backward-delete-word)
(global-set-key (kbd "C-<delete>") 'delete-word)

(defun my/focus-new-client-frame ()
       (select-frame-set-input-focus (selected-frame)))
(add-hook 'server-after-make-frame-hook #'my/focus-new-client-frame)

;; 'C-c o' switch to minibuffer
(defun switch-to-minibuffer ()
  "Switch to minibuffer window."
  (interactive)
  (if (active-minibuffer-window)
      (select-window (active-minibuffer-window))
    (error "No minibuffer")))

(global-set-key (kbd "C-c o") 'switch-to-minibuffer)
(global-set-key (kbd "M-o") 'other-window)

(map! :leader
      "k" #'kill-buffer-and-window)

(map! "C-c C-r" #'replace-string)

(add-hook! 'rainbow-mode-hook (hl-line-mode (if rainbow-mode -1 +1)))

(with-eval-after-load 'typescript-mode (add-hook 'typescript-mode-hook #'lsp))
