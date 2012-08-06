;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 10_1_7recall) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; recall: symbol list-of-symbols -> list-of-symbols
;; removes toy named ty from the list-of-symbols lon
(define (recall ty lon)
  (cond
    [(empty? lon) empty]
    [else 
     (cond
       [(not (symbol=? (first lon) ty)) (cons (first lon) (recall ty (rest lon)))]
       [else (recall ty (rest lon))])]))


(recall 'robot (cons 'robot (cons 'doll (cons 'dress empty))))
;; expected value: 
(cons 'doll (cons 'dress empty))

