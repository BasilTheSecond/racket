;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname factoriel) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; recursive factoriel
(define (factoriel n)
    (cond
      ((zero? n) 1)
      (else (* n (factoriel (- n 1))))))

(factoriel 10)

; iterative factoriel
(define (factoriel2 n)
  (fact 1 n 1))

(define (fact count n result)
  (cond
    ((> count n) result)
    (else (fact (+ count 1) n (* result count)))))

(factoriel2 10)


