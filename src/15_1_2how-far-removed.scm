;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 15_1_2how-far-removed) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
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

(define Grandpa (make-parent (list Carl) 'Gp 1900 'green))
(define None (make-parent (list Adam Dave) 'None 1945 'green))

;; how-far-removed: parent -> number
;; how many generations down is a blue-eyed  person
(define (how-far-removed a-parent)
  (cond
    [(not (blue-eyed-descendant? a-parent)) false]
    [(symbol=? (parent-eyes a-parent) 'blue) 0]
    [(blue-eyed-children-only? (parent-children a-parent)) 1]
    [else (+ 1 (how-far-children (parent-children a-parent)))]))

;; how-far-children: list-of-children -> number
;; how many generations down is a blue-eyed person from aloc
(define (how-far-children aloc)
  (cond
    [(empty? aloc) 0]
    [else (+ (how-far-removed (first aloc))
             (how-far-children (rest aloc)))]))

;; blue-eyed-children-only?: list-of-children -> boolean
;; does aloc contain anyone with blue eyese?
(define (blue-eyed-children-only? aloc)
  (cond
    [(empty? aloc) false]
    [else (or (symbol=? (parent-eyes (first aloc)) 'blue)
              (blue-eyed-children-only? (rest aloc)))]))

;; blue-eyed-descendant? : parent  ->  boolean
;; to determine whether a-parent any of the descendants (children, 
;; grandchildren, and so on) have 'blue in the eyes field
(define (blue-eyed-descendant? a-parent)
  (or (symbol=? (parent-eyes a-parent) 'blue)
      (blue-eyed-children? (parent-children a-parent))))

;; blue-eyed-children? : list-of-children  ->  boolean
;; to determine whether any of the structures in aloc is blue-eyed
;; or has any blue-eyed descendant
(define (blue-eyed-children? aloc)
  (cond
    [(empty? aloc) false]
    [else (or (blue-eyed-descendant? (first aloc))
              (blue-eyed-children? (rest aloc)))]))

;; Tests
(check-expect (how-far-removed Eva) 0)
(check-expect (how-far-removed Carl) 1)
(check-expect (how-far-removed Grandpa) 2)

(check-expect (how-far-removed Gustav) false)
(check-expect (how-far-removed None) false)