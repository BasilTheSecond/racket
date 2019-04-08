#lang racket

; And FSM is a structure:
; (make-fsm Fsm-state (List-of 1Transition) Fsm-state)
(define-struct fsm (initial transitions final))
; A 1Transition is a structure:
; (make-transition Fsm-state 1String Fsm-state)
(define-struct transition (current key next))
; An Fsm-state is String

(define (fsm-match? fsm string)
  (local
    ((define initial-state (fsm-initial fsm))
     (define final-state (fsm-final fsm))
     (define transitions (fsm-transitions fsm))
     (define (iterate-fsm current-state reminaing-string)
       (cond
         ((string=? current-state final-state) #true)
         ((string=? reminaing-string "") #false)
         (else
          (local
            ((define (is-transition? one-transition)
               (and
                (equal? (transition-current one-transition) current-state)
                (equal? (transition-key one-transition) (substring reminaing-string 0 1))))
             (define possible-transitions
               (filter is-transition? transitions)))
            (cond
              ((empty? possible-transitions) #false)
              (else
               (local
                 ((define required-transition (first possible-transitions))
                  (define next-state (transition-next required-transition)))
                 (iterate-fsm next-state (substring reminaing-string 1))))))))))
  (iterate-fsm initial-state string)))

;(string->list "abcd")

; a (b | c)* d
(define fsm1
  (make-fsm 
   "AA"
   (list (make-transition "AA" "a" "BC")
         (make-transition "BC" "b" "BC")
         (make-transition "BC" "c" "BC")
         (make-transition "BC" "d" "DD"))
   "DD"))

; Accepts
(fsm-match? fsm1 "abdc")
(fsm-match? fsm1 "ad")
(fsm-match? fsm1 "abcd")

; Doesn't accept
(fsm-match? fsm1 "da")
(fsm-match? fsm1 "aa")
(fsm-match? fsm1 "d")



