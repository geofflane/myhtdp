;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 10_2_9name-robot) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
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

;; name-robot: inventory -> inventory
;; replaces robot toys with r2d2 toys in inventory
(define (name-robot inv)
  (cond
    [(empty? inv) empty]
    [else 
     (cond
       [(symbol=? (ir-name (first inv)) 'robot) 
        (cons (make-ir 'r2d2 (ir-price (first inv))) (name-robot (rest inv)))]
       [else (cons (first inv) (name-robot (rest inv)))])]))

;; name-robot: symbol symbol inventory -> inventory
;; replaces old toy name with new toy name in inventory
(define (substitute new old inv)
  (cond
    [(empty? inv) empty]
    [else 
     (cond
       [(symbol=? (ir-name (first inv)) old) 
        (cons (make-ir new (ir-price (first inv))) (name-robot (rest inv)))]
       [else (cons (first inv) (name-robot (rest inv)))])]))

;; tests
(name-robot (cons (make-ir 'robot 1.00) (cons (make-ir 'slinky 2.00) empty)))
;; expected value: 
(cons (make-ir 'r2d2 1.00) (cons (make-ir 'slinky 2.00) empty))

(substitute 'r2d2 'robot (cons (make-ir 'robot 1.00) (cons (make-ir 'slinky 2.00) empty)))
;; expected value: 
(cons (make-ir 'r2d2 1.00) (cons (make-ir 'slinky 2.00) empty))