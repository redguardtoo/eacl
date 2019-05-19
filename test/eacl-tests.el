;; eacl-tests.el --- unit tests for eacl -*- coding: utf-8 -*-

;; Author: Chen Bin <chenbin DOT sh AT gmail DOT com>

;;; License:

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

(require 'ert)
(require 'eacl)
(require 'grep)

(defvar cands-for-ivy-read nil "Candidates passed to `ivy-read'.")
(defun ivy-read (hint cands &rest params)
  (message "cands=%s len=%d" cands (length cands))
  (setq cands-for-ivy-read cands))

(ert-deftest eacl-test-complete-one-line ()
  (let* ((grep-find-ignored-files '("eacl-tests.el")))
    (with-temp-buffer
      ;; complete one line
      (insert "test single")
      (eacl-complete-line)
      (goto-char (line-beginning-position))
      (should (string= (eacl-current-line-text) ";; test single line"))

      (erase-buffer)
      (goto-char (point-min))
      (insert "shortline")
      (setq cands-for-ivy-read nil)
      (eacl-complete-line)
      (should (eq (length cands-for-ivy-read) 2)))))

(ert-deftest eacl-test-complete-multiline ()
  (let* ((grep-find-ignored-files '("eacl-tests.el"))
         lines)
    (with-temp-buffer
      ;; complete one line
      (insert "<TestTable")
      (eacl-complete-multiline)
      (setq lines (split-string (buffer-string) "\n"))
      (should (string= (nth 0 lines) "<TestTable>"))
      (should (string-match "<h1>hello world</h1>" (nth 1 lines)))
      (should (string= (nth 2 lines) "</TestTable>"))
      (should (eq (length lines) 3)))))

(ert-run-tests-batch-and-exit)
