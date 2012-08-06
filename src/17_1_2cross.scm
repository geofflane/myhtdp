;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 17_1_2cross) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; cross: list-of-symbols list-of-number -> list of lists
;; combines all the symbols with all of the numbers and returns a list of lists
(define (cross los lon)
  (cond
    [(empty? los) empty]
    [else (append (combine (first los) lon)  (cross (rest los) lon))]))

;; combine: symbol list-of-numbers -> list-of-lists
;; combine the symbole with each number in lon and return a list of lists
(define (combine a-sym lon)
  (cond
    [(empty? lon) empty]
    [else (cons (list a-sym (first lon)) (combine a-sym (rest lon)))]))

;; Tests
(check-expect (cross empty empty) empty)
(check-expect (cross '(a b c) empty) empty)
(check-expect (cross empty '(1 2)) empty)
(check-expect (cross '(a b c) '(1 2)) (list (list 'a 1) (list 'a 2) (list 'b 1) (list 'b 2) (list 'c 1) (list 'c 2)))