;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 9_1_2first_rest) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
(define l (cons 10 (cons 20 (cons 5 empty))))

(rest l)
; (cons 20 (cons 5 empty))

(first (rest l))
; 20

(rest (rest l))
; (cons 5 empty)

(first (rest (rest l)))
; 5 

(rest (rest (rest l))) 
; empty