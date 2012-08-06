;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6_7hangman) (read-case-sensitive #t) (teachpacks ((lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "draw.ss" "teachpack" "htdp") (lib "hangman.ss" "teachpack" "htdp")))))

;; Position definitions so we know where to draw things
(define BAR_START (make-posn 0 10))
(define BAR_END (make-posn 100 10))
(define ROPE_END (make-posn (posn-x BAR_END) (+ (posn-y BAR_END) 20)))

(define HEAD_CENTER (make-posn (posn-x ROPE_END) 40))
(define HEAD_RADIUS (- (posn-y HEAD_CENTER) (posn-y ROPE_END)))

(define BODY_START (make-posn (posn-x ROPE_END) (+ (posn-y HEAD_CENTER) HEAD_RADIUS)))
(define BODY_END (make-posn (posn-x ROPE_END) (+ (posn-y BODY_START) 50) ))

(define LEFT_LEG_END  (make-posn (+ (posn-x BODY_END) -30) (+ (posn-y BODY_END) 30) ))
(define RIGHT_LEG_END (make-posn (+ (posn-x BODY_END) 30) (+ (posn-y BODY_END) 30) ))

(define ARM_START (make-posn (posn-x BODY_START) (+ (posn-y BODY_START) 5)))
(define LEFT_ARM_END (make-posn (+ (posn-x ARM_START) -30) (+ (posn-y ARM_START) -10)))
(define RIGHT_ARM_END (make-posn (+ (posn-x ARM_START) 30) (+ (posn-y ARM_START) -10)))

(define DEF_COLOR 'black)

(define (draw-next-part part)
  (cond
    [(symbol=? part 'right-leg) (draw-right-leg DEF_COLOR)]
    [(symbol=? part 'left-leg) (draw-left-leg DEF_COLOR)]
    [(symbol=? part 'left-arm) (draw-left-arm DEF_COLOR)]
    [(symbol=? part 'right-arm) (draw-right-arm DEF_COLOR)]
    [(symbol=? part 'body) (draw-body DEF_COLOR)]
    [(symbol=? part 'head) (draw-head DEF_COLOR)]
    [(symbol=? part 'noose) (draw-noose DEF_COLOR)]))

;; Contract: draw-noose :  color  ->  boolean
;; Purpose: to draw the noose for the hangman game in the given color where color is a symbol
(define (draw-noose color)
  (and
   (draw-solid-line BAR_START BAR_END color)   ;; draw horizontal piece
   (draw-solid-line BAR_END ROPE_END color) )) ;; draw vertical piece

;; Contract: draw-head :  color  ->  boolean
;; Purpose: to draw the head for the hangman game in the given color where color is a symbol
(define (draw-head color)
  (draw-circle HEAD_CENTER HEAD_RADIUS color))

;; Contract: draw-body :  color  ->  boolean
;; Purpose: to draw the body for the hangman game in the given color where color is a symbol
(define (draw-body color)
  (draw-solid-line BODY_START BODY_END color))

;; Contract: draw-left-leg :  color  ->  boolean
;; Purpose: to draw the left-leg for the hangman game in the given color where color is a symbol
(define (draw-left-leg color)
  (draw-solid-line BODY_END LEFT_LEG_END color))

;; Contract: draw-right-leg :  color  ->  boolean
;; Purpose: to draw the right-leg for the hangman game in the given color where color is a symbol
(define (draw-right-leg color)
  (draw-solid-line BODY_END RIGHT_LEG_END color))

;; Contract: draw-left-arm :  color  ->  boolean
;; Purpose: to draw the left-arm for the hangman game in the given color where color is a symbol
(define (draw-left-arm color)
  (draw-solid-line ARM_START LEFT_ARM_END color))

;; Contract: draw-right-arm :  color  ->  boolean
;; Purpose: to draw the right-arm for the hangman game in the given color where color is a symbol
(define (draw-right-arm color)
  (draw-solid-line ARM_START RIGHT_ARM_END color))

; word is a structure representing a three letter word: 
; (make-word one two three) 
; where one, two, and three are symbols

;; Template:
;; (define (fun-for-word a-word) 
;; ... (word-one a-word) ...
;; ... (word-two a-word) ...
;; ... (word-three a-word) ...)

(define-struct word (one two three))

;; Contract: reveal :  word word symbol  ->  word
;; Purpose: to determine whether the guess is in the chosen word and returns an updated status word
(define (reveal chosen status guess)
  (make-word 
   (replace-if-match (word-one status) (word-one chosen) guess)
   (replace-if-match (word-two status) (word-two chosen) guess)
   (replace-if-match (word-three status) (word-three chosen) guess)))

;; Contract: replace-if-match :  symbol symbol symbol  ->  symbol
;; Purpose: returns guess if guess matches test otherwise return orig
(define (replace-if-match orig test guess)
  (cond
    [(symbol=? test guess) guess]
    [else orig]))

;; tests
;(start 200 200)
;(and (draw-next-part 'noose)
;     (draw-next-part 'head)
;     (draw-next-part 'body)
;     (draw-next-part 'left-arm)
;     (draw-next-part 'right-arm)
;     (draw-next-part 'left-leg)
;     (draw-next-part 'right-leg))
;(stop)

(reveal (make-word 't 'e 'a) (make-word '_ 'e '_) 'u)
;; expected value
(make-word '_ 'e '_)

(reveal (make-word 'a 'l 'e) (make-word 'a '_  '_) 'e)
;; expected value: 
(make-word 'a '_ 'e)

(reveal (make-word 'a 'l 'l) (make-word '_ '_ '_) 'l)
;; expected value
(make-word '_ 'l 'l)