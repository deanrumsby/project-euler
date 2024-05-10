#lang racket

(define (divides? n d)
  (= (modulo n d) 0))

(define (multiples-of-3-or-5 upper-bound)
  (define (multiple-of-3-or-5? n)
    (or (divides? n 3) (divides? n 5)))
  (define (iter n results)
    (let ([m (+ n 1)])
      (cond
        [(>= n upper-bound) results]
        [(multiple-of-3-or-5? n) (iter m (cons n results))]
        [else (iter m results)])))
  (iter 1 '()))

(apply + (multiples-of-3-or-5 1000))
