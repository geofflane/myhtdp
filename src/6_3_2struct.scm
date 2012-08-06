;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 6_3_2struct) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; (define-struct movie (title producer))

; (movie-title (make-movie 'ThePhantomMenace 'Lucas))
'ThePhantomMenace

; (movie-producer (make-movie 'TheEmpireStrikesBack 'Lucas))
'Lucas

; (movie-title (make-movie x y))
; x

; (movie-producer (make-movie x y))
; y


; (make-movie x y) == f1(x, y)
; x == (movie-title f1(x, y))
; y == (movie-producer f1(x, y))