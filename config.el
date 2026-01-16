(setq display-line-numbers-type 'relative)

(setq user-full-name "Matthew T. Pagtalunan"
      user-mail-address "pipip9077@gmail.com")

(setq doom-theme 'oxocarbon)

(setq doom-font (font-spec :family "Iosevka" :size 20 :weight 'Medium)
      doom-variable-pitch-font (font-spec :family "Iosevka" :size 20))

(setq confirm-kill-emacs nil)
;; tbh dont know what this does
(after! gcmh
  (setq gcmh-idle-delay 2
        gcmh-high-cons-threshold (* 50 1024 1024)))

(setq +doom-dashboard-banner-padding '(4 . 2))
(setq +doom-dashboard-banner-dir (concat doom-user-dir "banners/")
      +doom-dashboard-banner-file "gnu_color.svg")
(remove-hook! '+doom-dashboard-functions #'doom-dashboard-widget-footer)
(remove-hook! '+doom-dashboard-functions #'doom-dashboard-widget-loaded)

(setq org-directory "~/org/")

(setq org-preview-latex-default-process 'dvisvgm)
(custom-theme-set-faces!
  'doom-on
  '(org-level-8 :inherit outline-3 :height 1.0)
  '(org-level-7 :inherit outline-3 :height 1.0)
  '(org-level-6 :inherit outline-3 :height 1.1)
  '(org-level-5 :inherit outline-3 :height 1.2)
  '(org-level-4 :inherit outline-3 :height 1.3)
  '(org-level-3 :inherit outline-3 :height 1.4)
  '(org-level-2 :inherit outline-2 :height 1.5)
  '(org-level-1 :inherit outline-1 :height 1.6)
  '(org-document-title  :height 1.8 :bold t :underline nil))

;; Set your Org-Roam directory explicitly
(setq org-roam-directory (file-truename "~/org/roam"))
(org-roam-db-autosync-mode)

(after! org-roam
  (add-to-list 'org-roam-capture-templates
               '("c" "Class / Subject" plain
                 (file "~/org/roam/templates/class_template.org") ; We will create this file next
                 :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: :School:Subject:\n")
                 :unnarrowed t)))
(defun my/org-roam-extract-region ()
  "Extract the active region to a new Org-roam node and replace it with a link."
  (interactive)
  (when (use-region-p)
    (let* ((region-text (buffer-substring-no-properties (region-beginning) (region-end)))
           (node-title (read-string "New Node Title: "))
           ;; Generate the link immediately
           (link-text (format "[[roam:%s]]" node-title)))
      ;; 1. Delete the selected text and replace with the link
      (delete-region (region-beginning) (region-end))
      (insert link-text)
      ;; 2. Launch the capture to create the new file
      (org-roam-capture-
       :node (org-roam-node-create :title node-title)
       :props '(:finalize find-file) ;; Open the new file after capture
       :templates
       ;; We dynamically inject the region-text into the template body
       `(("r" "refactor" plain
          ,(concat region-text "\n\n%?") ;; Paste text, add newlines, place cursor
          :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
          :unnarrowed t))))))

;; Bind it to a key. I recommend SPC n r x (Node Roam eXtract)
(map! :leader
      :prefix ("n r ." "roam")
      :desc "Extract region to node" "x" #'my/org-roam-extract-region)

(setq org-agenda-files
      (mapcar 'file-truename
              '("~/org/inbox.org"
                "~/org/projects.org"
                "~/org/school.org")))

(add-hook 'org-mode-hook #'org-superstar-mode)
(setq org-superstar-headline-bullets-list '("◉" "○" "✸" "✿" "✤"))
