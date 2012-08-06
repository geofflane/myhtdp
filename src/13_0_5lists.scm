;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 13_0_5lists) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(cons 'a (list 0 false))
(cons 'a (cons 0 (cons false empty)))

(list (cons 1 (cons 13 empty)))
(cons (cons 1 (cons 13 empty)) empty)

(list empty empty (cons 1 empty))
(cons empty (cons empty (cons (cons 1 empty) empty)))

(cons 'a (cons (list 1) (list false empty)))
(cons 'a (cons (cons 1 empty)
               (cons false (cons empty empty))))