#lang racket

(define (sum-of-squares ints)
  (for/sum ([i ints]) (* i i)))

(define (square-of-sum ints)
  (let ([sum (apply + ints)]) (* sum sum)))

(define (sum-square-difference ints)
  (- (square-of-sum ints) (sum-of-squares ints)))

(sum-square-difference (build-list 100 (lambda (x) (+ x 1))))
