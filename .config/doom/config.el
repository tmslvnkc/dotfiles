;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; ----------------------------------------
;; Key bindings
;; ----------------------------------------

;; Navigation
(map! :leader
      :desc "jump to definition" "n j" #'lsp-find-definition
      :desc "search for file" "n f" #'counsel-fzf)
;; Magit
(map! :leader
      :desc "git status" "g s" #'magit-status)

;; ----------------------------------------
;; Personal
;; ----------------------------------------

;; User
(setq user-full-name "Tomislav Nikic"
      user-mail-address "hello@tmslvnkc.com")

;; ----------------------------------------
;; UI
;; ----------------------------------------

;; Fonts
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 18 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "JetBrainsMono Nerd Font" :size 18))
;; Theme
(setq doom-theme 'doom-one)

;; ----------------------------------------
;; BASIC SETUP
;; ----------------------------------------

;; Org
(setq org-directory "~/org/")
;; Lines
(setq display-line-numbers-type 'relative)
;; Projectile
(setcar counsel-projectile-switch-project-action 13)
(setq projectile-auto-discover t)
(setq projectile-project-search-path '("~/code/"))

;; ----------------------------------------
;; Ruby
;; ----------------------------------------
(setq flycheck-ruby-rubocop-executable "~/.rbenv/shims/rubocop")
