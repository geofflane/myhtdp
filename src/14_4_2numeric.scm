;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 14_4_2numeric) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct add (left right))
(define-struct mul (left right))

;A rep is either
;1. empty or
;2. (cons s a-rep) 
;    where s is a symbol, a structure or a symbol and a-rep is a rep.

;; numeric?: rep -> boolean
;; determines if a scheme representation is numeric, meaning it contains no variables
(define (numeric? a-rep)
  (cond
    [(symbol? a-rep) false]
    [(add? a-rep) (and (numeric? (add-left a-rep)) (numeric? (add-right a-rep)))]
    [(mul? a-rep) (and (numeric? (mul-left a-rep)) (numeric? (mul-right a-rep)))]
    [else true]))

;; Tests
(check-expect (numeric? (make-add 3 33)) true)
(check-expect (numeric? (make-add (make-mul 20 3) 33)) true)

(check-expect (numeric? (make-add 'c 32)) false)
(check-expect (numeric? (make-add (make-mul 9/5 'c) 32)) false)