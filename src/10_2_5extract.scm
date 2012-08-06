;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 10_2_5extract) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; An inventory-record (short: ir) is a structure: 
;; (make-ir s n)  
;; where s is a symbol and n is a (positive) number.

(define-struct ir (name price))

;; (define (f-of-ir ir)
;; ... (ir-name ir) ...
;; ... (ir-price ir) ...
;; ... (ir-pic ir) ...)

;; extract1 : inventory  ->  inventory
;; to create an inventory from an-inv for all
;; those items that cost more than $1
(define (extract>1 an-inv)
  (cond
    [(empty? an-inv) empty]
    [else (cond
            [(> (ir-price (first an-inv)) 1.00) (cons (first an-inv) (extract>1 (rest an-inv)))]
            [else (extract>1 (rest an-inv))])]))

;; tests
(define inv (cons (make-ir 'Barbie 17.95) (cons (make-ir 'key-chain .55) (cons (make-ir 'robot 22.05) empty))))
(extract>1 empty)
empty ;; expected

(extract>1 inv)
(cons (make-ir 'Barbie 17.95) (cons (make-ir 'robot 22.05) empty)) ;; expected