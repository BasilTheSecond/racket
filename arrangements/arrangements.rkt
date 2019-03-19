#lang racket

(define (word-without-item item word)
  (remove item word))


(define (arrangements word)
  (cond
    ((empty? word) '())
    (else
     (local
       ((define (for_each_letter_in_word_do_arrangements w)
          (cond
            ((empty? w) '())
            (else
             (append (cond (first w) ;TODO: here we need to have append to each member of the result list
                      (arrangements (remove (first w) word)))
                     (for_each_letter_in_word_do_arrangements (rest w)))))))
       (for_each_letter_in_word_do_arrangements word)))))

(arrangements '())
(arrangements '(r a t))
(arrangements '(1 2 3 4))


              