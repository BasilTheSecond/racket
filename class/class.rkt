#lang racket

;instance of a class (obect) in FP is a function which accepts messages as an argument and returns responses to the messages
;messages can be interpreted as method calls in OOP
;class in FP is a constructor which returns an object
(define (Pair x y)
  (lambda (msg)
    (cond
      ((equal? msg "x?") x)
      ((equal? msg "y?") y)
      (else
       "Error: Urecongnized message"))))

(define pair1 (Pair 1 2))
(pair1 "x?")
(pair1 "y?")
(pair1 "z?")