;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 17_3_1list-pick0) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; A natural number [>= 1] (N[>= 1]) is either
; 1. 1 or
; 2. (add1 n) if n is a N[>= 1].

; A list-of-symbols is either
; 1. the empty list, empty, or
; 2. (cons s lof) where s is a symbol and lof is a list of symbols.

;; list-pick : list-of-symbols N[>= 0]  ->  symbol
;; to determine the nth symbol from alos, counting from 0;
;; signals an error if there is no nth item
(define (list-pick0 alos n)
  (cond
    [(empty? alos) (error 'list-pick0 "list too short")]
    [(= n 0) (first alos)]
    [(> n 0) (list-pick0 (rest alos) (sub1 n))]))

;; Tests
(check-error (list-pick0 empty 1)  "list-pick0: list too short")
(check-expect (list-pick0 (list 'a 'b 'c 'd) 3) 'd)
(check-error (list-pick0 (list 'a 'b 'c 'd) 4) "list-pick0: list too short")