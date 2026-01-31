;;; themes/oxocarbon.el -*- lexical-binding: t; -*-

;;; doom-oxocarbon-theme.el --- A port of the Oxocarbon Neovim theme -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Ported to Doom Emacs
;; Original Author: shaunsingh (Neovim)
;;
;;; Commentary:
;;; Code:

(require 'doom-themes)

;;; Variables

(defgroup doom-oxocarbon-theme nil
  "Options for the `doom-oxocarbon' theme."
  :group 'doom-themes)

(defcustom doom-oxocarbon-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-oxocarbon-theme
  :type 'boolean)

(defcustom doom-oxocarbon-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-oxocarbon-theme
  :type '(choice integer boolean))

;;; Theme definition

(def-doom-theme oxocarbon
    "The oxocarbon colorscheme"

  ;; name        default   256       16
  ((bg         '("#161616" "black"       "black"      )) ; base00
   (bg-alt     '("#131313" "black"       "black"      )) ; 'blend' from lua (used for floats/borders)
   (base0      '("#161616" "black"       "black"      )) ; base00
   (base1      '("#262626" "#262626"     "brightblack")) ; base01 (Calculated blend 8.5%)
   (base2      '("#393939" "#393939"     "brightblack")) ; base02 (Calculated blend 18%)
   (base3      '("#525252" "#525252"     "brightblack")) ; base03 (Calculated blend 30%)
   (base4      '("#5c5c5c" "#5c5c5c"     "brightblack")) ; slightly lighter base3 for variation
   (base5      '("#d5d5d5" "#d5d5d5"     "white"      )) ; base04 (Calculated blend 82%) - Primary FG
   (base6      '("#f2f2f2" "#f2f2f2"     "brightwhite")) ; base05 (Calculated blend 95%)
   (base7      '("#ffffff" "white"       "brightwhite")) ; base06
   (base8      '("#ffffff" "white"       "white"      ))

   (fg         base5) ; #d5d5d5
   (fg-alt     base3) ; #525252

   (grey       base3)
   (red        '("#ee5396" "red"         "red"))         ; base10
   (orange     '("#ff7eb6" "brightred"   "red"))         ; base12 (Pinkish-orange substitute)
   (green      '("#42be65" "green"       "green"))       ; base13
   (teal       '("#3ddbd9" "brightgreen" "green"))       ; base08
   (blue       '("#78a9ff" "brightblue"  "blue"))        ; base09
   (dark-blue  '("#33b1ff" "blue"        "blue"))        ; base11
   (magenta    '("#be95ff" "magenta"     "magenta"))     ; base14
   (violet     '("#be95ff" "magenta"     "magenta"))     ; base14 (Double mapped as oxocarbon has limited palette)
   (cyan       '("#82cfff" "cyan"        "cyan"))        ; base15
   (dark-cyan  '("#08bdba" "cyan"        "cyan"))        ; base07

   ;; Oxocarbon is cool-toned and lacks a true yellow.
   ;; We use the palette's lightest cyan or a synthesized bright beige for yellow slots
   ;; to maintain readability without breaking the palette's "vibe".
   (yellow     '("#ffe9b6" "yellow"      "yellow"))

   ;; face categories -- required for all themes
   (highlight      blue)
   (vertical-bar   base1)
   (selection      base2)
   (builtin        magenta)
   (comments       (if doom-oxocarbon-brighter-comments base4 base3))
   (doc-comments   (if doom-oxocarbon-brighter-comments base4 base3))
   (constants      teal)
   (functions      teal)
   (keywords       blue)
   (methods        cyan)
   (operators      magenta)
   (type           magenta)
   (strings        base5) ; Oxocarbon often keeps strings plain or distinct. Lua uses base14 (purple) sometimes, but plain is cleaner.
   (variables      base5)
   (numbers        magenta)
   (region         selection)
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-pad
    (when doom-oxocarbon-padded-modeline
      (if (integerp doom-oxocarbon-padded-modeline) doom-oxocarbon-padded-modeline 4)))

   (modeline-fg     base5)
   (modeline-fg-alt base3)
   (modeline-bg     base1)
   (modeline-bg-l   base1)
   (modeline-bg-inactive   bg-alt)
   (modeline-bg-inactive-l bg-alt))

  ;;;; Base theme face overrides
  ((font-lock-comment-face :foreground comments)
   (font-lock-doc-face     :foreground doc-comments)
   (line-number :foreground base3)
   (line-number-current-line :foreground base5 :bold t)

   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground highlight)

   ;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground cyan)
   (css-selector             :foreground blue)

   ;;;; markdown-mode
   (markdown-markup-face :foreground base4)
   (markdown-header-face :inherit 'bold :foreground blue)
   ((markdown-code-face &override) :background base1)

   ;;;; org <built-in>
   (org-block             :background bg-alt)
   (org-block-begin-line  :foreground base3 :background bg-alt)
   (org-ellipsis          :underline nil :foreground base4)
   ((org-quote &override) :background base1)
   (org-hide              :foreground bg)
   (org-todo              :foreground magenta :bold t)
   (org-done              :foreground base3 :strike-through t)

   ;;;; tree-sitter
   ;; Adapting Oxocarbon's specific logic: Variables are white(base5), types are pinks/purples
   (tree-sitter-hl-face:variable :foreground base5)
   (tree-sitter-hl-face:function :foreground teal)
   (tree-sitter-hl-face:type     :foreground magenta)
   (tree-sitter-hl-face:number   :foreground magenta)
   (tree-sitter-hl-face:string   :foreground violet) ; Following the Lua theme where strings are sometimes base14
   (tree-sitter-hl-face:keyword  :foreground blue)

   ;;;; rjsx-mode
   (rjsx-tag :foreground blue)
   (rjsx-attr :foreground cyan)))

;;; doom-oxocarbon-theme.el ends here
