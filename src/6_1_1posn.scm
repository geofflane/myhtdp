;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6_1_1posn) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (distance-to-0 a-posn)
  (sqrt
    (+ (sqr (posn-x a-posn))
       (sqr (posn-y a-posn)))))

; 1. (distance-to-0 (make-posn 3 4))

(sqrt
    (+ (sqr (posn-x a-posn))
       (sqr (posn-y  (make-posn 3 4)))))
(sqrt
    (+ (sqr (posn-x a-posn))
       (sqr 4)))

(sqrt
    (+ (sqr (posn-x a-posn))
       16))

(sqrt
    (+ (sqr (posn-x (make-posn 3 4)))
       16))

(sqrt
    (+ (sqr 3) 16))

(sqrt (+ 9 16))

(sqrt 25)

5

; 2. (distance-to-0 (make-posn (* 2 3) (* 2 4)))

(distance-to-0 (make-posn (* 2 3) 8))

(distance-to-0 (make-posn 6 8))

; ... like 1

; 3. (distance-to-0 (make-posn 12 (- 6 1)))

(distance-to-0 (make-posn 12 5))

; ... like 1