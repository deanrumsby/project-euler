#lang racket/base

(define (even-fibonacci-numbers upper-bound)
  (for/fold ([sum 0] [a 1] [b 0] #:result sum) ([i (in-naturals)] #:break (>= a upper-bound))
    (if (even? a) (values (+ sum a) (+ a b) a) (values sum (+ a b) a))))

(even-fibonacci-numbers 4000000)
