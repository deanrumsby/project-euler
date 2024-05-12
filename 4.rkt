#lang racket/base

(define (palindrome? n)
  (let ([as-string (number->string n)])
    (equal? as-string (list->string (reverse (string->list as-string))))))

(define (largest-palindrome-product factors-start factors-end)
  (for*/fold ([largest 0])
             ([i (in-range factors-start factors-end)]
              [j (in-range factors-start factors-end)]
              #:when (<= i j))
    (let ([product (* i j)]) (if (and (> product largest) (palindrome? product)) product largest))))

(largest-palindrome-product 100 1001)
