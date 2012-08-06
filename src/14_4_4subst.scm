;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 14_4_4subst) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct add (left right))
(define-struct mul (left right))

;A rep is either
;1. empty or
;2. (cons s a-rep) 
;    where s is a symbol, a structure or a symbol and a-rep is a rep.

; subst: symbol number rep -> rep
; substitute all of the instances of V with the value of N in a-rep
(define (subst V N a-rep)
  (cond
    [(add? a-rep) (make-add (subst V N (add-left a-rep)) (subst V N (add-right a-rep)))]
    [(mul? a-rep) (make-mul (subst V N (mul-left a-rep)) (subst V N (mul-right a-rep)))]
    [(and (symbol? a-rep) (symbol=? V a-rep)) N]
    [else a-rep]))

;; Tests
(check-expect (subst 'a 1 (make-add 1 2)) (make-add 1 2))
(check-expect (subst 'a 1 (make-add 'a 2)) (make-add 1 2))

(check-expect (subst 'a 1 (make-mul 1 2)) (make-mul 1 2))
(check-expect (subst 'a 1 (make-mul 'a 2)) (make-mul 1 2))

(check-expect (subst 'a 5 (make-mul (make-add 'a 3) (make-mul 4 'a))) (make-mul (make-add 5 3) (make-mul 4 5)))