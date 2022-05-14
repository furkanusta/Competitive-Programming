(require 'util)
(in-package :my-aoc)

(defvar data (read-file "4.inp"))
(defvar numbers (mapcar #'parse-integer (str:split "," (car data))))
(defvar board-values (remove-if (lambda (elt) (string-equal "" elt)) (rest data)))
(defvar board-count (/ (length board-values) 5))

(defvar board-data
  (chunk-list (mapcar (lambda (elt) (mapcar #'parse-integer (str:words elt))) board-values) 5))

(defvar boards (mapcar (lambda (lst) (make-array '(5 5) :initial-contents lst)) board-data))

(defun bingo (arr)
  (or
   (/= 0 (length (remove-if-not
                  #'identity
                  (mapcar (lambda (row)
                            (every (lambda (elt) (and (typep elt 'string) (string= "X" elt))) row))
                          (array-rows arr)))))
   (/= 0 (length (remove-if-not
                  #'identity
                  (mapcar (lambda (col)
                            (every (lambda (elt) (and (typep elt 'string) (string= "X" elt))) col))
                            (array-columns arr)))))))

(defun mark-num (arr num)
  (dotimes (i 5)
    (dotimes (j 5)
      (let ((elt (aref arr i j)))
        (when (and (typep elt 'integer) (= elt num))
          (setf (aref arr i j) "X"))))))

(defun sum-unmarked (arr)
  (apply #'+
         (mapcar (lambda (row)
                   (apply #'+
                          (map 'list #'identity
                               (remove-if
                                (lambda (elt) (and (typep elt 'string) (string= "X" elt)))
                                row))))
                 (array-rows arr))))


(let ((boards (mapcar #'copy-array boards))
      (last nil))
  (dolist (num numbers)
    (mapc (rcurry #'mark-num num) boards)
    (let* ((bingo-count (count-if-not #'bingo boards)))
      (when (and (not last) (= 1 bingo-count))
        (setq last (position-if-not #'bingo boards)))
      (when (= 0 bingo-count)
        (return (* (sum-unmarked (nth last boards)) num))))))
