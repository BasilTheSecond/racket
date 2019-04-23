#lang racket

; Position:
(define-struct position (row column))

; Occupancy is one of: 'occupied 'empty 'attacked
; Position-state:
(define-struct position-state (position occupancy))

; Board is [List-of Position-state]

(define (get-all-placements n)
  empty)

(get-all-placements 4)


