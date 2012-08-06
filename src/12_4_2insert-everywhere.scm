;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 12_4_2insert-everywhere) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
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


(define (arrangements a-word)
  (cond
    [(empty? a-word) (cons empty empty)]
    [else (insert-everywhere/in-all-words (first a-word) 
            (arrangements (rest a-word)))]))

;; insert-everywhere/in-all-words: symbol list-of-words -> list-of-words
;; The result is a list of words like its second argument, but with the first argument inserted between all 
;; letters and at the beginning and the end of all words of the second argument.
(define (insert-everywhere/in-all-words letter low)
  (cond
    [(empty? low) empty]
    [else (cons (insert-everywhere letter (first low)) (insert-everywhere/in-all-words letter (rest low)))]))

;; insert-everywhere: symbol list -> list
;; insert the letter into all the positions in a-word
(define (insert-everywhere letter a-word)
  (cond
    [(empty? a-word) (cons letter empty)]
    [else (cons (combine letter a-word) 
                (insert-everywhere (combine (first a-word) letter) (rest a-word)))]))

;; combine: symbol-or-list symbol-or-list -> list
;; combine two Scheme-types so they form a list
(define (combine first second)
  (cond
    [(and (symbol? first) (symbol? second)) (cons first (cons second empty))]
    [(symbol? first) (cons first second)]
    [(symbol? second) (append first (cons second empty))]
    [else (append first second)]))

;; Tests
(combine 'a 'b)
(cons 'a (cons 'b empty))

(combine 'a (cons 'b empty))
(cons 'a (cons 'b empty))

(combine (cons 'a empty) 'b)
(cons 'a (cons 'b empty))

(combine (cons 'a empty) (cons 'b empty))
(cons 'a (cons 'b empty))

(insert-everywhere/in-all-words 'd
  (cons (cons 'e (cons 'r empty))
    (cons (cons 'r (cons 'e empty))
      empty)))