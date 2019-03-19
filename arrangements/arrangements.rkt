#lang racket

;(remove 'r '(r a t))
;(remove 'a '(r a t))
;(remove 't '(r a t))

(define (for_each_letter_in_word word top)
  (cond
    ((empty? word) '())
    (else
     (append (cons (first word) (remove (first word) top)) (for_each_letter_in_word (rest word) top)))))


;(for_each_letter_in_word '(r a t) '(r a t))

(define (for_each_letter_in_word2 word)
  (local
    ((define (for_each_letter_in_word w)
      (cond
        ((empty? w) '())
        (else
         (cons (append (list (first w)) (remove (first w) word)) (for_each_letter_in_word (rest w)))))))
    (for_each_letter_in_word word)))

;(for_each_letter_in_word2 '(r a t))
;(for_each_letter_in_word2 '())

(define (for_each_letter_in_word3 word)
  (local
    ((define (f letter)
       (append (list letter) (remove letter word))))
    (map f word)))

;(for_each_letter_in_word3 '(r a t))

(define (for_each_letter_in_word4 word)
  (map (λ (letter)
         (append (list letter)
                 (remove letter word)))
       word))

(define (arrangements word)
  (cond
    ((empty? word) (list '()))
    (else
     (foldr
      (λ (letter previos-arrangements)
        (local
          ((define other (remove letter word))
           (define other-arrangements (arrangements other))
           (define propagate-letter
             (map
              (λ (arrangement)
                (cons letter arrangement))
              other-arrangements)))
          (append propagate-letter previos-arrangements)))
      (list '())
      word))))
                   
                       

(arrangements '())
(arrangements '(r))
(arrangements '(r a))
(arrangements '(r a t))
(arrangements '(1 2 3 4))
(arrangements '(1 2 3 4 5))

              