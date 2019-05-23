;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname backtracking) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; Board is list of Row
; Row is a list of Column
; Column is list of Postion
; Position is a list of R W O
; R, W is Int
; O is one of: 'occupied 'empty 'attacked

(define (create-empty-board n)
  (local
    ((define (create-row r)
       (if (> r n)
           empty
           (cons (create-column 1 r) (create-row (add1 r)))))
     (define (create-column c r)
       (if (> c n)
           empty
           (cons (list r c 'empty) (create-column (add1 c) r)))))
    (create-row 1)))



;(create-empty-board 1)
;(create-empty-board 2)
;(create-empty-board 3)
;(create-empty-board 4)


(define (update-board board r c)
  (cond
    ((empty? (first board)) empty)
    (else
     board)))

(define empty-board-4x4 (create-empty-board 4))

(update-board empty-board-4x4 1 1)

 


