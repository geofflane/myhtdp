;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 3_3_5height) (read-case-sensitive #t) (teachpacks ((lib "convert.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.ss" "teachpack" "htdp")))))
;; Contract: height : number number  ->  number

;; Purpose: to compute the height a rocket reaches in a given period of time

;; Example: (height 1 10) should produce 50

(define (height acceleration time)
  (* 0.5 (speed-at-time acceleration time) time))

(define (speed-at-time acceleration time)
  (* acceleration time))