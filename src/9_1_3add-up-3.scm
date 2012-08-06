;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 9_1_3add-up-3) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; add-up-3 : list-of-3-numbers  ->  number
;; to add up the three numbers in a-list-of-3-numbers
;; Examples:
;;   (= (add-up-3 (cons 2 (cons 1 (cons 3 empty)))) 6)
;;   (= (add-up-3 (cons 0 (cons 1 (cons 0 empty)))) 1)
;; Template:
;; (define (f-a-list a-list-of-3-numbers) 
;  ... (first a-list-of-3-numbers) ... 
;;  ... (first (rest a-list-of-3-numbers)) ...
;;  ... (first (rest (rest a-list-of-3-numbers))) ... )
(define (add-up-3 a-list-of-3-numbers) 
  ( + (first a-list-of-3-numbers)
      (first (rest a-list-of-3-numbers))
      (first (rest (rest a-list-of-3-numbers)))))

;; Tests
(= (add-up-3 (cons 2 (cons 1 (cons 3 empty)))) 6)
(= (add-up-3 (cons 0 (cons 1 (cons 0 empty)))) 1)


;; distance-to-0-for-3 : list-of-3-numbers  ->  number
;; which computes the distance of a 3-dimensional point to the origin
(define (add-up-3 a-list-of-3-numbers) 
  (sqrt (sqr (first a-list-of-3-numbers))
      (sqr (first (rest a-list-of-3-numbers)))
      (sqr (first (rest (rest a-list-of-3-numbers))))))
