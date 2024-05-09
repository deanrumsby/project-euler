#lang racket

(define (divides? n m)
  (= (modulo n m) 0))

(define (contains-divisor? n divs)
  (ormap (lambda (m) (divides? n m)) divs))

(define (add-next-prime primes)
  (define (iter n)
    (if (contains-divisor? n primes) (iter (+ n 1)) (cons n primes)))
  (iter (+ (car primes) 1)))

(define (reduce n p)
  (define (iter m)
    (if (and (divides? m p) (not (= m 1))) (iter (/ m p)) m))
  (iter n))

(define (largest-prime-factor n)
  (define (iter m primes)
    (define p (car primes))
    (define q (reduce m p))
    (if (= q 1) p (iter q (add-next-prime primes))))
  (iter n '(2)))

(largest-prime-factor 600851475143)
