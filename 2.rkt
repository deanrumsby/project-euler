#lang racket

(define (even-fibonacci-numbers upper-bound)
  (define (iter sum a b)
    (define c (+ a b))
    (if (< c upper-bound) (if (even? c) (iter (+ sum c) b c) (iter sum b c)) sum))
  (iter 0 0 1))

(even-fibonacci-numbers 4000000)
