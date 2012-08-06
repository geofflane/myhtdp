;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 7_5_3checked_make_vec) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
(define-struct vec (x y))
;; A vec is a structure:
;;          (make-vec x y)
;;    where x and y are positive numbers

;; checked-make-vec : Scheme-value Scheme-value ->  vec
;; creates a vector if the 2 values passed are positive numbers
(define (checked-make-vec x y)
  (cond
    [(and (positive-number? x) (positive-number? y)) (make-vec x y)]
    [else (error 'checked-make-vec "x and y must be positive numbers")]))

(define (positive-number? n)
  (and (number? n) (< 0 n)))

;; tests
(positive-number? 1)
(positive-number? 100)
(not (positive-number? 0))
(not (positive-number? -1))

(checked-make-vec 1 1)