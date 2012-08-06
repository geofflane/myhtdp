;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 9_5_2how-many) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; A list-of-symbols is either
;; 1. the empty list, empty, or
;; 2. (cons s los) where s is a symbol and los is a list-of-symbols.

;; A list-of-numbbers is either
;; 1. the empty list, empty, or
;; 2. (cons n lon) where n is a number and lon is a list-of-numbers.

;; Template:
;; (define (f-of-symbols a-list-of-symbols)
;;  (cond
;;    [(empty? a-list-of-symbols) ...]
;;    [... (first a-list-of-symbols) ...]))

;; how-many-symbols: list-of-symbols ->  number
;; to count the number of the symbols in a-list-of-symbols
(define (how-many-symbols a-list-of-symbols)
  (cond
    [(empty? a-list-of-symbols) 0]
    [else (+ (how-many-symbols (rest a-list-of-symbols)) 1)]))

;; how-many-numbers: list-of-numbers  ->  number
;; to count the number of the numbers in a-list-of-numbers
(define (how-many-numbers a-list-of-numbers)
  (cond
    [(empty? a-list-of-numbers) 0]
    [else (+ (how-many-symbols (rest a-list-of-numbers)) 1)]))

(define los (cons 'bow (cons 'arrow (cons 'ball empty))))
(define lon (cons 1 (cons 2 (cons 3 empty))))

(= (how-many-symbols los) 3)
(= (how-many-numbers lon) 3)