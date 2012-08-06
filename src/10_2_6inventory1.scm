;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 10_2_6inventory1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
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

;; inventory1 is either
;; 1. empty or
;; 2. an inventory where 
;; 2a. (> (ir-price (first inventory)) 1.00) and
;; 2b. (rest inventory) is an inventory1

;; extract1 : inventory  ->  inventory1
;; to create an inventory1 from an-inv for all
;; those items that cost more than $1
(define (extract1 an-inv)
  (cond
    [(empty? an-inv) empty]
    [else (cond
            [(<= (ir-price (first an-inv)) 1.00) (cons (first an-inv) (extract1 (rest an-inv)))]
            [else (extract1 (rest an-inv))])]))
