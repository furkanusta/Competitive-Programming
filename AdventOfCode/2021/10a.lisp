(require 'util)
(in-package :my-aoc)

(defvar data (read-file "10.inp"))

(defun matching-pair-p (open close)
  (or
   (and (eql #\{ open) (eql #\} close))
   (and (eql #\[ open) (eql #\] close))
   (and (eql #\< open) (eql #\> close))
   (and (eql #\( open) (eql #\) close))))

(defun first-illegal-character (line)
  (let ((stack '()))
    (find-if
     (lambda (ch)
      (if (member ch (list #\( #\< #\[ #\{))
          (progn
            (push ch stack)
            nil)
          (unless (matching-pair-p (pop stack) ch)
            ch)))
    line)))

(defun points (ch)
  (or
   (and (eql ch #\)) 3)
   (and (eql ch #\]) 57)
   (and (eql ch #\}) 1197)
   (and (eql ch #\>) 25137)))

(reduce #'+ (mapcar #'points (remove-if-not #'identity (mapcar #'first-illegal-character data))))
