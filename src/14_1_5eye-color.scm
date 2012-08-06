;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 14_1_5eye-color) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct child (father mother name date eyes))

;; Oldest Generation:
(define Carl (make-child empty empty 'Carl 1926 'green))
(define Bettina (make-child empty empty 'Bettina 1926 'green))

;; Middle Generation:
(define Adam (make-child Carl Bettina 'Adam 1950 'yellow))
(define Dave (make-child Carl Bettina 'Dave 1955 'black))
(define Eva (make-child Carl Bettina 'Eva 1965 'blue))
(define Fred (make-child empty empty 'Fred 1966 'pink))

;; Youngest Generation: 
(define Gustav (make-child Fred Eva 'Gustav 1988 'brown))

; A family-tree-node (short: ftn) is either
; 1. empty; or
; 2. (make-child f m na da ec) 
;   where f and m are ftns, na
;   and ec are symbols, and da is a number.

;; fun-for-ftn : ftn  ->  ???
;(define (fun-for-ftn a-ftree)
;  (cond
;    [(empty? a-ftree) ...]
;    [else
;      ... (fun-for-ftn (child-father a-ftree)) ...
;      ... (fun-for-ftn (child-mother a-ftree)) ...
;      ... (child-name a-ftree) ...
;      ... (child-date a-ftree) ...
;      ... (child-eyes a-ftree) ...]))

;; eye-colors: child ->  list-of-symbols
;; collects the eye colors of all the ancestors and this child in a list
(define (eye-colors a-ftree)
  (cond
    [(empty? a-ftree) empty]
    [else (append (list (child-eyes a-ftree))
          (eye-colors (child-father a-ftree))
          (eye-colors (child-mother a-ftree)))]))

;; tests
(eye-colors empty)
empty

(eye-colors Gustav)
(list 'brown 'pink 'blue 'green 'green)

(eye-colors Eva)
(list 'blue 'green 'green)