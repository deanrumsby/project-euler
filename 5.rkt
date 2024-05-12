#lang racket/base

(define (smallest-multiple divs)
  (apply lcm divs))

(smallest-multiple (build-list 20 (lambda (x) (+ x 1))))
