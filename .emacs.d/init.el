;; -*- lexical-binding: t; -*-

;; set here to avoid small font when loading
(add-to-list 'default-frame-alist '(font . "Hack Nerd Font-17" ))
(set-face-attribute 'default t :font "Hack Nerd Font-17" )

(server-start)

;;; setup straight https://github.com/radian-software/straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; use straight automatically when using use-package
(setq straight-use-package-by-default t)
(use-package org)

;; load actual config
(load (locate-user-emacs-file "config.el"))

