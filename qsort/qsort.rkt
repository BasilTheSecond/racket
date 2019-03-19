;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname qsort) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(define (qsort l)
  (cond
    ((empty? l) '())
    ((empty? (rest l)) l)
    (else
     (local
       ((define pivot (first l))
        (define equals
          (filter
           (lambda (x)
             (= x pivot))
           l))
        (define smallers
          (filter
           (lambda (x)
             (< x pivot))
           l))
        (define largers
          (filter
           (lambda (x)
             (> x pivot))
           l)))
       (append (qsort smallers) equals (qsort largers))))))

(qsort '())
(qsort (list 5))
(qsort (list 5 4 12 11))
(qsort (list 5 4 12 11 1 2 8))
(qsort (list 5 4 12 11 1 4 2 5 8))
(qsort (list 5 4 12 11 1 4 2 5 8 12 11 12 9))
(qsort (list 5 5 5 5))


