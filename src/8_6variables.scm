;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 8_6variables) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))

;; 8.6.1
(define MY_AGE 31)
(define YEARS_TILL_RETIREMENT (- 67 MY_AGE))
(define MONTHS_TILL_RETIREMENT (* 12 YEARS_TILL_RETIREMENT))

(define DOG 'Annie)
(define CAT 'Charlie)

;; 8.6.2
(define RADIUS 10)
; RADIUS = 10

(define DIAMETER (* 2 RADIUS))
; DIAMETER = 20

(define CIRCUMFERENCE (* 3.14 DIAMETER))
; CIRCUMFERENCE = 62.8

;; 8.6.3
(define PRICE 5)
; PRICE = 5

(define SALES-TAX (* .08 PRICE))
; SALES-TAX = 0.4

(define TOTAL (+ PRICE SALES-TAX))
; TOTAL = 5.04