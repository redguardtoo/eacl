;;; eacl.el --- Emacs auto-complete line by grep

;; Copyright (C) 2017 Chen Bin
;;
;; Version: 0.0.1
;; Keywords: keyword1 keyword2
;; Author: Chen Bin <chenbin DOT sh AT gmail DOT com>
;; URL: http://github.com/usrname/eacpl
;; Package-Requires: ((emacs "24.1"))

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:

;; 
(defcustom eacl-eol-punctuation ";"
  "Punctuation at the end of line."
  :type 'string
  :group 'eacl)

(defcustom eacl-grep-program "grep"
  "Punctuation program."
  :type 'string
  :group 'eacl)

(defcustom eacl-project-root nil
  "Project root.  If it's nil, project root is `default-directory'."
  :type 'string
  :group 'eacl)

;;;###autoload
(defun eacl-complete-line ()
  "Complete line by grepping in project.
The keyword to grep is the text from line beginning to current cursor."
  (interactive)
  (let* ()
    (message "eacl-complete-line calleds")
    ))

;;;###autoload
(defun eacl-complete-statement ()
  "Complete statement which has `eacl-eol-punctuation' at the end of line.
The keyword to grep is the text from line beginning to current cursor."
  (interactive)
  (let* ()
    (message "eacl-complete-line called"  )
    ))


;;; Code:

(message "hello world")
(provide 'eacl)
;;; eacl.el ends here

