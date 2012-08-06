;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 8_7structs) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; 8.7.1
(define-struct personnel-record (name salary dob ssn))
; legal

(define-struct oops ())
; illegal. Needs variable names for the structure

(define-struct child (dob date (- date dob)))
; illegal. Can only be a variable name, not an expression. (- date dob) is an expression

(define-struct (child person) (dob date))
; illegal. Must be one name for the structure and a parenthesis enclosed list of variable names

(define-struct child (parents dob date))
; legal

;; 8.7.2
; this makes no sense to me

; 8.7.3
(define-struct ball (x y speed-x speed-y))

(number? (make-ball 1 2 3 4))
; false

(ball-speed-y (make-ball (+ 1 2) (+ 3 3) 2 3))
; 3

(ball-y (make-ball (+ 1 2) (+ 3 3) 2 3))
; 6

