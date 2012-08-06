;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 5_1_5check-color) (read-case-sensitive #t) (teachpacks ((lib "master.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "master.ss" "teachpack" "htdp")))))
(define (check-color target1 target2 guess1 guess2)
  (cond
    [(and (match target1 guess1) (match target2 guess2)) 'Perfect]
    [(or (match target1 guess1) (match target2 guess2)) 'OneColorAtCorrectPosition]
    [(or (match target1 guess2) (match target2 guess1)) 'OneColorOccurs]
    [else 'NothingCorrect]))

(define (match target guess)
  (symbol=? target guess))