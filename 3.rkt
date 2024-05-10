#lang racket

(define (divides? n m)
  (= (modulo n m) 0))

(define (contains-divisor? n divs)
  (ormap (lambda (m) (divides? n m)) divs))

(define (largest-prime-factor n)
  (define (add-next-prime primes)
    (define (iter n)
      (if (contains-divisor? n primes) (iter (+ n 1)) (cons n primes)))
    (iter (+ (car primes) 1)))

  (define (reduce n p)
    (cond
      [(= n 1) n]
      [(divides? n p) (reduce (/ n p) p)]
      [else n]))

  (define (iter m primes)
    (let* ([p (car primes)] [q (reduce m p)]) (if (= q 1) p (iter q (add-next-prime primes)))))

  (iter n '(2)))

(largest-prime-factor 600851475143)
