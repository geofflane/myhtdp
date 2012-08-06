;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 9_2lists-of-stuff) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
empty
(cons 'ball empty)
(cons 'arrow (cons 'ball empty))
(cons 'clown empty)
(cons 'bow (cons 'arrow empty))
(cons 'clown (cons 'doll (cons 'arrow (cons 'ball empty))))

;; 9.2.2
;; All lists of two symbols belong to class list-of-symbols?.
;; list-of-symbols? = (cons s los)
;; los = (cons s los)

;; 9.2.3
; A list-of-booleans is either
; 1. the empty list, empty, or
; 2. (cons b bools) where b is a boolean and bools is a list of booleans.