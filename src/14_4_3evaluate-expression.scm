;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 14_4_3evaluate-expression) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct add (left right))
(define-struct mul (left right))

; rep-struct is either
; 1. an add structure or
;    (make-add x y)
; 2. a mul structure
;    (make-mul x y)
; where x and y are rep-structs, numbers or symbols.

;A rep is either
;1. empty or
;2. (cons s a-rep) 
;    where s is a symbol, a structure or a symbol and a-rep is a rep.

;A numeric-expression is
; 1. an add structure or
;    (make-add x y)
; 2. a mul structure
;    (make-mul x y)
; where x and y are rep-structs or numbers.

;; numeric?: numeric-expression -> number
;; evaluates a numeric expression to find the value
(define (evaluate-expression a-rep)
  (cond
    [(add? a-rep) (+ (evaluate-expression (add-left a-rep)) (evaluate-expression (add-right a-rep)))]
    [(mul? a-rep) (* (evaluate-expression (mul-left a-rep)) (evaluate-expression(mul-right a-rep)))]
    [else a-rep]))

;; Tests
(check-expect (evaluate-expression (make-add 3 33)) 36)
(check-expect (evaluate-expression (make-mul 2 3)) 6)
(check-expect (evaluate-expression (make-add (make-mul 2 3) 4)) 10)
