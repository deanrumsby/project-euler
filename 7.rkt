#lang racket/base

(define (divides? n m)
  (= (modulo n m) 0))

(define (contains-divisor? n divs)
  (ormap (lambda (m) (divides? n m)) divs))

(define (nth-prime n)
  (define (next-prime primes)
    (for/first ([i (in-naturals (+ (car primes) 1))] #:when (not (contains-divisor? i primes)))
      i))
  (for/fold ([primes '(2)] #:result (car primes)) ([i (in-range (- n 1))])
    (cons (next-prime primes) primes)))

(nth-prime 10001)
