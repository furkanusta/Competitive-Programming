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

(defun pad-grid (data val)
  (let ((n (length (car data))))
    (append
     (cons
      (make-list (+ 2 n) :initial-element val)
      (mapcar (lambda (line) (append (cons val line) (list val))) data))
     (list (make-list (+ 2 n) :initial-element val)))))

(defmacro nor (&rest forms)
  `(not (or ,@forms)))

(defmacro nand (&rest forms)
  `(not (and ,@forms)))

(defun print-hash-table (hash-table &optional (compact nil))
  (let ((test (hash-table-test hash-table)))
    (format t "#(")
    (unless compact (format t "~%"))
    (maphash (lambda (k v) (format t "   (~S . ~S)" k v) (unless compact (format t "~%"))) hash-table)
    (format t "   ) :TEST '~A)" test)
    (unless compact (format t "~%"))
    hash-table))

;; ;; --------------------------------------------------
;; ;; From Serapeum
;; ;;
;; (defmacro lret-aux (let (&rest bindings) &body body)
;;   (if (null bindings)
;;       `(,let ()
;;          ,@body)
;;       (multiple-value-bind (body decls)
;;           (parse-body body)
;;         (let ((last-binding (ensure-car (lastcar bindings))))
;;           `(,let ,bindings
;;              ,@decls
;;              (with-read-only-vars (,last-binding)
;;                (prog1 ,last-binding
;;                  ,@body)))))))

;; (defmacro lret ((&rest bindings) &body body)
;;   "Return the initial value of the last binding in BINDINGS. The idea
;; is to create something, initialize it, and then return it.
;;     (lret ((x 1)
;;            (y (make-array 1)))
;;       (setf (aref y 0) x))
;;     => #(1)"
;;   `(lret-aux let ,bindings
;;      ,@body))

;; (defmacro lret* ((&rest bindings) &body body)
;;   "Cf. `lret'."
;;   `(lret-aux let* ,bindings
;;      ,@body))

(provide 'util)
