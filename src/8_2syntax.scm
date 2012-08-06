;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 8_2syntax) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; 8.2.1
; 1. x
; x is a variable expresssion

; 2. (= y z)
; This is an expression composed of a primitive '=' and two variables properly enclosed in parenthesis

; 3. (= (= y z) 0)
; Similar to the previous, but with a proper nested expression in plce of a variable

; 1. (3 + 4)
; The only valid place for a primitive '+' is immediately following a left parenthesis

; 2. empty?(l)
; A variable 'empty?' must be enclosed in parenthesis

; 3. (x)
; A variable is required to have one or more expressions that follow it when it is enclosed in parenthesis


;; 8.2.2
; 1. (define (f x) x)
; define is followed by a group of parenthesis encolosed variable which is followed by a variable 'x'

; 2. (define (f x) y)
; define is followed by a group of parenthesis encolosed variable which is followed by a variable 'y'

; 3. (define (f x y) 3)
; define is followed by a group of parenthesis encolosed variable which is followed by a constant '3'

; 1. (define (f 'x) x)
; define must be followed by a group of variables. 'x is a constant symbolic value

; 2. (define (f x y z) (x))
; the group of variable must be followed by a legal expression. (x) is not a legal expression

; 3. (define (f) 10) 
; define must be followed by a group of at least 2 variable. 'f' is only a single variable

;; 8.2.3
; 1. (x)
; illegal. A variable is required to have one or more expressions that follow it when it is enclosed in parenthesis

; 2. (+ 1 (not x))
; legal. A primitive followed by a constant, followed by a legal expression which consists of 2 variables

; 3. (+ 1 2 3)
; legal. A primitive followed by 3 constant values

;; 8.2.4
; 1. (define (f x) 'x)
; legal. define is followed by a group of parenthesis encolosed variable which is followed by a constant symbolic value 'x

; 2. (define (f 'x) x)
; illegal. define must be followed by a group of variables. 'x is a constant symbolic value

; 3. (define (f x y) (+ 'y (not x)))
; legal. define is followed by a group of parenthesis encolosed variable which is followed by another 
;        valid complex expression.


