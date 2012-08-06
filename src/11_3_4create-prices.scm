;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 11_3_4create-prices) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))

;; create-prices: number -> list-of-numbers
;; create a list-of-numbers containing numbers between .10 and 10.00 in increments of .10
(define (create-prices n)
  (cond
    [(zero? n) empty]
    [else (cons (* (add1 (random 100)) .10) (create-prices (sub1 n)))]))

;; dollar-store?: list-of-numbers  -> boolean
;; checks whether all of the prices are below $1
(define (dollar-store? a-list-of-numbers)
  (cond
    [(empty? a-list-of-numbers) true]
    [(<= (first a-list-of-numbers) 1) (dollar-store? (rest a-list-of-numbers))]
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

;; tests
(define prices1 (create-prices 2))
(boolean=? (dollar-store? prices1) (check-range? 0 1 prices1))

(define prices2 (create-prices 10))
(boolean=? (dollar-store? prices2) (check-range? 0 1 prices2))

(define prices3 (create-prices 20))
(boolean=? (dollar-store? prices3) (check-range? 0 1 prices3))