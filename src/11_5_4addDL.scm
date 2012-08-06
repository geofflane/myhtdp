;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 11_5_4addDL) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))

; A deep-list is either
; 1. s where s is some symbol or
; 2. (cons dl empty), where dl is a deep list.

;; addDL: deep-list deep-list -> deep-list
;; consumes two deep lists, representing the natural numbers n and m, and produces a deep list representing n + m
(define (addDL n m)
  (make-deep 'int (+ (depth n) (depth m))))

;; make-deep: symbol number -> deep-list
;; make a list of symbols s, n deep
(define (make-deep s n)
  (cond
    [(zero? n) s]
    [else (cons (make-deep s (sub1 n)) empty)]))

;; depth: list -> number
;; count the number of cons that were used to construct a deep list
(define (depth dl)
  (cond
    [(or (not (cons? dl)) (empty? dl)) 0]
    [(cons? (first dl)) (+ (length (first dl)) (depth (first dl)) (depth (rest dl)))]
    [else (length dl)]))

;; Test
(= 0 (depth (make-deep 'int 0)))
(= 0 (depth (addDL empty empty)))
(= 1 (depth (addDL empty (make-deep 'int 1))))
(= 1 (depth (addDL (make-deep 'int 1) empty)))
(= 7 (depth (addDL (make-deep 'int 3) (make-deep 'int 4))))
(= 8 (depth (addDL (make-deep 'int 4) (make-deep 'int 4))))