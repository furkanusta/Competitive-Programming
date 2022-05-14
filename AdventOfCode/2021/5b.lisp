(require 'util)
(in-package :my-aoc)

(defvar data
  (mapcar
   (lambda (line)
     (let* ((words (str:words line))
            (start (mapcar #'parse-integer (str:split "," (car words))))
            (end (mapcar #'parse-integer (str:split "," (caddr words)))))
       (list start end)))
   (read-file "5.inp")))

(defvar num-rows
  (+ 1
     (reduce #'max data :key
             (lambda (line)
               (let* ((start (car line))
                      (end (cadr line))
                      (start-x (car start))
                      (end-x (car end)))
                 (max start-x end-x))))))

(defvar num-cols
  (+ 1
     (reduce #'max data :key
             (lambda (line)
               (let* ((start (car line))
                      (end (cadr line))
                      (start-y (cadr start))
                      (end-y (cadr end)))
                 (max start-y end-y))))))

(let ((grid (make-array (list num-rows num-cols))))
  (mapc
   (lambda (line)
     (let* ((start (car line))
            (start-x (car start))
            (start-y (cadr start))
            (end (cadr line))
            (end-x (car end))
            (end-y (cadr end))
            (dist-x (+ 1 (abs (- end-x start-x))))
            (dist-y (+ 1 (abs (- end-y start-y))))
            (min-x (min start-x end-x))
            (min-y (min start-y end-y))
            (direction (if (= start-x end-x) :vertical
                           (if (= start-y end-y) :horizontal
                               (if (< start-y end-y)
                                   ;; Diagonal prefix indicates the starting corner
                                   (if (< start-x end-x) :up-left-diagonal :up-right-diagonal)
                                   (if (< start-x end-x) :down-left-diagonal :down-right-diagonal))))))
       (case direction
         (:horizontal (map-iota (lambda (n) (incf (aref grid start-y n))) dist-x :start min-x))
         (:vertical (map-iota (lambda (n) (incf (aref grid n start-x))) dist-y :start min-y))
         (:up-left-diagonal (map-iota (lambda (n) (incf (aref grid (+ start-y n) (+ start-x n)))) dist-y))
         (:up-right-diagonal (map-iota (lambda (n) (incf (aref grid (+ start-y n) (- start-x n)))) dist-y))
         (:down-left-diagonal (map-iota (lambda (n) (incf (aref grid (- start-y n) (+ start-x n)))) dist-y))
         (:down-right-diagonal (map-iota (lambda (n) (incf (aref grid (- start-y n) (- start-x n)))) dist-y))
         )))
   data)
  (reduce
   #'+
   (array-rows grid)
   :key (lambda (row) (count-if (lambda (elt) (> elt 1)) row))))
