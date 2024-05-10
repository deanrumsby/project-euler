#lang racket

(define (even-fibonacci-numbers upper-bound)
  (define (iter a b results)
    (let ([c (+ a b)])
      (cond
        [(>= c upper-bound) results]
        [(even? c) (iter b c (cons c results))]
        [else (iter b c results)])))

  (iter 0 1 '()))

(apply + (even-fibonacci-numbers 4000000))
