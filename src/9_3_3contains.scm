;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 9_3_3contains) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; contains? : symbol list-of-symbols  ->  boolean
;; to determine whether the symbol occurs in a-list-of-symbols

;; Template:
;; (define (f a-list-of-symbols)
;;  (cond
;;    [(empty? a-list-of-symbols) ... ]
;;    [else ... (first a-list-of-symbols) ...)]))

;; A list-of-symbols is either
;; 1. the empty list, empty, or
;; 2. (cons s los) where s is a symbol and los is a list of symbols.
(define (contains? sym a-list-of-symbols)
  (cond
    [(empty? a-list-of-symbols) false]
    [else (or (symbol=? (first a-list-of-symbols) sym)
              (contains? sym (rest a-list-of-symbols)))]))

;; Tests
(boolean=? (contains? 'doll empty) false)
(boolean=? (contains? 'doll (cons 'ball empty)) false)
(boolean=? (contains? 'doll (cons 'arrow (cons 'doll empty))) true)
(boolean=? (contains? 'doll (cons 'bow (cons 'arrow (cons 'ball empty)))) false)