(require 'iterate)
(require 'str)
(require 'alexandria)

(defpackage :my-aoc
  (:use :cl :iterate :alexandria)
  (:export read-file chunk-list array-row))

(in-package :my-aoc)

(defun read-file (filename)
  (with-open-file (stream filename)
                  (loop for line = (read-line stream nil)
                        while line
                        collect line)))

(defun chunk-list (list size)
  (loop
     for front = list then next
     for next = (nthcdr size front)
     collect (ldiff front next)
     while next))

(defun array-row (arr row)
  (make-array (array-dimension arr 1)
              :displaced-to arr
              :displaced-index-offset (* row (array-dimension arr 1))))

(defun array-column (arr col)
  (make-array (array-dimension arr 1)
   :initial-contents (mapcar (lambda (row) (aref arr row col)) (iota (array-dimension arr 0)))))

(defun array-rows (arr)
  (mapcar (lambda (num) (array-row arr num)) (iota (array-dimension arr 0))))

(defun array-columns (arr)
  (mapcar (lambda (num) (array-column arr num)) (iota (array-dimension arr 1))))

(defun range (end &key (start 0) (step 1))
   (loop for n from start below end by step
      collect n))

(defun list-to-string (lst)
  (format nil "~{~a~}" lst))

(provide 'util)
