;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 10_2_7raise-prices) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; An inventory-record (short: ir) is a structure: 
;; (make-ir s n)  
;; where s is a symbol and n is a (positive) number.

(define-struct ir (name price))

;; (define (f-of-ir ir)
;; ... (ir-name ir) ...
;; ... (ir-price ir) ...
;; ... (ir-pic ir) ...)

;; inventory is either
;; 1. empty or
;; 2. (cons ir an-inv) where ir is an inventory-record and an-inv is an inventory 

;; raise-prices: inventory  ->  inventory
;; raise the prices of each ir in an inventory by 5%
(define (raise-prices an-inv)
  (cond
    [(empty? an-inv) empty]
    [else (cons (raise 0.05 (first an-inv)) (raise-prices (rest an-inv)))]))

;; raise: number ir -> ir
;; raise the price of an inventory record (an-ir) by a given percent
(define (raise percent an-ir)
  (make-ir (ir-name an-ir) (* (+ 1 percent) (ir-price an-ir))))

;; Tests
(define inv (cons (make-ir 'robot 1.00) (cons (make-ir 'slinky 2.00) empty)))
(raise-prices inv)
(cons (make-ir 'robot 1.05) (cons (make-ir 'slinky 2.10) empty))
