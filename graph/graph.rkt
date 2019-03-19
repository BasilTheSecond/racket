;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname graph) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; Node is a Symbol
; Neighbours is [List-of Node]
; NodeAndNeighbours is a [List-of Node Neighbours]
; Graph is [List-of NodeAndNeighbours]
; Path is a [List-of Node]

; Node, Graph => Neighbours
(define (neighbours node graph)
  (local
    ; [List-of Node Neighbours] => Boolean
    ((define (isNode? x)
       (symbol=? (first x) node))
     (define nodeAndNeighbours
       (first (filter isNode? graph))))
    (second nodeAndNeighbours)))

(define sampleGraph
  (list
   (list 'A (list 'B 'E))
   (list 'B (list 'E 'F))
   (list 'C (list 'D))
   (list 'D '())
   (list 'E (list 'C 'F))
   (list 'F (list 'D 'G))
   (list' G '())))

(neighbours 'D sampleGraph)
(neighbours 'A sampleGraph)
(neighbours 'F sampleGraph)

; Node, Node, [Node, Graph => Neighbours], Graph => [Maybe Path]
(define (findPath s t neighbours graph)
  (cond
    ((symbol=? s t) (list t))
    (else
     (local
       ; Neighbours => [Maybe Path]
       ((define (findPathFrom n)
          (cond
            ((empty? n) #false)
            (else
             (local
               ((define path (findPath (first n) t neighbours graph)))
               (if (cons? path)
                   (cons s path)
                   (findPathFrom (rest n))))))))
       (findPathFrom (neighbours s graph))))))
          
(findPath 'C 'C neighbours sampleGraph)
(findPath 'C 'D neighbours sampleGraph)
(findPath 'E 'D neighbours sampleGraph)
(findPath 'C 'G neighbours sampleGraph)
(findPath 'A 'G neighbours sampleGraph)
