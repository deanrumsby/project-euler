#lang racket/base

(define (divides? n d)
  (= (modulo n d) 0))

(define (multiples-of-3-or-5 upper-bound)
  (for/sum ([i (in-range upper-bound)] #:when (or (divides? i 3) (divides? i 5))) i))

(multiples-of-3-or-5 1000)
