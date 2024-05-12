#lang racket

(define (divides? n m)
  (= (modulo n m) 0))

(define (contains-divisor? n divs)
  (ormap (lambda (m) (divides? n m)) divs))

(define (largest-prime-factor n)
  (define (next-prime primes)
    (for/first ([i (in-naturals (+ (first primes) 1))] #:when (not (contains-divisor? i primes)))
      i))

  (define (reduce n p)
    (for/fold ([reduced n]) ([i (in-naturals)] #:break (or (= reduced 1) (not (divides? reduced p))))
      (/ n p)))

  (for/fold ([m n] [primes '(2)] #:result (first primes))
            ([i (in-naturals)] #:break (= m (first primes)))
    (values (reduce m (first primes)) (cons (next-prime primes) primes))))

(largest-prime-factor 600851475143)
