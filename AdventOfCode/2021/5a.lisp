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

(defvar grid
  (make-array (list num-rows num-cols)))

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
          (step-x (if (> start-x end-x) -1 1))
          (step-y (if (> start-y end-y) -1 1)))
     (map-iota
      (lambda (x)
        (map-iota (lambda (y) (incf (aref grid y x)))
                  dist-y :start start-y :step step-y))
      dist-x :start start-x :step step-x)))
 (remove-if-not (lambda (line)
                  (or
                   (= (caar line) (caadr line))
                   (= (cadar line) (cadadr line))))
                data))

(reduce
 #'+
 (array-rows grid)
 :key (lambda (row) (count-if (lambda (elt) (> elt 1)) row)))
