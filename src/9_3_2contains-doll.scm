;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 9_3_2contains-doll) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (contains-doll? a-list-of-symbols)
  (cond
    [(empty? a-list-of-symbols) false]
    [else (or (symbol=? (first a-list-of-symbols) 'doll)
              (contains-doll? (rest a-list-of-symbols)))]))

;; Tests
(boolean=? (contains-doll? empty) false)
(boolean=? (contains-doll? (cons 'ball empty)) false)
(boolean=? (contains-doll? (cons 'arrow (cons 'doll empty))) true)
(boolean=? (contains-doll? (cons 'bow (cons 'arrow (cons 'ball empty)))) false)