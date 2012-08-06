;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 13_0_4lists) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(cons 'a (cons 'b (cons 'c (cons 'd (cons 'e empty)))))
(list 'a 'b 'c 'd 'e)

(cons (cons 1 (cons 2 empty)) empty)
(list (list 1 2))

(cons 'a (cons (cons 1 empty) (cons false empty)))
(list 'a (list 1) false)

(cons (cons 1 (cons 2 empty)) (cons (cons 2 (cons 3 empty)) empty))
(list (list 1 2) (list 2 3))