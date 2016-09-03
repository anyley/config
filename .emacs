;;; package --- .emacs
;;; Code:
;;; Commentary:

(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "<f2>"))
(global-unset-key (kbd "<f10>"))


(defun edit-emacs ()
	"."
  (interactive)
  (find-file "~/.emacs"))

(global-set-key (kbd "<f9>") 'edit-emacs)

(package-initialize)
(setq load-prefer-newer t)
(package-initialize)
(require 'auto-compile)
(auto-compile-on-load-mode)
(auto-compile-on-save-mode)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))


(require 'rvm)
(rvm-use-default)

(add-to-list 'load-path "~/.emacs.d/elpa/undo-tree-0.6.5")

(add-to-list 'default-frame-alist '(height . 40))
(add-to-list 'default-frame-alist '(width . 129))

;;(setq file-name-coding-system 'utf-8)
(fset 'yes-or-no-p 'y-or-n-p)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(column-number-mode t)
 '(cursor-type (quote (bar . 2)))
 '(custom-enabled-themes (quote (railscasts)))
 '(custom-safe-themes
   (quote
    ("3b0a350918ee819dca209cec62d867678d7dac74f6195f5e3799aa206358a983" default)))
 '(flycheck-ruby-rubocop-executable "~/.rvm/gems/ruby-2.3.1/bin/rubocop")
 '(fringe-mode (quote (nil . 0)) nil (fringe))
 '(global-hl-line-mode t)
 '(indicate-buffer-boundaries (quote left))
 '(initial-buffer-choice t)
 '(initial-scratch-message "")
 '(save-place t nil (saveplace))
 '(scroll-bar-mode nil)
 '(scroll-step 1)
 '(setq scroll-step t)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(speedbar-frame-parameters
   (quote
    ((minibuffer)
     (width . 30)
     (border-width . 0)
     (menu-bar-lines . 0)
     (tool-bar-lines . 0)
     (unsplittable . t)
     (left-fringe . 0))))
 '(speedbar-show-unknown-files t)
 '(tool-bar-mode nil)
 '(truncate-lines t)
 '(word-wrap t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'default-frame-alist '(font . "FiraCode-15" ))


(defun win-resize-top-or-bot ()
		"Figure out if the current window is on top, bottom or in the middle."
    (let* ((win-edges (window-edges))
    (this-window-y-min (nth 1 win-edges))
    (this-window-y-max (nth 3 win-edges))
    (fr-height (frame-height)))
    (cond
        ((eq 0 this-window-y-min) "top")
        ((eq (- fr-height 1) this-window-y-max) "bot")
        (t "mid"))))

(defun win-resize-left-or-right ()
		"Figure out if the current window is to the left, right or in the middle."
    (let* ((win-edges (window-edges))
    (this-window-x-min (nth 0 win-edges))
    (this-window-x-max (nth 2 win-edges))
    (fr-width (frame-width)))
    (cond
        ((eq 0 this-window-x-min) "left")
        ((eq (+ fr-width 4) this-window-x-max) "right")
        (t "mid"))))

(defun win-resize-enlarge-horiz ()
	"."
	(interactive)
	(cond
	 ((equal "top" (win-resize-top-or-bot)) (enlarge-window -1))
	 ((equal "bot" (win-resize-top-or-bot)) (enlarge-window 1))
	 ((equal "mid" (win-resize-top-or-bot)) (enlarge-window -1))
	 (t (message "nil"))))

(defun win-resize-minimize-horiz ()
	"."
	(interactive)
	(cond
	 ((equal "top" (win-resize-top-or-bot)) (enlarge-window 1))
	 ((equal "bot" (win-resize-top-or-bot)) (enlarge-window -1))
	 ((equal "mid" (win-resize-top-or-bot)) (enlarge-window 1))
	 (t (message "nil"))))

(defun win-resize-enlarge-vert ()
	"."
	(interactive)
	(cond
	 ((equal "left" (win-resize-left-or-right)) (enlarge-window-horizontally -1))
	 ((equal "right" (win-resize-left-or-right)) (enlarge-window-horizontally 1))
	 ((equal "mid" (win-resize-left-or-right)) (enlarge-window-horizontally -1))))

(defun win-resize-minimize-vert ()
	"."
	(interactive)
	(cond
	 ((equal "left" (win-resize-left-or-right)) (enlarge-window-horizontally 1))
	 ((equal "right" (win-resize-left-or-right)) (enlarge-window-horizontally -1))
	 ((equal "mid" (win-resize-left-or-right)) (enlarge-window-horizontally 1))))

(defun reload_dot_emacs ()
	"."
  (interactive)
  (load-file "~/.emacs"))

(defun close-file ()
	"."
  (interactive)
	(kill-this-buffer)
	(delete-window))


(set-background-color "gray7")
(set-face-background 'hl-line "gray15")
(set-face-background 'region "#666677")

(global-set-key [S-M-down] 'win-resize-mi2nimize-vert)
(global-set-key [S-M-up] 'win-resize-enlarge-vert)
(global-set-key [S-M-left] 'win-resize-minimize-horiz)
(global-set-key [S-M-right] 'win-resize-enlarge-horiz)
(global-set-key [S-M-up] 'win-resize-enlarge-horiz)
(global-set-key [S-M-down] 'win-resize-minimize-horiz)
(global-set-key [S-M-left] 'win-resize-enlarge-vert)
(global-set-key [S-M-right] 'win-resize-minimize-vert)

(global-set-key (kbd "C-<tab>") 'next-buffer)
(global-set-key (kbd "C-S-<iso-lefttab>") 'previous-buffer)

(global-set-key (kbd "C-r") 'reload_dot_emacs)
(global-set-key (kbd "C-q") 'close-file)
(global-set-key (kbd "C-f") 'isearch-forward)
(global-set-key (kbd "C-S-f") 'isearch-repeat-forward)
(global-set-key (kbd "C-o") 'find-file)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-y") 'kill-whole-line)
(global-set-key (kbd "C-z") 'undo-tree-visualize)
(global-set-key (kbd "C-a") 'mark-page)
(global-set-key (kbd "C-e") 'speedbar)
(global-set-key [f5] 'eval-last-sexp)
;;(global-set-key [f6] 'bookmark-jump)
(global-set-key [M-up] 'windmove-up)
(global-set-key [M-down] 'windmove-down)
(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "M--") 'split-window-below)
(global-set-key (kbd "M-+") 'split-window-right)
(global-set-key (kbd "C-*") 'delete-window)
(global-set-key (kbd "M-*") 'delete-window)

(global-set-key (kbd "C-c C-p") 'list-packages)
;;(global-set-key (kbd "<F2>") 'kmacro-call-macro)
(global-set-key (kbd "<f2>") 'kmacro-call-macro)
(global-set-key (kbd "M-q") 'kill-this-buffer)


(set-cursor-color "white")

(setq mouse-wheel-scroll-amount '(3 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time
(setq indent-tabs-mode 1)

;;(setq tab-always-indent 'complete)
(setq-default indent-tabs-mode nil)
(setq-default tab-always-indent nil)
(setq-default tab-width 2)
(setq tab-width 2)

(require 'undo-tree)

(add-to-list 'load-path "~/.emacs.d/elpa/neotree-20160802.51/")
(require 'neotree)
(global-set-key (kbd "M-1") 'neotree-toggle)

(set-face-underline 'hl-line nil)

(add-to-list 'load-path "~/.emacs.d/elpa/gh-20160728.1525/")
(add-to-list 'load-path "~/.emacs.d/elpa/dash-20160820.501/")
(add-to-list 'load-path "~/.emacs.d/elpa/gist-20160118.1656/")
(add-to-list 'load-path "~/.emacs.d/elpa/marshal-20160807.1954/")
(add-to-list 'load-path "~/.emacs.d/elpa/ht-20160806.1753/")
(add-to-list 'load-path "~/.emacs.d/elpa/s-20160711.525/")
(add-to-list 'load-path "~/.emacs.d/elpa/s-20160711.525/")
(add-to-list 'load-path "~/.emacs.d/elpa/pcache-20160724.1929/")
(add-to-list 'load-path "~/.emacs.d/elpa/logito-20120225.1255/")


(fset 'lpath
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([S-insert home 40 97 100 100 45 116 111 45 108 105 115 116 32 39 108 111 97 100 45 112 97 116 104 32 34 126 end 34 41 home] 0 "%d")) arg)))

(global-set-key (kbd "C-l") 'lpath)

(require 'gist)

;;(add-to-list 'load-path "~/.emacs.d/elpa/textmate-20110816.1446/")
;;(require 'textmate)
;;(textmate-mode)


(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))


;;(setq word-wrap t)
;;(set-default 'truncate-lines t)

;;(setq yas-snippet-dirs
;;      '("~/.emacs.d/snippets"))
(global-set-key (kbd "C-c C-n") 'yas-new-snippet)


;; Shift the selected region right if distance is postive, left if
;; negative

(defun shift-region (distance)
	"DISTANCE is a."
  (let ((mark (mark)))
    (save-excursion
      (indent-rigidly (region-beginning) (region-end) distance)
      (push-mark mark t t)
      ;; Tell the command loop not to deactivate the mark
      ;; for transient mark mode
      (setq deactivate-mark nil))))

(defun shift-right ()
	"."
  (interactive)
  (shift-region 1))

(defun shift-left ()
	"."
  (interactive)
  (shift-region -1))


(global-set-key (kbd "M-]") 'shift-right)
(global-set-key (kbd "M-[") 'shift-left)

(fset 'end-of-block
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([6 101 110 100 return up end] 0 "%d")) arg)))
(global-set-key (kbd "C-M-<end>") 'end-of-block)

(fset 'end-of-next-block
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([6 101 110 100 return 33554438 up end] 0 "%d")) arg)))
(global-set-key (kbd "C-M-<next>") 'end-of-next-block)

(defun goto-end-prev-block ()
	"."
	(interactive)
	(search-backward-regexp ".*end$")
	(forward-line -1)
	(end-of-line))
(global-set-key (kbd "C-M-<prior>") 'goto-end-prev-block)

(global-unset-key (kbd "C-M-<home>"))
(defun goto-begin-block ()
	"Перемещаю курсор в начало первой строки текущего блока ruby."
	(interactive)
	(re-search-backward "[ \t]+?\\(do\\)[ \t]*?\\(|.*|\\|end\\)??$")
	(goto-char (match-beginning 1))
	(forward-line)
	(beginning-of-line-text))
(global-set-key (kbd "C-M-<home>") 'goto-begin-block)


(require 'litable)

(quietly-read-abbrev-file)
(setq save-abbrevs t)
(setq-default abbrev-mode t)

(ac-config-default)


(add-to-list 'load-path "~/.emacs.d/elpa/yasglnippet-20160801.1142/")
(require 'yasnippet)
(yas-global-mode 1)

(global-unset-key (kbd "C-<return>"))

;; (defun insert-under-line ()
;; 	(interactive)
;; 	(beginning-of-line-text)
;; 	(let ((pos (point))))
;; 	(save-excursion
;; 		(newline-and-indent))
;; 	(indent-according-to-mode))

(global-set-key (kbd "C-<return>") 'split-line)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)

(put 'scroll-left 'disabled nil)


;; use web-mode for .jsx files
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))

;; http://www.flycheck.org/manual/latest/index.html
(require 'flycheck)

(global-flycheck-mode)
;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

;; use eslint with web-mode for jsx files
(flycheck-set-checker-executable "javascript-eslint" "~/npm/bin/eslint")
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(json-jsonlist)))

;; https://github.com/purcell/exec-path-from-shell
;; only need exec-path-from-shell on OSX
;; this hopefully sets up path and other vars better
;;(when (memq window-system '(mac ns))
;;  (exec-path-from-shell-initialize))

;; adjust indents for web-mode to 2 spaces
(defun my-web-mode-hook ()
	"Hooks for Web mode.  Adjust indent."
  ;;; http://web-mode.org/
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))
(add-hook 'web-mode-hook  'my-web-mode-hook)


;; for better jsx syntax-highlighting in web-mode
;; - courtesy of Patrick @halbtuerke
(defadvice web-mode-highlight-part (around tweak-jsx activate)
	"."
  (if (equal web-mode-content-type "jsx")
			(let ((web-mode-enable-part-face nil))
				ad-do-it)
    ad-do-it))

(add-hook 'web-mode-hook
          (lambda ()
            (if (equal web-mode-content-type "javascript")
                (web-mode-set-content-type "jsx")
              (message "now set to: %s" web-mode-content-type))))

;; (setq web-mode-content-types-alist
;;       '(("jsx" . "\\.js[x]?\\'")))

(global-linum-mode)

(defvar *linum-mdown-line* nil)

(defun line-at-click ()
  (save-excursion
	(let ((click-y (cdr (cdr (mouse-position))))
		  (line-move-visual-store line-move-visual))
	  (setq line-move-visual t)
	  (goto-char (window-start))
	  (next-line (1- click-y))
	  (setq line-move-visual line-move-visual-store)
	  ;; If you are using tabbar substitute the next line with
	  ;; (line-number-at-pos))))
	  (1+ (line-number-at-pos)))))

(defun md-select-linum ()
  (interactive)
  (goto-line (line-at-click))
  (set-mark (point))
  (setq *linum-mdown-line*
		(line-number-at-pos)))

(defun mu-select-linum ()
  "Function mu-select-linum."
  (interactive)
  (when *linum-mdown-line*
    (let (mu-line)
      ;; (goto-line (line-at-click))
      (setq mu-line (line-at-click))
      (goto-line (max *linum-mdown-line* mu-line))
      (set-mark (line-end-position))
      (goto-line (min *linum-mdown-line* mu-line))
      (setq *linum-mdown*
            nil))))

(global-set-key (kbd "<left-margin> <down-mouse-1>") 'md-select-linum)
(global-set-key (kbd "<left-margin> <mouse-1>") 'mu-select-linum)
(global-set-key (kbd "<left-margin> <drag-mouse-1>") 'mu-select-linum)

(global-set-key (kbd "C-<SPC>") 'just-one-space)

(global-set-key (kbd "S-<return>") 'mc/mark-all-words-like-this)
(global-set-key (kbd "M-<return>") 'mc/mark-next-like-this-symbol)
(global-set-key (kbd "M-S-<return>") 'mc/keyboard-quit)
(delete-selection-mode 1)

(provide '.emacs)
;;; .emacs ends here

