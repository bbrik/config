;; -*- mode: emacs-lisp -*-

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."

  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers '(
     (auto-completion :variables
                      auto-completion-tab-key-behavior 'complete
                      auto-completion-enable-snippets-in-popup t
                      )
     emacs-lisp
     git
     html
     javascript
     markdown
     org
     python
     react
     semantic
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     syntax-checking
     unimpaired
     version-control
     )

   dotspacemacs-additional-packages '(base16-theme)
   dotspacemacs-excluded-packages '()
   dotspacemacs-delete-orphan-packages t
  )
)

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."

  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update t
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner nil
   dotspacemacs-startup-lists '(recents bookmarks projects)
   dotspacemacs-startup-recent-list-size 5
   dotspacemacs-scratch-mode 'text-mode

   dotspacemacs-themes '(
                         base16-eighties-dark
                         base16-ashes-dark
                         base16-tomorrow-dark
                         base16-twilight-dark
                         spacemacs-dark
                         solarized-dark
                         )
   dotspacemacs-colorize-cursor-according-to-state t

   dotspacemacs-default-font '("PragmataPro"
                               :size 20
                               :weight normal
                               :width normal
                               :powerline-scale 1.2
                               )

   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-command-key ":"
   dotspacemacs-remap-Y-to-y$ t

   dotspacemacs-default-layout-name "Home"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts t
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-use-ido nil
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-enable-paste-micro-state nil

   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar nil
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup t
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-mode-line-unicode-symbols nil
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers t
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep") ;
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup 'changed
   )
)

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put almost
any user code here.  The exception is org related code, which should be placed
in `dotspacemacs/user-config'."

  ;; Indentation for javascript/react
  (setq-default
   js2-basic-offset 2
   js-indent-level 2
   css-indent-offset 2
   web-mode-markup-indent-offset 2
   web-mode-css-indent-offset 2
   web-mode-code-indent-offset 2
   web-mode-attr-indent-offset 2
   )
  (with-eval-after-load 'web-mode
    (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
    (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
    (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil))
    )

  ;; Coloca new line no fim do arquivo ao salvar
  (setq-default require-final-newline t)

  ;; Para de reclamar que a linha de commit é muito longa
  (setq-default git-commit-check-style-conventions nil)
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."

  (setq powerline-default-separator 'bar)

  (add-hook 'react-mode-hook 'js2-mode-hide-warnings-and-errors)
  (add-hook 'js2-mode-hook 'js2-mode-hide-warnings-and-errors)
  (add-hook 'org-mode-hook 'auto-fill-mode)
  (add-hook 'help-mode-hook (define-key evil-motion-state-map (kbd "ESC") 'quit-window))

  (when (memq window-system '(ns mac))
    (setq-default line-spacing 0.1)
    (setq mac-command-modifier 'super)
    (setq mac-option-modifier 'meta)
    ;; enable ligatures on OS X.
    (when (functionp 'mac-auto-operator-composition-mode)
      (setq mac-auto-operator-composition-characters "!\"#$%&'()*+,-/:;<=>?@[]^_`{|}~")
      (mac-auto-operator-composition-mode))

    (setq ns-use-native-fullscreen nil)
    (setq ns-command-modifier 'super)
    (setq ns-alternate-modifier 'meta)
    (setq ns-auto-hide-menu-bar nil)
    )

  ;; Exclude directories from project search
  (setq grep-find-ignored-directories '(
                                        ".idea"
                                        ".meteor"
                                        "node_modules"
                                        ".git"
                                        ".hg"
                                        ".svn"
                                        ))

  (define-key evil-normal-state-map (kbd "+") 'evil-numbers/inc-at-pt)
  (define-key evil-normal-state-map (kbd "_") 'evil-numbers/dec-at-pt)

  (define-key company-active-map (kbd "C-w") 'evil-delete-backward-word)

  (spacemacs/declare-prefix "o" "bbrik")
  (spacemacs/set-leader-keys "oe" 'emmet-mode)
  (spacemacs/set-leader-keys "ol" 'mac-auto-operator-composition-mode)
  (spacemacs/set-leader-keys "os" 'projectile-save-project-buffers)

  (spacemacs/set-leader-keys "SPC" 'avy-goto-char-timer)
  )

;; ;; Do not write anything past this comment. This is where Emacs will
;; ;; auto-generate custom variable definitions.
