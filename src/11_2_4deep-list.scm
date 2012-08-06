;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 11_2_4deep-list) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp")))))
; A deep-list is either
; 1. s where s is some symbol or
; 2. (cons dl empty), where dl is a deep list.

;; depth: list -> number
;; count the number of cons that were used to construct a deep list
(define (depth dl)
  (cond
    [(empty? dl) 0]
    [(cons? (first dl)) (+ (how-many (first dl)) (depth (first dl)) (depth (rest dl)))]
    [else (how-many dl)]))

;; how-many: list  ->  number
;; to count the number of items in a list
(define (how-many a-list)
  (cond
    [(empty? a-list) 0]
    [else (+ (how-many (rest a-list)) 1)]))

;; make-deep: symbol number -> deep-list
;; make a list of symbols s, n deep
(define (make-deep s n)
  (cond
    [(zero? n) s]
    [else (cons (make-deep s (sub1 n)) empty)]))

;; tests
(= 0 (depth empty))
(= 1 (depth (cons 1 empty)))
(= 2 (depth (cons 1 (cons 1 empty))))
(= 3 (depth (cons (cons 1 empty) (cons 1 empty))))
(= 4 (depth (cons (cons 1 empty) (cons (cons 1 empty) empty))))
(= 8 (depth (cons (cons (cons (cons 1 empty) empty) empty) (cons (cons 1 empty) (cons (cons 1 empty) empty)))))

(make-deep 'foo 1)
(cons 'foo empty) ;; expected

(make-deep 'foo 3)
(cons (cons (cons 'foo empty) empty) empty) ;; expected
(= 3 (depth (make-deep 'foo 3)))
(= 8 (depth (make-deep 'foo 8)))