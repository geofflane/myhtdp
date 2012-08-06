;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2_4_4logical_errors) (read-case-sensitive #t) (teachpacks ((lib "convert.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.ss" "teachpack" "htdp")))))
(define (somef x)
  (sin x x))

(somef 10 20)
;; somef: this procedure expects 1 argument, here it is provided 2 arguments

(somef 10)
;; sin: expects 1 argument, given 2: 10 10