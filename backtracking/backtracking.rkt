#lang racket

; Position:
(define-struct position (row column))

; Occupancy is one of: 'occupied 'empty 'attacked
; Position-state:
(define-struct position-state (position occupancy))

; Board is [List-of Position-state]

(define (get-all-placements n)
  empty)

;(get-all-placements 4)

(define (create-board n)
  (local
    ((define (create-rows row)
       (if (> row n)
           empty
           (local
             ((define (create-columns column)
                (if (> row column)
                    empty
                    (cons (make-position-state (make-position row column) 'empty)
                          (create-columns row (add1 column))))))
             (create-columns 1))))
     (create-rows 1))))
             


