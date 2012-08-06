;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 8_3evaluation) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))
;; The explantaion of evalution makes me realize that I didn't evaluate these in exactly the right order.
;; Would have been nice to know that information first.

;; 8.3.1
; 1.
(+ (* (/ 12 8) 2/3) 
	(- 20 (sqrt 4)))

(+ (* (/ 12 8) 2/3) 
	(- 20 2))

(+ (* (/ 12 8) 2/3) 
	18)

(+ (* 1.5 2/3) 18)

(+ 1 18)

19

; 2.
(cond
  [(= 0 0) false]
  [(> 0 1) (symbol=? 'a 'a)]
  [else (= (/  1 0) 9)])

(cond
  [true false]
  [(> 0 1) (symbol=? 'a 'a)]
  [else (= (/  1 0) 9)])

false

; 3.
(cond
  [(= 2 0) false]
  [(> 2 1) (symbol=? 'a 'a)]
  [else (= (/  1 2) 9)])

(cond
  [false false]
  [(> 2 1) (symbol=? 'a 'a)]
  [else (= (/  1 2) 9)])

(cond
  [(> 2 1) (symbol=? 'a 'a)]
  [else (= (/  1 2) 9)])

(cond
  [true (symbol=? 'a 'a)]
  [else (= (/  1 2) 9)])

(symbol=? 'a 'a)

true

; 8.3.2
;; f : number number  ->  number
(define (f x y)
  (+ (* 3 x) (* y y)))

; 1.
(+ (f 1 2) (f 2 1))

(+ (+ (* 3 1) (* 2 2)) (f 2 1))

(+ 
 (+ (* 3 1) (* 2 2)) 
 (+ (* 3 2) (* 1 1)))

(+ 
 (+ (* 3 1) (* 2 2)) 
 (+ (* 3 2) 1))

(+ 
 (+ (* 3 1) (* 2 2)) 
 (+ 6 1))

(+ 
 (+ (* 3 1) (* 2 2)) 
 7)

(+ 
 (+ (* 3 1) 4) 7)

(+ 
 (+ 3 4) 7)

(+ 7 7)

14

; 2.
(f 1 (* 2 3))

(f 1 6)

(+ (* 3 1) (* 6 6))

(+ (* 3 1) 36)

(+ 3 36)

39

; 3.
(f (f 1 (* 2 3)) 19) 

(f (f 1 6) 19) 

(f (+ (* 3 1) (* 6 6)) 19) 

(f (+ (* 3 1) 36) 19)

(f (+ 3 36) 19)

(f 39 19)

(+ (* 3 39) (* 19 19))

(+ (* 3 39) 361)

(+ 117 361)

478
