;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 10_1_4convert-euro) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; convert-euro : list-of-numbers  ->  list-of-numbers
;; to create a list of US dollars from a list of Euros (lod)
(define (convert-euro lod)
   (cond
    [(empty? lod) empty]
    [else (cons (dollar->euro(first lod)) (convert-euro (rest lod)))]))

(define (dollar->euro dollar)
  (* dollar 1.22))

;; test
(= 1.22 (dollar->euro 1))    ;; 0
(= 2.44 (dollar->euro 2))   ;; 100

(define l (cons 1 (cons 2 empty)))
(= 1.22 (first (convert-euro l)))
(= 2.44 (first (rest (convert-euro l))))

;; convert-euro-1 : number list-of-numbers  ->  list-of-numbers
;; to create a list of US dollars from a list of Euros (lod)
(define (convert-euro-1 exchange-rate lod)
   (cond
    [(empty? lod) empty]
    [else (cons (dollar->euro-1 exchange-rate (first lod)) (convert-euro-1 exchange-rate (rest lod)))]))

(define (dollar->euro-1 exchange-rate dollar)
  (* dollar exchange-rate))

;; test
(= 1.22 (dollar->euro-1 1.22 1))    ;; 0
(= 2.44 (dollar->euro-1 1.22 2))   ;; 100

(define l1 (cons 1 (cons 2 empty)))
(= 1.22 (first (convert-euro-1 1.22 l1)))
(= 2.44 (first (rest (convert-euro-1 1.22 l1))))