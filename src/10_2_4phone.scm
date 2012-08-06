;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 10_2_4phone) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; A phone-record (short: pr) is a structure: 
;; (make-pr name number)  
;; where name and number are symbols

(define-struct pr (name number))

;; (define (f-of-pr pr)
;; ... (ir-name ir) ...
;; ... (ir-number ir) ...)

;; directory is either
;; l. empty or
;; 2. (cons a-pr directory) where a-pr is a phone-record and directry is a directory
;; (cons (make-pr 'name '123-4567) empty)
;; Template:
;; (define (f-of-directory dir)
;;   (cond
;;     [(empty? directory) ...]
;;     [else ... (rest dir) ...]))

;; whose-number: symbol directory -> symbol
;; find the name for a person identified by number in the directory
(define (whose-number number directory)
  (cond
    [(empty? directory) 'not-found]
    [(symbol=? (pr-number (first directory)) number) (pr-name (first directory))]
    [else (whose-number number (rest directory))]))

;; phone-number: symbol directory -> symbol
;; find the number for a person identified by name in the directory
(define (phone-number name directory)
    (cond
    [(empty? directory) 'not-found]
    [(symbol=? (pr-name (first directory)) name) (pr-number (first directory))]
    [else (phone-number name (rest directory))]))

(define dir (cons (make-pr 'geoff '290-8031) (cons (make-pr 'jessica '431-5593) empty)))

;; tests
(symbol=? (phone-number 'foo dir) 'not-found)
(symbol=? (phone-number 'geoff dir) '290-8031)
(symbol=? (whose-number '111-1111 dir) 'not-found)
(symbol=? (whose-number '290-8031 dir) 'geoff)

