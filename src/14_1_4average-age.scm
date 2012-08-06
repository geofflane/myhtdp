;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 14_1_4average-age) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
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

;; average-age: child current-year ->  number
;; compute the average age of all of the people in the family tree
(define (average-age a-ftree current-year)
  (cond
    [(empty? a-ftree) 0]
    [else (/ (sum-ages a-ftree current-year) (count-persons a-ftree))]))

;; sum-ages: child current-year ->  number
;; add up all of the ages of the people in the family tree
(define (sum-ages a-ftree current-year)
  (cond
    [(empty? a-ftree) 0]
    [else (+ (- current-year (child-date a-ftree)) 
             (sum-ages (child-father a-ftree) current-year) 
             (sum-ages (child-mother a-ftree) current-year))]))

;; count-persons: child -> number
;; count the number of people in the family tree
(define (count-persons a-ftree)
  (cond
    [(empty? a-ftree) 0]
    [else (+ 1 (count-persons (child-father a-ftree)) (count-persons (child-mother a-ftree)))]))

;; tests
(= 0 (count-persons empty))
(= 5 (count-persons Gustav))
(= 3 (count-persons Eva))

(= 0 (sum-ages empty 2008))
(= 207 (sum-ages Eva 2008))
(= 204 (sum-ages Eva 2007))

(= 0 (average-age empty 2008))
(= 69 (average-age Eva 2008))
