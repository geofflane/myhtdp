;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 17_2_1hours-wages) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct employee (name ssn rate))
; An employee is a structure:
;   (make-employee name ssn rate) 
; where name is a symbol, ssn is a symbol and rate is a number.

(define-struct work (name hours))
; A work is a structure:
;   (make-work name hours) 
; where name is a symbol and hours is a number.

(define-struct paycheck (name amount))
; A paycheck is a structure:
;   (make-work name amount) 
; where name is a symbol and amount is a number.

; A list-of-employees is either
; 1. empty or
; 2. (cons (make-employee a b c) loe) where loe is a list-of-employees

; A list-of-works is either
; 1. empty or
; 2. (cons (make-work a b) low) where low is a list-of-works

; A list-of-paychecks is either
; 1. empty or
; 2. (cons (make-paycheck a b) lop) where lop is a list-of-paychecks

;; hours->wages : list-of-employees list-of-works ->  list-of-paychecks
;; to construct a new list by multiplying the corresponding items on
;; ASSUMPTION: the two lists are of equal length 
;; alon1 and alon2
(define (hours->wages loe low)
  (cond
    [(empty? loe) empty]
    [else (cons (make-paycheck (employee-name (first loe)) (weekly-wage (employee-rate (first loe)) (work-hours (first low))))
                (hours->wages (rest loe) (rest low)))]))

;; weekly-wage : number number  ->  number
;; to compute the weekly wage from pay-rate and hours-worked
(define (weekly-wage pay-rate hours-worked)
  (* pay-rate hours-worked))

;; Tests
(define loe (list (make-employee 'Adam '123456789 10) (make-employee 'Eve '123456789 11)))
(define low (list (make-work 'Adam 40) (make-work 'Eve 40)))

(check-expect (hours->wages empty empty) empty)
(check-expect (hours->wages loe low) (list (make-paycheck 'Adam 400) (make-paycheck 'Eve 440)))