;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 12_2_1sort-mail) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct mail (from date message))
; A mail-message is a structure: 
; (make-mail name n s) 
; where name is a string, n is a number, and s is a string.

;; list-of-mail is either
;; 1. empty or
;; 2. (cons m lom) where m is a mail-message and lom is a list-of-mail.

;; (define (f-of-lom lom)
;;  (cond
;;    [(empty? lom) ...]
;;    [else ... (first lom) ... (rest lom) ...]))

;; sort-mail-by-date: list-of-mail -> list-of-mail
;; sort mail messages by date
(define (sort-mail-by-date lom)
  (cond
    [(empty? lom) empty]
    [(cons? lom) (insert-by-date (first lom) (sort-mail-by-date (rest lom)))]))

;; sort-mail-by-message: list-of-mail -> list-of-mail
;; sort mail messages by message
(define (sort-mail-by-message lom)
  (cond
    [(empty? lom) empty]
    [(cons? lom) (insert-by-message (first lom) (sort-mail-by-message (rest lom)))]))


;; insert-by-date : mail list-of-mails (sorted)  ->  list-of-mails (sorted)
;; insert a-mail into lom where list-of-mails remains sorted by date
(define (insert-by-date a-mail lom)
  (cond
    [(empty? lom) (cons a-mail empty)]
    [else (cond
            [(>= (mail-date a-mail) (mail-date (first lom))) (cons a-mail lom)]
            [else (cons (first lom) (insert-by-date a-mail (rest lom)))])]))

;; insert-by-message: mail list-of-mails (sorted)  ->  list-of-mails (sorted)
;; insert a-mail into lom where list-of-mails remains sorted by message
(define (insert-by-message a-mail lom)
  (cond
    [(empty? lom) (cons a-mail empty)]
    [else (cond
            [(string>? (mail-message (first lom)) (mail-message a-mail)) (cons a-mail lom)]
            [else (cons (first lom) (insert-by-message a-mail (rest lom)))])]))

;; tests
(insert-by-message (make-mail 'geoff 1 "c") empty)
(cons (make-mail 'geoff 1 "c") empty)
(insert-by-message (make-mail 'geoff 2 "b") (cons (make-mail 'geoff 1 "c") empty))
(cons (make-mail 'geoff 2 "b") (cons (make-mail 'geoff 1 "c") empty))
(insert-by-message (make-mail 'geoff 2 "d") (cons (make-mail 'geoff 1 "c") empty))
(cons (make-mail 'geoff 1 "c") (cons (make-mail 'geoff 2 "d") empty))

(insert-by-date (make-mail 'geoff 1 "c") empty)
(cons (make-mail 'geoff 1 "c") empty)
(insert-by-date (make-mail 'geoff 2 "b") (cons (make-mail 'geoff 1 "c") empty))
(cons (make-mail 'geoff 2 "b") (cons (make-mail 'geoff 1 "c") empty))
(insert-by-date (make-mail 'geoff 2 "d") (cons (make-mail 'geoff 1 "c") empty))
(cons (make-mail 'geoff 2 "d") (cons (make-mail 'geoff 1 "c") empty))

(sort-mail-by-message empty)
empty
(sort-mail-by-message (cons (make-mail 'geoff 1 "c") (cons (make-mail 'geoff 2 "b") (cons (make-mail 'geoff 3 "a") empty))))
(cons (make-mail 'geoff 3 "a") (cons (make-mail 'geoff 2 "b") (cons (make-mail 'geoff 1 "c") empty)))

(sort-mail-by-date (cons (make-mail 'geoff 2 "b") (cons (make-mail 'geoff 1 "c") (cons (make-mail 'geoff 3 "a") empty))))
(cons (make-mail 'geoff 3 "a") (cons (make-mail 'geoff 2 "b") (cons (make-mail 'geoff 1 "c") empty)))
