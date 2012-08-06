;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 9_1_4contains-2-doll) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; contains-2-doll? : list-of-2-symbols  ->  boolean
;; checks wether the list contains 'doll
;; Examples:
;;   (contains-2-doll? (cons 'doll (cons 'rag empty)))  ; true
;;   (not (contains-2-doll? (cons 'rag (cons 'muffin empty)))) ; false
;; Template:
;; (define (f-a-list a-list-of-2-symbols) 
;  ... (first a-list-of-2-symbols) ... 
;;  ... (first (rest a-list-of-2-symbols)) ... )
(define (contains-2-doll? a-list-of-2-symbols) 
  (or (symbol=? 'doll (first a-list-of-2-symbols))
      (symbol=? 'doll (first (rest a-list-of-2-symbols)))))

;; Tests
(contains-2-doll? (cons 'doll (cons 'rag empty)))
(contains-2-doll? (cons 'rag (cons 'doll empty)))
(not (contains-2-doll? (cons 'rag (cons 'muffin empty))))
