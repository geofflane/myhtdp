;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 12_4_1words) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; A word is either
; 1. empty, or
; 2. (cons a w) where a is a symbol ('a, 'b, ..., 'z) and w is a word.

; A list-of-words is eihter
; 1. empty or
; 2. (cons w low) where w is a word and low is a list-of-words.

; Example words:
; (define hello-word (cons 'h (cons 'e (cons 'l (cons 'l (cons 'o empty))))))
; (define ball-word (cons 'b (cons 'a (cons 'l (cons 'l empty)))))
; (define low (cons hello-word (cons ball-word empty)))

