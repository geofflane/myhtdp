;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 5_1_3check_guess3) (read-case-sensitive #t) (teachpacks ((lib "guess.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "guess.ss" "teachpack" "htdp")))))
(define (check-guess3 a b c target)
  (check-guess (convert3 c b a) target))

(define (convert3 a b c)
  (+ (* 100 a)
     (* 10 b)
     c))

(define (check-guess guess target)
  (cond
    [(< guess target) 'TooSmall]
    [(> guess target) 'TooLarge]
    [else 'Perfect]))