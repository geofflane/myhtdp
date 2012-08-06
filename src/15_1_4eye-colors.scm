;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 15_1_4eye-colors) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct parent (children name date eyes))
;A parent is a structure:
; (make-parent loc n d e) 
;where loc is a list of children, n and e are symbols, and d is a number.
;A list-of-children is either
;1. empty or
;2. (cons p loc) where p is a parent and loc is a list of children.

;; Youngest Generation:
(define Gustav (make-parent empty 'Gustav 1988 'brown))

(define Fred&Eva (list Gustav))

;; Middle Generation:
(define Adam (make-parent empty 'Adam 1950 'yellow))
(define Dave (make-parent empty 'Dave 1955 'black))
(define Eva (make-parent Fred&Eva 'Eva 1965 'blue))
(define Fred (make-parent Fred&Eva 'Fred 1966 'pink))

(define Carl&Bettina (list Adam Dave Eva))

;; Oldest Generation:
(define Carl (make-parent Carl&Bettina 'Carl 1926 'green))
(define Bettina (make-parent Carl&Bettina 'Bettina 1926 'green))

;; eye-colors: parent ->  list-of-symbols
;; collects the eye colors of all the ancestors and this child in a list
(define (eye-colors a-parent)
  (cond
    [(empty? (parent-children a-parent)) (list (parent-eyes a-parent))]
    [else (append (list (parent-eyes a-parent)) (descendants-eye-colors (parent-children a-parent)))]))

;; descendants-eye-colors: parent -> list-of-symbols
;; finds the eye colors of all of the descendants of the parent
(define (descendants-eye-colors aloc)
  (cond
    [(empty? aloc) empty]
    [else (append (eye-colors (first aloc))
              (descendants-eye-colors (rest aloc)))]))

;; Tests
(check-expect (eye-colors Gustav) '(brown))
(check-expect (eye-colors Eva) '(blue brown))
(check-expect (eye-colors Carl) '(green yellow black blue brown))