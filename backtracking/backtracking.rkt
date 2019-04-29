;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname backtracking) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
;#lang racket

; Position:
(define-struct position (row column))

;(define position1 (make-position 1 2))
;(position? position1)
;(position-row position1)
;(position-column position1)

; Occupancy is one of: 'occupied 'empty 'attacked
; Position-state:
(define-struct position-state (position occupancy))

;(define position-state1 (make-position-state position1 'occupied))
;(position-state? position-state1)
;(position-row (position-state-position position-state1))
;(position-column (position-state-position position-state1))
;(position-state-occupancy position-state1)

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
                (if (> column n)
                    empty
                    (cons (make-position-state (make-position row column) 'empty)
                          (create-columns (add1 column))))))
             (create-columns 1)))))
     (create-rows 1)))
             
(create-board 2)

