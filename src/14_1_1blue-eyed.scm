;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 14_1_1blue-eyed) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
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

;; blue-eyed-ancestor? : ftn  ->  boolean
;; to determine whether a-ftree contains a child
;; structure with 'blue in the eyes field
;; version 2: using an or-expression
(define (blue-eyed-ancestor? a-ftree)
  (cond
    [(empty? a-ftree) false]
    [else (or (symbol=? (child-eyes a-ftree) 'blue)
              (or (blue-eyed-ancestor? (child-father a-ftree))
                  (blue-eyed-ancestor? (child-mother a-ftree))))]))

; empty
(cond
  [(empty? empty) false]
  [else (or (symbol=? (child-eyes empty) 'blue)
            (or (blue-eyed-ancestor? (child-father empty))
                (blue-eyed-ancestor? (child-mother empty))))])
(cond
  [true false]
  [else (or (symbol=? (child-eyes empty) 'blue)
            (or (blue-eyed-ancestor? (child-father empty))
                (blue-eyed-ancestor? (child-mother empty))))])
false

; Carl
(cond
  [(empty? Carl) false]
  [else (or (symbol=? (child-eyes Carl) 'blue)
            (or (blue-eyed-ancestor? (child-father Carl))
                (blue-eyed-ancestor? (child-mother Carl))))])
(cond
  [false false]
  [else (or (symbol=? (child-eyes Carl) 'blue)
            (or (blue-eyed-ancestor? (child-father Carl))
                (blue-eyed-ancestor? (child-mother Carl))))])

(or (symbol=? (child-eyes Carl) 'blue)
    (or (blue-eyed-ancestor? (child-father Carl))
        (blue-eyed-ancestor? (child-mother Carl))))

(or (symbol=? 'green 'blue)
    (or (blue-eyed-ancestor? (child-father Carl))
        (blue-eyed-ancestor? (child-mother Carl))))
(or false
    (or (blue-eyed-ancestor? (child-father Carl))
        (blue-eyed-ancestor? (child-mother Carl))))
(or false
    (or (blue-eyed-ancestor? empty)
        (blue-eyed-ancestor? (child-mother Carl))))
(or false
    (or false
        (blue-eyed-ancestor? (child-mother Carl))))
(or false
    (or false
        false))
(or false false)
false