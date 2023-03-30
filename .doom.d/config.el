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
      "k" #'kill-buffer-and-window
      "r s" #'replace-string
      "r r" #'replace-string-in-region
      "!" #'+default/diagnostics)

(map! "C-c o" #'switch-to-minibuffer
      "M-o" #'other-window
      "C-<backspace>" #'backward-delete-word
      "C-<delete>" #'delete-word)

(setq user-full-name "LEE"
      user-mail-address "lee@imre.al"
      confirm-kill-emacs nil
      display-line-numbers-type t)

(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(default :background "#1D2122"))

(after! doom-themes
  (setq doom-theme 'doom-gruvbox
        doom-themes-enable-bold t
        doom-themes-enable-italic t
        doom-font (font-spec :family "PragmataPro Mono" :size 19)))

(after! evil
  (evil-set-initial-state 'vterm-mode 'insert))

(after! org
  (setq org-hide-emphasis-markers t
        org-directory "~/org/"))

(after! vterm
  (setq vterm-shell "fish"
        vterm-toggle-hide-method nil))

(after! treemacs
  (setq doom-themes-treemacs-enable-variable-pitch nil
        treemacs-width 25))

(custom-set-faces
 '(treemacs-root-face ((t (:height 1.0)))))

(add-hook! 'rainbow-mode-hook (hl-line-mode (if rainbow-mode -1 +1)))

(with-eval-after-load 'typescript-mode (add-hook 'typescript-mode-hook #'lsp))

;; control + delete/backspace whole word
(defun delete-word (arg)
  (interactive "p")
  (delete-region (point) (progn (forward-word arg) (point))))

(defun backward-delete-word (arg)
  (interactive "p")
  (delete-word (- arg)))

(defun my/focus-new-client-frame ()
       (select-frame-set-input-focus (selected-frame)))

(add-hook 'server-after-make-frame-hook #'my/focus-new-client-frame)

(defun switch-to-minibuffer ()
  "Switch to minibuffer window."
  (interactive)
  (if (active-minibuffer-window)
      (select-window (active-minibuffer-window))
    (error "No minibuffer")))

(defun vterm-in-directory (directory)
  "Open vterm in DIRECTORY. If vterm is already open, CD into DIRECTORY."
  (interactive "DDirectory: ")
  (if (get-buffer "*vterm*")
      (progn
        (switch-to-buffer-other-window (get-buffer vterm-buffer-name))
        (vterm--goto-line -1))
        ;; (vterm-send "C-c")
        ;; (run-at-time "0.1 sec" nil (lexical-let ((dir directory))
        ;;                              (lambda ()
        ;;                                (vterm-send-string (concat "cd " dir))
        ;;                                (vterm-send-return)))))
    (cd directory)
    (add-to-list 'display-buffer-list
       '("\*vterm\*"
         (display-buffer-in-side-window)
         (window-height . 0.1)
         (slide . bottom)
         (slot . 0)))
    (vterm-toggle-cd)))
