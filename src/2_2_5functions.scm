;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2_2_5functions) (read-case-sensitive #t) (teachpacks ((lib "convert.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.ss" "teachpack" "htdp")))))
(define (f n)
  (+ (/ n 3) 2))

(define (g n)
  (+ (sqr n) 10))

(define (h n)
 (+ (/ (sqr n) 2) 20))

(define (j n)
 (- (/ 1 n) 2))