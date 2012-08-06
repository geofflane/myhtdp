;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 15_1_3count-descendants) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
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


;; count-descendants: parent -> number
;; how many descendants including a-parent in the family tree
(define (count-descendants a-parent)
  (cond
    [(empty? (parent-children a-parent)) 1]
    [else (+ 1 (count-children (parent-children a-parent)))]))

;; count-children : list-of-children  ->  number
;; count a list-of-children and all of their descendants
(define (count-children aloc)
  (cond
    [(empty? aloc) 0]
    [else (+ (count-descendants (first aloc))
              (count-children (rest aloc)))]))

;; count-proper-descendants: parent -> number
;; how many descendants excluding a-parent in the family tree
(define (count-proper-descendants a-parent)
  (cond
    [(empty? (parent-children a-parent)) 0]
    [else (count-children (parent-children a-parent))]))


;; Tests
(check-expect (count-descendants Gustav) 1)
(check-expect (count-descendants Eva) 2)
(check-expect (count-descendants Carl) 5)

(check-expect (count-proper-descendants Gustav) 0)
(check-expect (count-proper-descendants Eva) 1)
(check-expect (count-proper-descendants Carl) 4)

