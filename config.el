;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Ankit Sharma"
    user-mail-address "nez.dev@icloud.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Source Code Pro" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-tomorrow-night)
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;; (load-theme 'jetbrains-darcula 't)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org/")
(setq org-agenda-files '("~/Dropbox/org/todo.org"
                         "~/Dropbox/org/gtd.org"
                         "~/Dropbox/org/inbox.org"
                         "~/Dropbox/org/notes.org"
                         "~/Dropbox/org/someday.org"
                         "~/Dropbox/org/otherbrain.org"))

;; org agenda groups
org-super-agenda-groups '((:name "Today"
                                  :time-grid t
                                  :scheduled today
                           (:name "Due today"
                                  :deadline today)
                           (:name "Important"
                                  :priority "A")
                           (:name "Overdue"
                                  :deadline past)
                           (:name "Due soon"
                                  :deadline future)
                           (:name "Big Outcomes"
                                  :tag "bo")))

;; org todo keywords faces


;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

;; Here goes my configuration
;; modeline
;; customization of all the packages
;; (require 'doom-modeline)
;; (doom-modeline-mode 1)
(require 'package)
(setq  package-enable-at-startup nil)
(package-initialize)
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))
(setq doom-modeline-height 25
      +doom-modeline-buffer-file-name-style 'relative-from-project
      +doom-modeline-buffer-state-icon t
      +doom-modeline-buffer-modification-icon t
      +doom-modeline-lsp t
      +doom-modeline-icon (display-graphic-p)
      +doom-modeline-bar-width 3
      +doom-modeline-major-mode-color-icon t
      +doom-modeline-major-mode-icon t
      +doom-modeline-minor-modes nil
      +doom-modeline-number-limit 99
      +doom-modeline-vcs-max-length 12
      +doom-modeline-irc t
      +doom-modeline-env-version t
      +doom-modeline-nyan-mode t
      +doom-modeline-ace-window t
      +doom-modeline-battery t)

;; nyan mode
(setq nyan-mode t)

;; which key setup
(setq  which-key-idle-delay 0.5)

;; maximised screen on startup
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; avy goto character
(global-set-key (kbd "M-q") 'avy-goto-char)

;; text scaling
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; tabs
(use-package centaur-tabs
 :demand
 :hook
 (treemacs-mode . centaur-tabs-local-mode)
 (dashboard-mode . centaur-tabs-local-mode)
 :config
 (centaur-tabs-mode t)
 (setq centaur-tabs-gray-out-icons 'buffer)
 (setq centaur-tabs-set-bar 'left)
 (setq centaur-tabs-height 30)
 (setq centaur-tabs-set-icons t)
 :bind
 ("C-S-<tab>" . centaur-tabs-backward)
 ("C-<tab>" . centaur-tabs-forward))


;; focus auto save mode
(require 'focus-autosave-mode)
(focus-autosave-mode t)

;; wakatime
;; (setq global-wakatime-mode t)
;; (setq wakatime-api-key "3fc3ab4a-204d-4ac0-bad0-79c75a802916")

;; treat treemacs as other window to use C-x o
(after! (:and treemacs ace-window)
  (setq aw-ignored-buffers (delq 'treemacs-mode aw-ignored-buffers)))
(global-set-key (kbd "C-x w") 'ace-window)
;; Keybindings
;;
;;ivy find file default key combination

;; store links from mac
(global-set-key (kbd "C-c y") 'org-mac-grab-link)

;; heml-recentf
(global-set-key (kbd "C-x C-r") 'helm-recentf)

;; counsel iBuffer
(global-set-key (kbd "C-x b") 'counsel-ibuffer)

;; helm show kill ring
(global-set-key (kbd "C-x r") 'helm-show-kill-ring)

;; start and end of the function
(global-set-key (kbd "C-M-[") 'beginning-of-defun)
(global-set-key (kbd "C-M-]")  'end-of-defun)

;; registers movement
(global-set-key (kbd "C-.") 'point-to-register)
(global-set-key (kbd "C-,") 'jump-to-register)

;; lsp mode
(after! ccls
  (setq ccls-initialization-options
        '(:clang (:extraArgs ["-isystem/Library/Developer/CommandLineTools/usr/include/c++/v1"
                              "-isystem/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include"
                              "-isystem/usr/local/include"
                              "-isystem/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/11.0.3/include"
                              "-isystem/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include"
                              "-isystem/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include"
                              "-isystem/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/System/Library/Frameworks"]
                  :resourceDir "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/11.0.3"))))

;; terminal here
(global-set-key (kbd "M-'") #'terminal-here-launch)

;; jumper
(global-set-key (kbd "M-n") #'jump-char-forward)
(global-set-key (kbd "M-p") #'jump-char-backward)

;; random attempt to fix indentation
(setq-default c-basic-offset 4
                  tab-width 4)
                  ;; indent-tabs-mode t)

;; buffer flip
;; key to begin cycling buffers.  Global key.
(global-set-key (kbd "M-<tab>") 'buffer-flip)

;; transient keymap used once cycling starts
(setq buffer-flip-map
      (let ((map (make-sparse-keymap)))
        (define-key map (kbd "M-<tab>")   'buffer-flip-forward)
        (define-key map (kbd "M-S-<tab>") 'buffer-flip-backward)
        (define-key map (kbd "M-ESC")     'buffer-flip-abort)
        map))

;; buffers matching these patterns will be skipped
(setq buffer-flip-skip-patterns
      '("^\\*helm\\b"
        "^\\*swiper\\*$"))

;; space to new line
(defun space-to-newline ()
  "Replace space sequence to a newline char.
Works on current block or selection.

URL `http://ergoemacs.org/emacs/emacs_space_to_newline.html'
Version 2017-08-19"
  (interactive)
  (let* ( $p1 $p2)
    (if (use-region-p)
        (progn
          (setq $p1 (region-beginning))
          (setq $p2 (region-end)))
      (save-excursion
        (if (re-search-backward "\n[ \t]*\n" nil "move")
            (progn (re-search-forward "\n[ \t]*\n")
                   (setq $p1 (point)))
          (setq $p1 (point)))
        (re-search-forward "\n[ \t]*\n" nil "move")
        (skip-chars-backward " \t\n")
        (setq $p2 (point))))
    (save-excursion
      (save-restriction
        (narrow-to-region $p1 $p2)
        (goto-char (point-min))
        (while (re-search-forward " +" nil t)
          (replace-match "\n"))))))

;; keybinding for macOS
;; to nurture the power of macOS and emacs combined
;; here are some explicitly defined commands which are
;; useful in day to day life of a programmer
;; Embrace the almighty

(global-set-key (kbd "s-<backspace>") 'kill-whole-line)
(global-set-key (kbd "s-<delete>") 'kill-whole-line)
(global-set-key (kbd "M-S-<backspace>") 'kill-word)
(global-set-key (kbd "M-<delete>") 'kill-word)

;; Use super (which is Cmd) for movement and selection just like in macOS.
(global-set-key (kbd "s-<right>") 'end-of-visual-line)
(global-set-key (kbd "s-<left>") 'beginning-of-visual-line)

(global-set-key (kbd "s-<up>") 'beginning-of-buffer)
(global-set-key (kbd "s-<down>") 'end-of-buffer)

(global-set-key (kbd "s-l") 'goto-line)

;; Basic things you should expect from macOS.
(global-set-key (kbd "s-a") 'mark-whole-buffer)       ;; select all
(global-set-key (kbd "s-s") 'save-buffer)             ;; save
(global-set-key (kbd "s-S") 'write-file)              ;; save as
(global-set-key (kbd "s-q") 'save-buffers-kill-emacs) ;; quit

;; Regular undo-redo.
(global-set-key (kbd "s-z")   'undo-fu-only-undo)
(global-set-key (kbd "s-Z")   'undo-fu-only-redo)

;; Avy for fast navigation.
(global-set-key (kbd "s-;") 'avy-goto-char)

;; Go back to previous mark (position) within buffer and go back (forward?).
(defun my-pop-local-mark-ring ()
  (interactive)
  (set-mark-command t))

(defun unpop-to-mark-command ()
  "Unpop off mark ring. Does nothing if mark ring is empty."
  (interactive
      (when mark-ring
        (setq mark-ring (cons (copy-marker (mark-marker)) mark-ring))
        (set-marker (mark-marker) (car (last mark-ring)) (current-buffer))
        (when (null (mark t)) (ding))
        (setq mark-ring (nbutlast mark-ring))
        (goto-char (marker-position (car (last mark-ring)))))))

(global-set-key (kbd "s-,") 'my-pop-local-mark-ring)
(global-set-key (kbd "s-.") 'unpop-to-mark-command)

;; Since Cmd+,= and =Cmd+. move you back in forward in the current buffer, the same keys with Shift move you back and forward between open buffers.
(global-set-key (kbd "s-<") 'previous-buffer)
(global-set-key (kbd "s->") 'next-buffer)

;; Go to other windows easily with one keystroke s-something instead of C-x something.
(defun vsplit-last-buffer ()
  (interactive)
  (split-window-vertically)
  (other-window 1 nil)
  (switch-to-next-buffer))

(defun hsplit-last-buffer ()
  (interactive)
  (split-window-horizontally)
  (other-window 1 nil)
  (switch-to-next-buffer))

(global-set-key (kbd "s-w") (kbd "C-x 0")) ;; just like close tab in a web browser
(global-set-key (kbd "s-W") (kbd "C-x 1")) ;; close others with shift

(global-set-key (kbd "s-T") 'vsplit-last-buffer)
(global-set-key (kbd "s-t") 'hsplit-last-buffer)

;; kill this buffer
(global-set-key (kbd "s-k") 'kill-this-buffer)

;; Smarter open-line by bbatsov. Once again, I’m taking advantage of
;; CMD and using it to quickly insert new lines above or below the current line, with correct indentation and stuff.
(defun smart-open-line ()
  "Insert an empty line after the current line. Position the cursor at its beginning, according to the current mode."
  (interactive)
  (move-end-of-line nil)
  (newline-and-indent))

(defun smart-open-line-above ()
  "Insert an empty line above the current line. Position the cursor at it's beginning, according to the current mode."
  (interactive)
  (move-beginning-of-line nil)
  (newline-and-indent)
  (forward-line -1)
  (indent-according-to-mode))

(global-set-key (kbd "s-<return>") 'smart-open-line)
(global-set-key (kbd "s-S-<return>") 'smart-open-line-above)

;; Join lines whether you’re in a region or not.
(defun smart-join-line (beg end)
  "If in a region, join all the lines in it. If not, join the current line with the next line."
  (interactive "r")
  (if mark-active
      (join-region beg end)
      (top-join-line)))

(defun top-join-line ()
  "Join the current line with the next line."
  (interactive)
  (delete-indentation 1))

(defun join-region (beg end)
  "Join all the lines in the region."
  (interactive "r")
  (if mark-active
      (let ((beg (region-beginning))
            (end (copy-marker (region-end))))
        (goto-char beg)
        (while (< (point) end)
          (join-line 1)))))

(global-set-key (kbd "s-j") 'smart-join-line)

(global-set-key (kbd "s-g") 'magit-status)

;; spelling, synonym and file
;; Spellcheck was Cmd+\, synonym search is Cmd+Shift+\.
(setq ispell-program-name "aspell")
(add-hook 'text-mode-hook 'flyspell-mode)
(global-set-key (kbd "s-\\") 'ispell-word)
;; (use-package powerthesaurus
;;   :config
;;   (global-set-key (kbd "s-|") 'powerthesaurus-lookup-word-dwim)
;;   )

;; Alternative, local thesaurus
(use-package synosaurus
  :config
  (global-set-key (kbd "s-|") 'synosaurus-choose-and-replace))

(use-package define-word
  :config
  (global-set-key (kbd "M-\\") 'define-word-at-point))

;; replace
(use-package visual-regexp
  :config
  (define-key global-map (kbd "s-r") 'vr/replace))

;; swiper, counsel and ivy
(global-set-key (kbd "s-f") 'swiper-isearch)
(global-set-key (kbd "s-b") 'ivy-switch-buffer)
(global-set-key (kbd "s-F") 'counsel-rg)
(global-set-key (kbd "s-p") 'counsel-git)

(use-package shackle
  :init
  (setq shackle-default-alignment 'below
        shackle-default-size 0.4
        shackle-rules '((help-mode           :align below :select t)
                        (helpful-mode        :align below)
                        (compilation-mode    :select t   :size 0.25)
                        ("*compilation*"     :select nil :size 0.25)
                        ("*ag search*"       :select nil :size 0.25)
                        ("*Flycheck errors*" :select nil :size 0.25)
                        ("*Warnings*"        :select nil :size 0.25)
                        ("*Error*"           :select nil :size 0.25)
                        ("*Org Links*"       :select nil :size 0.1)
                        (magit-status-mode                :align bottom :size 0.5  :inhibit-window-quit t)
                        (magit-log-mode                   :same t                  :inhibit-window-quit t)
                        (magit-commit-mode                :ignore t)
                        (magit-diff-mode     :select nil  :align left   :size 0.5)
                        (git-commit-mode                  :same t)
                        (vc-annotate-mode                 :same t)))

  :config
  (shackle-mode 1))

(use-package multiple-cursors
  :config
  (setq mc/always-run-for-all 1)
  (global-set-key (kbd "s-d") 'mc/mark-next-like-this)
  (global-set-key (kbd "s-D") 'mc/mark-all-dwim)
  (define-key mc/keymap (kbd "<return>") nil))

;; duplicate current line
(defun duplicate-current-line-or-region (arg)
  "Duplicates the current line or region ARG times.
If there's no region, the current line will be duplicated. However, if
there's a region, all lines that region covers will be duplicated."
  (interactive "p")
  (let (beg end (origin (point)))
    (if (and mark-active (> (point) (mark)))
        (exchange-point-and-mark))
    (setq beg (line-beginning-position))
    (if mark-active
        (exchange-point-and-mark))
    (setq end (line-end-position))
    (let ((region (buffer-substring-no-properties beg end)))
      (dotimes (i arg)
        (goto-char end)
        (newline)
        (insert region)
        (setq end (point)))
      (goto-char (+ origin (* (length region) arg) arg)))))

;; keybinding for duplicating current line
(global-set-key (kbd "C-c d") 'duplicate-current-line-or-region)


;; Messing around with orgmode and organizing my life
;; Enable org-habits to track everything

(setq org-modules '(org-habit
                    org-man
                    org-info))
(eval-after-load 'org
  '(org-load-modules-maybe t))

;; org send to bottom
(defun my/org-send-to-bottom-of-list ()
  "Send the current line to the bottom of the list."
  (interactive)
  (beginning-of-line)
  (let ((kill-whole-line t))
    (save-excursion
      (kill-line 1)
      (org-end-of-item-list)
      (yank))))

;; smart jump
(global-set-key (kbd "s-]") 'smart-jump-go)
(global-set-key (kbd "s-[") 'smart-jump-back)
(global-set-key (kbd "s-}") 'smart-jump-find-references-with-ag)
(global-set-key (kbd "s-{") 'smart-jump-peek)
