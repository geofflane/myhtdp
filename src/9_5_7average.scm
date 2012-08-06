;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 9_5_7average) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; A list-of-numbers is either
;; 1. the empty list, empty, or
;; 2. (cons n lon) where n is a number and lon is a list-of-numbers.

;; Template:
;; (define (f-of-numbers list-of-numbers)
;;  (cond
;;    [(empty? list-of-numbers) ...]
;;    [... (first list-of-numbers) ...]))

;; average-price: list-of-numbers  -> number
;; computes the average value of a list of numbers
(define (average-price a-list-of-nums)
  (cond
    [(empty? a-list-of-nums) 0]
    [else (/ (sum a-list-of-nums) (how-many a-list-of-nums))]))

;; checked-average-price: list-of-numbers  -> number
;; computes the average value of a non empty list of numbers
(define (checked-average-price: a-list-of-nums)
  (cond
    [(empty? a-list-of-nums) (error 'checked-average-price "must be a non-empty list")]
    [else (/ (sum a-list-of-nums) (how-many a-list-of-nums))]))

;; sum: list-of-nums -> number
;; sum all of the numbers in the list
(define (sum a-list-of-nums)
  (cond
    [(empty? a-list-of-nums) 0]
    [else (+ (first a-list-of-nums) (sum (rest a-list-of-nums)))]))

;; how-many: list ->  number
;; to count the number of the items in a lits
(define (how-many l)
  (cond
    [(empty? l) 0]
    [else (+ (how-many (rest l)) 1)]))

;; Tests
(= (average-price empty) 0)
(= (average-price (cons 1 (cons 1 empty))) 1)
(= (average-price (cons 10 (cons 20 empty))) 15)
(= (average-price (cons 30 (cons 10 (cons 20 empty)))) 20)

