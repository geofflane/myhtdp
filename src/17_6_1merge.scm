;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 17_6_1merge) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define (merge l1 l2)
  (cond 
    [(and (empty? l1) (empty? l2)) empty]
    [(and (cons? l1) (empty? l2)) l1]
    [(and (cons? l2) (empty? l1)) l2]
    [(<= (first l1) (first l2)) (cons (first l1) (merge (rest l1) l2))]
    [else (cons (first l2) (merge l1 (rest l2)))]
  ))

(merge (list 1 3 5 7 9) (list 0 2 4 6 8))
;; expected value: 
(list 0 1 2 3 4 5 6 7 8 9)

(merge (list 1 8 8 11 12) (list 2 3 4 8 13 14))
;; expected value: 
(list 1 2 3 4 8 8 8 11 12 13 14)
