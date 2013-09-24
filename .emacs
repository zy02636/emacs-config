;;load Emacs Lisp library path
(setq load-path (append load-path (list "~/elisp")))

;;;;configure plugins

;;configure ----- python -----
(load-file "~/.emacs.d/plugins/emacs-for-python/epy-init.el")
(add-to-list 'load-path "~/.emacs.d/plugins/emacs-for-python/") ;; tell where to load the various files
(require 'epy-setup)      ;; It will setup other loads, it is required!
(require 'highlight-indentation)
(add-hook 'python-mode-hook 'highlight-indentation)

;;;Color Theme 
(add-to-list 'load-path "~/.emacs.d/plugins/color-theme-6.6.0") 
(require 'color-theme) 
(color-theme-initialize) 
(color-theme-greiner)

;;set font family
(set-default-font "-outline-consolas-normal-r-normal-delnormal-14-97-96-96-c-*-iso8859-1")

;;configure lisp
(add-to-list 'load-path "/opt/local/share/emacs/site-lisp/slime")
(setq slime-lisp-implementations
      `((sbcl ("/opt/local/bin/sbcl"))
       (abcl ("/opt/local/bin/abcl"))
       (clisp ("/opt/local/bin/clisp"))))
(require 'slime)
(slime-setup  '(slime-repl slime-asdf slime-fancy slime-banner))

;;yasnippet
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas/global-mode 1)

;;auto-complete
(add-to-list 'load-path "~/.emacs.d/plugins")
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/dict")
(require 'auto-complete-config)
(ac-config-default)
(set-default 'ac-sources
             '(ac-source-abbrev
               ac-source-dictionary
               ac-source-yasnippet
               ac-source-words-in-buffer
               ac-source-words-in-same-mode-buffers
               ac-source-semantic))
(dolist (m '(c-mode c++-mode java-mode lisp-mode))
  (add-to-list 'ac-modes m))
(global-auto-complete-mode t)
(define-key ac-menu-map (kbd "C-n") 'ac-next)
(define-key ac-menu-map (kbd "C-p") 'ac-previous)

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key "\M-c" 'capitalize-word)
