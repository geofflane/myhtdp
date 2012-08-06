;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 14_3_3replace) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;A Web-page (short: WP) is either
;1. empty;
;2. (cons s wp) 
;    where s is a symbol and wp is a Web page; or
;3. (cons ewp wp) 
;   where both ewp and wp are Web pages.

;; replace: WP symbol symbol ->  number
;; replace the old symbol with the new symbol in a-wp
(define (replace a-wp old new) 
  (cond
    [(empty? a-wp) empty]
    [(and (symbol? (first a-wp)) (symbol=? (first a-wp) old)) (cons new (replace (rest a-wp) old new))]
    [else (cons (first a-wp) (replace (rest a-wp) old new))]))

;; tests
(define page1 '(The TeachScheme! Project aims to improve the 
  problem-solving and organization skills of high 
  school students. It provides software and lecture 
  notes as well as exercises and solutions for teachers.))

(check-expect (replace page1 'improve 'increase) '(The TeachScheme! Project aims to increase the 
  problem-solving and organization skills of high 
  school students. It provides software and lecture 
  notes as well as exercises and solutions for teachers.))
(check-expect (replace page1 'and 'und) '(The TeachScheme! Project aims to improve the 
  problem-solving und organization skills of high 
  school students. It provides software und lecture 
  notes as well as exercises und solutions for teachers.))
