#lang racket

(define (multiple-of-3? n)
  (equal? (modulo n 3) 0))

(define (multiple-of-5? n)
  (equal? (modulo n 5) 0))

(define (multiple-of-3-or-5? n)
  (or (multiple-of-3? n) (multiple-of-5? n)))

(define (multiples-of-3-or-5 upper-bound)
  (define (iter sum n)
    (define m (+ n 1))
    (if (< n upper-bound) (if (multiple-of-3-or-5? n) (iter (+ sum n) m) (iter sum m)) sum))
  (iter 0 1))

(multiples-of-3-or-5 1000)
