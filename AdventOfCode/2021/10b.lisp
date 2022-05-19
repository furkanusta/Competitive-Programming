(require 'util)
(in-package :my-aoc)

(defun matching-pair-p (open close)
  (or
   (and (eql #\{ open) (eql #\} close))
   (and (eql #\[ open) (eql #\] close))
   (and (eql #\< open) (eql #\> close))
   (and (eql #\( open) (eql #\) close))))

(defun incomplete-symbols (line)
  (let* ((stack '())
         (invalid (find-if
                   (lambda (ch)
                     (if (member ch (list #\( #\< #\[ #\{))
                         (progn (push ch stack) nil)
                         (not (matching-pair-p (pop stack) ch))))
                   line)))
    (unless invalid stack)))

(defun points (stack)
  (reduce (lambda (x y) (+ (* x 5) y))
          stack
          :key (lambda (ch)
                 (or
                  (and (eql #\( ch) 1)
                  (and (eql #\[ ch) 2)
                  (and (eql #\{ ch) 3)
                  (and (eql #\< ch) 4)))))

(let* ((data (read-file "10.inp"))
       (stacks (remove-if-not #'identity (mapcar #'incomplete-symbols data)))
       (scores (sort (mapcar #'points stacks) #'<))
       (len (length scores)))
  (nth (floor len 2) scores))
