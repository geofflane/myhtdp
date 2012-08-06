;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 10_1_9controller) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; controller: number -> list of numbers and symbols
;; controller turns a number of pennies (amt) into a list containing the breakdown of dollars and cents
(define (controller amt)
  (cons (quotient amt 100) 
        (cons (one-or-not (quotient amt 100) 'dollar 'dollars)
              (cons 'and
                    (cons (remainder amt 100)
                          (cons (one-or-not (remainder amt 100) 'cent 'cents) empty))))))

(define (one-or-not amt singluar plural)
  (cond
    [(= amt 1) singluar]
    [else plural]))

(controller 103)
;; expected value: 
(cons 1 (cons 'dollar (cons 'and (cons 3 (cons 'cents empty)))))

(controller 350)
;; expected value: 
(cons 3 (cons 'dollars (cons 'and (cons 50 (cons 'cents empty)))))

(controller 1)
;; expected value: 
(cons 0 (cons 'dollars (cons 'and (cons 1 (cons 'cent empty)))))
