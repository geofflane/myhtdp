;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 10_2_8recall) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
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

;; recall: symbol inventory -> inventory
;; removes toys named ty from the inventory inv
(define (recall ty inv)
  (cond
    [(empty? inv) empty]
    [else 
     (cond
       [(not (symbol=? (ir-name (first inv)) ty)) (cons (first inv) (recall ty (rest inv)))]
       [else (recall ty (rest inv))])]))


;; tests
(recall 'robot (cons (make-ir 'robot 1.00) (cons (make-ir 'slinky 2.00) empty)))
;; expected value: 
(cons (make-ir 'slinky 2.00) empty)

