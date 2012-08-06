;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 17_1_1our-append) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; replace-eol-with : list-of-numbers list-of-numbers  ->  list-of-numbers
;; to construct a new list by replacing empty in alon1 with alon2
(define (replace-eol-with alon1 alon2)
  (cond
    ((empty? alon1) alon2)
    (else (cons (first alon1) (replace-eol-with (rest alon1) alon2)))))

;; our-append: list list list -> list
;; combine 3 lists together into a single list
(define (our-append l1 l2 l3)
  (replace-eol-with (replace-eol-with l1 l2) l3))

;; Tests
(check-expect (our-append (list 'a) (list 'b 'c) (list 'd 'e 'f)) (list 'a 'b 'c 'd 'e 'f))
