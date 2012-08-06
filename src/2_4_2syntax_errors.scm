;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2_4_2syntax_errors) (read-case-sensitive #t) (teachpacks ((lib "convert.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.ss" "teachpack" "htdp")))))
;; (define (f 1)
;;  (+ x 10))
;; define: expected a name for the function's 1st argument, but found a number
(define (f x)
  (+ x 10))

;; (define (g x)
;;   + x 10)
;; define: expected only one expression for the function body, but found at least one extra part
(define (g x)
  (+ x 10))

;; (define h(x) 
;;   (+ x 10))
;; define: expected only one expression after the defined name h, but found one extra part
(define (h x) 
  (+ x 10))