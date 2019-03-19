#lang racket

;instance of a class (obect) in FP is a function which accepts messages as an argument and returns responses to the messages
;messages can be interpreted as method calls in OOP
;class in FP is a constructor which returns an object
(define (Pair x y)
  (lambda (msg u)
    (cond
      ; readers
      ((equal? msg "x?") x)
      ((equal? msg "y?") y)
      ; setters
      ((equal? msg "x=") (Pair u y))
      ((equal? msg "y=") (Pair x u))
      (else
       "Error: Urecongnized message"))))

(define pair1 (Pair 1 2))
(pair1 "x?" 0)
(pair1 "y?" 0)
(pair1 "z?" 0)
(define pair3 (pair1 "x=" 3))
(define pair4 (pair1 "y=" 4))
(pair3 "x?" 0)
(pair4 "y?" 0)