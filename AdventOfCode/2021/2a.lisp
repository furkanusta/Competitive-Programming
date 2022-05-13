(use-package :str)
(require 'util)

(defvar data (read-file "2.inp"))

(defun sum-values (data label)
  (reduce #'+ (mapcar (lambda (line) (parse-integer (cadr (split " " line))))
                      (remove-if-not (lambda (line) (starts-with? label line)) data))))

(defvar forward-movement (sum-values data "forward"))
(defvar up-movement (sum-values data "up"))
(defvar down-movement (sum-values data "down"))

(print (* forward-movement (- down-movement up-movement)))

;; (remove-if-not (lambda (line) (starts-with? "forward" line)) data)
