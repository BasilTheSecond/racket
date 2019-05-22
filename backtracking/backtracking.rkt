;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname backtracking) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; Board is list of Rows
; Rows is a list of Columns
; Columns is list of Row Column Occupancy
; Row, Column is Int 1..n
; Occupancy is one of: 'occupied 'empty 'attacked

(define (create-board n)
  (local
    ((define (create-rows row)
       (if (> row n)
           empty
           (cons (create-columns 1 row) (create-rows (add1 row)))))
     (define (create-columns column row)
       (if (> column n)
           empty
           (cons (list row column 'empty) (create-columns (add1 column) row)))))
    (create-rows 1)))



;(create-board 1)
;(create-board 2)
;(create-board 3)
;(create-board 4)



