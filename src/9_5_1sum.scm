;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 9_5_1sum) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
(define (sum a-list-of-nums)
  (cond
    [(empty? a-list-of-nums) 0]
    [else (+ (first a-list-of-nums) (sum (rest a-list-of-nums)))]))

;; Tests
(= (sum empty) 0)
(= (sum (cons 1.00 empty)) 1)
(= (sum (cons 17.05 (cons 1.22 (cons 2.59 empty)))) 20.86)

(= (sum empty) 0)
(= (sum (cons 2.59 empty)) 2.59)
(= (sum (cons 1.22 (cons 2.59 empty))) 3.81)