#lang racket

(define (word-without-item item word)
  (remove item word))


(define (arrangements word)
  (cond
    ((empty? word) '())
    (else
     (local
       ((define (for_each_letter w)
          (cond
            ((empty? w) '())
            (else
             (append (cond (first w) ;TODO: here we need to have append to each member of the result list
                      (arrangements (remove (first w) word)))
                     (for_each_letter (rest w)))))))
       (for_each_letter word)))))

(arrangements '())
(arrangements '(1 2 3))

;class in FP is a lambda
(define (Point x y)
  (lambda (msg)
    (cond
      ((equal? msg "x") x)
      ((equal? msg "y") y)
      (else
       "Error: Urecongnized message"))))

(define point1 (Point 1 2))
(define point2 (Point 3 4))
(point1 "x")
(point1 "y")
(point2 "z")

              