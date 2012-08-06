;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 10_2_1contains-doll) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; An inventory-record (short: ir) is a structure: 
;; (make-ir s n)  
;; where s is a symbol and n is a (positive) number.

(define-struct ir (name price))

;; (define (f-of-ir ir)
;; ... (ir-name ir) ...
;; ... (ir-price ir) ...)

;; An inventory is either
;; 1. empty or
;; 2. (cons ir inv) 
;;     where ir is an inventory record and inv is an inventory.
;; Template:
;; (define (f-of-inventory inventory)
;;  (cond
;;    [(empty? inventory) ... ]
;;    [else ... (first inventory) ...)]))

;; contains-doll?: inventory -> boolean
;; finds if the inventory contains a doll
(define (contains-doll? inventory)
  (cond
    [(empty? inventory) false]
    [else (or (symbol=? (ir-name (first inventory)) 'doll)
              (contains-doll? (rest inventory)))]))

;; Tests
(boolean=? (contains-doll? empty) false)
(boolean=? (contains-doll? (cons (make-ir 'ball 1.00) empty)) false)
(boolean=? (contains-doll? (cons (make-ir 'arrow 2.50) (cons (make-ir 'doll 5.99) empty))) true)
(boolean=? (contains-doll? (cons (make-ir 'bow 2.67) (cons (make-ir 'arrow 2.50) (cons (make-ir 'ball 1.00) empty)))) false)


;; contains? : symbol inventory  ->  boolean
;; to determine whether the symbol occurs in the inventory
(define (contains? sym inventory)
  (cond
    [(empty? inventory) false]
    [else (or (symbol=? (ir-name (first inventory)) sym)
              (contains? sym (rest inventory)))]))

;; Tests
(boolean=? (contains? 'doll empty) false)
(boolean=? (contains? 'doll (cons (make-ir 'ball 1.00) empty)) false)
(boolean=? (contains? 'doll (cons (make-ir 'arrow 2.50) (cons (make-ir 'doll 5.99) empty))) true)
(boolean=? (contains? 'doll (cons (make-ir 'bow 2.67) (cons (make-ir 'arrow 2.50) (cons (make-ir 'ball 1.00) empty)))) false)