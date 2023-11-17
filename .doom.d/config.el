;;  _
;; | | ___  ___ _ __ ___   __ _  ___ ___
;; | |/ _ \/ _ \ '_ ` _ \ / _` |/ __/ __|
;; | |  __/  __/ | | | | | (_| | (__\__ \
;; |_|\___|\___|_| |_| |_|\__,_|\___|___/
;;
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

(map! :leader
      "TAB" #'evil-switch-to-windows-last-buffer
      "b TAB" #'other-window
      "k" #'kill-buffer-and-window
      "r R" #'replace-string
      "r r" #'replace-string-in-region
      "r m" #'rainbow-mode
      "!" #'+default/diagnostics)

(map! "C-c o" #'switch-to-minibuffer
      "M-o" #'other-window
      "C-<backspace>" #'backward-delete-word
      "C-<delete>" #'delete-word)

(setq user-full-name "LEE"
      user-mail-address "lee@imre.al"
      confirm-kill-emacs nil
      display-line-numbers-type t
      ;; doom-theme 'kanagawa
      doom-theme 'doom-tomorrow-night
      doom-themes-enable-bold t
      doom-themes-enable-italic t
      doom-font (font-spec :family "PragmataPro Mono" :size 16)
      doom-themes-treemacs-enable-variable-pitch nil
      warning-minimum-level :error
      native-comp-async-report-warnings-errors nil
      org-hide-emphasis-markers t
      org-directory "~/sync/org")

(set-frame-parameter nil 'alpha-background 98)
(add-to-list 'default-frame-alist '(alpha-background . 98))

(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(default :background "#1D2122")
  '(treemacs-root-face ((t (:height 1.0)))))

(after! evil
  (evil-set-initial-state 'vterm-mode 'insert))

(after! vterm
  (setq vterm-shell "fish"
        vterm-toggle-hide-method nil))

(after! treemacs
  (setq treemacs-width 25))

(add-hook! 'rainbow-mode-hook (hl-line-mode (if rainbow-mode -1 +1)))

(with-eval-after-load 'typescript-mode (add-hook 'typescript-mode-hook #'lsp))

(defun delete-word (arg)
  "Delete word forwards."
  (interactive "p")
  (delete-region (point) (progn (forward-word arg) (point))))

(defun backward-delete-word (arg)
  "Delete word backwards."
  (interactive "p")
  (delete-word (- arg)))

(defun my/focus-new-client-frame ()
  (select-frame-set-input-focus (selected-frame)))

(add-hook 'server-after-make-frame-hook #'my/focus-new-client-frame)

(defun switch-to-minibuffer ()
  "Switch focus to minibuffer."
  (interactive)
  (if (active-minibuffer-window)
      (select-window (active-minibuffer-window))
    (error "No minibuffer")))

(defun vterm-in-directory (directory)
  "Open vterm in DIRECTORY. If vterm is already open, focus vterm."
  (interactive "DDirectory: ")
  (if (get-buffer "*vterm*")
      (progn
        (switch-to-buffer-other-window (get-buffer vterm-buffer-name))
        (vterm--goto-line -1))
    (cd directory)
    (add-to-list 'display-buffer-alist
       '("\*vterm\*"
         (display-buffer-in-side-window)
         (window-height . 0.1)
         (slide . bottom)
         (slot . 0)))
    (vterm-toggle-cd)))

(defun svelte-lsp ()
  (when (and (stringp buffer-file-name)
             (string-match "\\.svelte\\'" buffer-file-name))
    (lsp (current-buffer))))

(add-hook 'find-file-hook #'svelte-lsp)

(defun my/web-mode-hook ()
  (setq web-mode-indent-style 2
        web-mode-markup-indent-offset 4
        web-mode-code-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-script-padding 0
        web-mode-style-padding 0))

(add-hook 'web-mode-hook 'my/web-mode-hook)
