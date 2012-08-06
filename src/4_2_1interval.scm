;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 4_2_1interval) (read-case-sensitive #t) (teachpacks ((lib "convert.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.ss" "teachpack" "htdp")))))
(define (is-between-4-7? num)
  (and (> num 3) (<= num 7)))

(define (is-between-3-7? num)
  (and (>= num 3) (<= num 7)))

(define (is-between-3-8? num)
  (and (>= num 3) (< num 9)))

(define (is-2-or-10? num)
  (or (= num 2) (= num 10)))

(define (is-not-between-1-3? num)
  (not (>= num 1) (< num 3)))