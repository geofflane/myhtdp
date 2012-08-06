;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 9_5_4check-range) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; A list-of-numbers is either
;; 1. the empty list, empty, or
;; 2. (cons n lon) where n is a number and lon is a list-of-numbers.

;; Template:
;; (define (f-of-numbers list-of-numbers)
;;  (cond
;;    [(empty? list-of-numbers) ...]
;;    [... (first list-of-numbers) ...]))

;; check-range1? list-of-numbers  -> boolean
;; checks whether all of the numbers are between 5 and 95
;; 5                95
;; [----------------]
(define (check-range1? a-list-of-numbers)
  (cond
    [(empty? a-list-of-numbers) true]
    [(and (>= (first a-list-of-numbers) 5)
          (<= (first a-list-of-numbers) 95)) (check-range1? (rest a-list-of-numbers))]
    [else false]))

;; check-range1? min max list-of-numbers  -> boolean
;; checks whether all of the numbers are between min and max
;; where min and max are numbers
;; min             max
;; [----------------]
(define (check-range? min max a-list-of-numbers)
  (cond
    [(empty? a-list-of-numbers) true]
    [(and (>= (first a-list-of-numbers) min)
          (<= (first a-list-of-numbers) max)) (check-range? min max (rest a-list-of-numbers))]
    [else false]))

;; Tests
(check-range1? empty)
(not (check-range1? (cons 0 (cons 95 (cons 45 empty)))))
(check-range1? (cons 5 (cons 95 (cons 45 empty))))


(check-range? 5 95 empty)
(not (check-range? 5 95 (cons 0 (cons 95 (cons 45 empty)))))
(check-range? 5 95 (cons 5 (cons 95 (cons 45 empty))))