;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6_3_3fighter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct jet (designation acceleration top-speed range))

; within-range : fighter distance -> bool
; can the jet reach the target?
(define (within-range fighter distance)
  (>= (jet-range fighter) distance))

; reduce-range : fighter  ->  fighter
; reduce the range of a fighter by 80%
(define (reduce-range fighter)
  (make-jet (jet-designation fighter)
            (jet-acceleration fighter)
            (jet-top-speed fighter)
            ( * (jet-range fighter) .8)))

; tests
(define my-jet (make-jet 'my-fighter 100 100 100))
(within-range my-jet 50)
(within-range my-jet 100)
(not (within-range my-jet 101))
(not (within-range my-jet 150))
(= (jet-range (reduce-range my-jet)) 80)