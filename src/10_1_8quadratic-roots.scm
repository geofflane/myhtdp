;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 10_1_8quadratic-roots) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; quadratic-roots: number number number -> Scheme-type
;; determine the quadratic-roots of three numbers
(define (quadratic-roots a b c)
  (cond
    [(= a 0) 'degenerate]
    [(< (* 4 a c) (sqr b)) (cons (double-solution1 a b c) (cons (double-solution2 a b c) empty))]
    [(> (* 4 a c) (sqr b)) 'none]
    [else (single-solution a b)]))

;; b2 = 4 · a · c has a single solution
(define (single-solution a b)
  (/ (- 0 b) (* 2 a)))

;; b2 > 4 · a · c has two solutions
(define (double-solution1 a b c)
  (/ 
   (+ (- 0 b) (sqrt (- (sqr b) (* 4 a c))))
   (* 2 a)))

;; b2 > 4 · a · c has two solutions
(define (double-solution2 a b c)
  (/ 
   (- (- 0 b) (sqrt (- (sqr b) (* 4 a c))))
   (* 2 a)))


(symbol=? 'degenerate (quadratic-roots 0 1 -1))
(symbol=? 'none (quadratic-roots 2 0 2))

(= -1 (quadratic-roots 2 4 2))
(quadratic-roots 2 6 2)
