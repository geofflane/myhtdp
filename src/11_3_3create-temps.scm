;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 11_3_3create-temps) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))

;; create-temps: number number number -> list-of-numbers
;; create a list-of-numbers containing n numbers between low and high inclusive
;;  [------]
;; low   high
(define (create-temps n low high)
  (cond
    [(zero? n) empty]
    [else (cons (+ (random (- (add1 high) low)) low) (create-temps (sub1 n) low high))]))

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
(check-range? 0 10 (create-temps 25 0 10))
(check-range? 10 25 (create-temps 25 10 25))

; In some ways the two functions should check each other because for either to give the correct behavior, they
; both need to behave correctly. These are sort of inverse functions and inverse functions can be used to test
; each other. 
; create-temps generated random data though, so you can not guaruntee that it is testing edge cases.