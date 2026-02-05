(map! :leader
      (:prefix ("l" . "lookup")
       :desc "Power Thesaurus" "t" #'powerthesaurus-transient))

(setq-hook! 'go-mode-hook
  dtrt-indent-mode nil
  indent-tabs-mode t
  tab-width 4
  standard-indent 4)

(setq +doom-dashboard-banner-padding '(4 . 2))
(setq +doom-dashboard-banner-dir (concat doom-user-dir "banners/")
      +doom-dashboard-banner-file "gnu_color.svg")
(remove-hook! '+doom-dashboard-functions #'doom-dashboard-widget-footer)
(remove-hook! '+doom-dashboard-functions #'doom-dashboard-widget-loaded)

(use-package cmake-ts-mode
  :config
  (add-hook 'cmake-ts-mode-hook
    (defun setup-neocmakelsp ()
      (require 'eglot)
      (add-to-list 'eglot-server-programs `((cmake-ts-mode) . ("neocmakelsp" "stdio")))
      (eglot-ensure))))

(setq org-directory "~/org/")


(setq org-preview-latex-default-process 'dvisvgm)

(after! org
  (require 'org-habit)
  (add-to-list 'org-modules 'org-habit)
  (setq org-habit-graph-column 60) ;; Adjusts where the graph starts
  (setq org-habit-show-habits-only-for-today nil))

(custom-set-faces!

  ;; Make the document title (like #+title:) huge

  '(org-document-title :height 1.75 :weight bold)


  ;; Make standard headings larger

  '(outline-1 :height 1.4 :weight extra-bold)

  '(outline-2 :height 1.25 :weight bold)

  '(outline-3 :height 1.15 :weight bold)

  '(outline-4 :height 1.1 :weight semi-bold)

  '(outline-5 :height 1.1 :weight semi-bold)

  '(outline-6 :height 1.1 :weight semi-bold)

  '(outline-8 :height 1.1 :weight semi-bold)

  '(outline-9 :height 1.1 :weight semi-bold))


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

;; --- DOOM PRODUCTIVITY CONFIG ---

;; 1. Add habits.org to your agenda list
(setq org-agenda-files
      (mapcar 'file-truename
              '("~/org/inbox.org"
                "~/org/projects.org"
                "~/org/school.org"
                "~/org/habits.org"))) ;; <--- WE ADDED THIS

(after! org
  (require 'org-habit)
  (add-to-list 'org-modules 'org-habit)
  (setq org-habit-show-habits-only-for-today nil))

(after! org-agenda
  (setq org-habit-graph-column 50) ;; Adjust this number if graph is off-screen
  (setq org-agenda-columns-auto-skip-marker nil)
  (setq org-agenda-sorting-strategy
        '((agenda habit-down time-up priority-down category-keep)
          (todo priority-down category-keep)
          (tags priority-down category-keep)
          (search category-keep))))

(setq org-agenda-custom-commands
      '(("d" "Daily Dashboard"
         ((agenda "" ((org-agenda-span 1)
                      (org-deadline-warning-days 7)))
          (todo "NEXT"
                ((org-agenda-overriding-header "Priority Actions")))
          (tags-todo "School"
                     ((org-agenda-overriding-header "School Assignments")))
          (tags-todo "Code"
                     ((org-agenda-overriding-header "Coding Projects")))))))

(add-hook 'org-mode-hook #'org-superstar-mode)
(setq org-superstar-headline-bullets-list '("◉" "○" "✸" "✿" "✤"))

(after! org
  ;; Hide the *bold*, /italic/, etc. markers
  (setq org-hide-emphasis-markers t))

(use-package! org-appear
  :hook (org-mode . org-appear-mode)
  :config
  ;; Optional: hide markers for entities, keywords, etc. too
  (setq org-appear-autoentities t
        org-appear-autolinks t
        org-appear-autosubmarkers t))

(after! org-pomodoro
  (setq org-pomodoro-length 25
        org-pomodoro-short-break-length 5
        org-pomodoro-long-break-length 15

        org-pomodoro-audio-player "paplay"
        org-pomodoro-finished-sound "~/.config/doom/sounds/pomodoroDone.mp3"

        org-pomodoro-finished-sound-p t
        org-pomodoro-short-break-sound-p t
        org-pomodoro-long-break-sound-p t))

(setq ispell-personal-dictionary (expand-file-name "aspell.en.pws" doom-user-dir))

(setq display-line-numbers-type 'relative)

(setq user-full-name "Matthew T. Pagtalunan"
      user-mail-address "pipip9077@gmail.com")

(add-to-list 'custom-theme-load-path (concat doom-user-dir "themes/"))
(setq doom-theme 'compline)

(setq doom-font (font-spec :family "Iosevka" :size 20 :weight 'Medium)
      doom-variable-pitch-font (font-spec :family "Iosevka" :size 20))

(blink-cursor-mode 1)

(setq confirm-kill-emacs nil)
;; tbh dont know what this does
(after! gcmh
  (setq gcmh-idle-delay 2
        gcmh-high-cons-threshold (* 50 1024 1024)))

(setq read-process-output-max (* 1024 1024)) ;; 1mb
(setenv "LSP_USE_PLISTS" "true")
