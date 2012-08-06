;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 9_5_5convert) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp")))))
;; A list-of-numbers is either
;; 1. the empty list, empty, or
;; 2. (cons n lon) where n is a number and lon is a list-of-numbers.

;; Template:
;; (define (f-of-numbers list-of-numbers)
;;  (cond
;;    [(empty? list-of-numbers) ...]
;;    [... (first list-of-numbers) ...]))

;; convert: list-of-numbers  -> number
;; converts a list of digits into a number where the first digit is the least significant
(define (convert a-list-of-numbers)
  (cond
    [(empty? a-list-of-numbers) 0]
    [else (+ (first a-list-of-numbers) (* 10 (convert (rest a-list-of-numbers))))]))

;; check-guess-for-list: list-of-numbers number -> symbol
;; compares the list of digits as a number to the target  
(define (check-guess-for-list guess target)
  (cond
    [(> target (convert guess)) 'TooSmall]
    [(< target (convert guess)) 'TooLarge]
    [else 'Perfect]))

(= (convert (cons 1 (cons 2 (cons 3 empty)))) 321)
(= (convert (cons 6 (cons 5 (cons 4 (cons 3 empty))))) 3456)
(= (convert (cons 1 (cons 6 (cons 5 (cons 4 (cons 3 empty)))))) 34561)