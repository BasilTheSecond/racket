;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname union) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(define (union s1 s2)
  (cond
    ((empty? s1) s2)
    ((empty? s2) s1)
    (else
     (local
       ((define (less s1 s2)
          (cond
            ((empty? s1) '())
            (else
             (if (member? (first s1) s2) (less (rest s1) s2) (cons (first s1)  (less (rest s1) s2)))))))
       (append (less s1 s2) s2)))))

(union '() (list 'a 'b))
(union (list 1 2 3) '())
(union (list 1 2 3) (list 'a 'b))
(union (list 1 2 3 'a) (list 1 'a 'b))

(define (less s1 s2)
  (cond
    ((empty? s1) '())
    (else
     (if (member? (first s1) s2) (less (rest s1) s2) (cons (first s1)  (less (rest s1) s2))))))

(less (list 1 2 3) '())
(less (list 1 2 3) (list 1 'a 'b))

(define (interset s1 s2)
  (cond
    ((or (empty? s1) (empty? s2)) '())
    (else
     (local
       ((define (in s1 s2)
         (cond
           ((empty? s1) '())
           (else
            (if (member? (first s1) s2) (cons (first s1) (in (rest s1) s2)) (in (rest s1) s2))))))
       (in s1 s2)))))

(interset '() (list 'a 'b))
(interset (list 1 2 3) '())
(interset (list 1 2 3) (list 'a 'b))
(interset (list 1 2 3 'a) (list 1 'a 'b))

