;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname cross) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(define (cross list1 list2)
  (cond
    ((or (empty? list1) (empty? list2)) '())
    (else
     (local
       ((define (cross2 a l)
         (cond
           ((empty? l) '())
           (else
            (cons (list a (first l)) (cross2 a (rest l)))))))
       (append (cross2 (first list1) list2) (cross (rest list1) list2))))))


(cross (list 1 2 3) (list 'a 'b))
(cross (list 1 2 3) '())
(cross '() (list 'a 'b))
(cross (list 1 2 3) (list 'a 'b 'c))
(cross (list #true #false) (list 'a 'b 'c))

