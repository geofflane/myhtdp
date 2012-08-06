;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 9_5_3dollar-store) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; A list-of-numbers is either
;; 1. the empty list, empty, or
;; 2. (cons n lon) where n is a number and lon is a list-of-numbers.

;; Template:
;; (define (f-of-numbers list-of-numbers)
;;  (cond
;;    [(empty? list-of-numbers) ...]
;;    [... (first list-of-numbers) ...]))

;; dollar-store?: list-of-numbers  -> boolean
;; checks whether all of the prices are below $1
(define (dollar-store? a-list-of-numbers)
  (cond
    [(empty? a-list-of-numbers) true]
    [else (and (<= (first a-list-of-numbers) 1)
               (dollar-store? (rest a-list-of-numbers)))]))

;; price-check? check list-of-numbers  -> boolean
;; checks whether all of the prices are below check
(define (price-check? check a-list-of-numbers)
  (cond
    [(empty? a-list-of-numbers) true]
    [else (and (<= (first a-list-of-numbers) check)
               (price-check? check (rest a-list-of-numbers)))]))

;; Tests
(dollar-store? empty)
(not (dollar-store? (cons .75 (cons 1.95 (cons .25 empty)))))
(dollar-store? (cons .15 (cons .05 (cons .25 empty))))

(price-check? 1 empty)
(not (price-check? 1 (cons .75 (cons 1.95 (cons .25 empty)))))
(price-check? 1 (cons .15 (cons .05 (cons .25 empty))))