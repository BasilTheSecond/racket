;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname merge) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(define (merge l1 l2)
  (cond
   ((empty? l1) l2)
   ((empty? l2) l1)
   ((= (first l1) (first l2)) (cons (first l1) (cons (first l2) (merge (rest l1) (rest l2)))))
   ((< (first l1) (first l2)) (cons (first l1) (merge (rest l1) l2)))
   (else (merge l2 l1))))
        
;(merge (list 1 2 3) '())
;(merge '() (list 4 5))
;(merge (list 1 2 3) (list 4 5))
;(merge (list 1 2 3) (list 1 4 5))
;(merge (list 4 5) (list 1 2 3 4))

;(length (list 1 2 3 4 5))

(define (first-n l n)
  (local
    ((define len (length l)))
    (cond
      ((empty? l) '())
      ((= n 0) '())
      ((<= len n) l)
      (else
       (cons (first l) (first-n (rest l) (sub1 n)))))))

;(first-n '() 10)
;(first-n (list 1 2 3 4 5) 10)
;(first-n (list 1 2 3 4 5) 5)
;(first-n (list 1 2 3 4 5) 3)
;(first-n (list 1 2 3 4 5) 2)
;(first-n (list 1 2 3 4 5) 1)
;(first-n (list 1 2 3 4 5) 0)
  
(define (last-n l n)
  (local
    ((define len (length l)))
    (cond
      ((empty? l) '())
      ((= n 0) '())
      ((= n len) l)
      (else
       (local
         ((define skip (- len n))
          (define (skip-n l n)
            (if (= n 0) l
            ;else
                (skip-n (rest l) (sub1 n)))))
         (skip-n l skip))))))

;(last-n '() 5)
;(last-n (list 1 2 3 4 5) 5)
;(last-n (list 1 2 3 4 5) 4)
;(last-n (list 1 2 3 4 5) 3)
;(last-n (list 1 2 3 4 5) 2)
;(last-n (list 1 2 3 4 5) 1)
;(last-n (list 1 2 3 4 5) 0)

(define (merge-sort l)
  (cond
    ((empty? l) '())
    (else
     (local
       ((define len (length l)))
       (if (equal? len 1)
           l
       ;else
           (local
             ((define left-half (quotient len 2))
              (define right-half (- len left-half)))
             (merge (merge-sort (first-n l left-half)) (merge-sort (last-n l right-half)))))))))


(merge-sort '())
(merge-sort (list 1))
(merge-sort (list 3 2))
(merge-sort (list 3 2 1))
(merge-sort (list 8 7 6 6 1 1 5 5 10 11 12 -2))


