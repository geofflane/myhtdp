;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 9_5_6delta) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp")))))
;; A list-of-numbers is either
;; 1. the empty list, empty, or
;; 2. (cons n lon) where n is a number and lon is a list-of-numbers.

;; Template:
;; (define (f-of-numbers list-of-numbers)
;;  (cond
;;    [(empty? list-of-numbers) ...]
;;    [... (first list-of-numbers) ...]))

;; delta: list-of-numbers list-of-numbers  -> number
;; converts a list of digits into a number where the first digit is the least significant
(define (delta inventory-begin inventory-end)
  (- (sum inventory-begin) (sum inventory-end)))

(define (sum a-list-of-nums)
  (cond
    [(empty? a-list-of-nums) 0]
    [else (+ (first a-list-of-nums) (sum (rest a-list-of-nums)))]))

;; Tests
(define small-list (cons 10 (cons 10 empty)))
(define big-list (cons 10 (cons 10 (cons 10 empty))))

(= (sum small-list) 20)
(= (sum big-list) 30)

(= (delta small-list big-list) -10)
(= (delta big-list small-list) 10)

