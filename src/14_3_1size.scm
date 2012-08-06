;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 14_3_1size) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;A Web-page (short: WP) is either
;1. empty;
;2. (cons s wp) 
;    where s is a symbol and wp is a Web page; or
;3. (cons ewp wp) 
;   where both ewp and wp are Web pages.

;; size : WP  ->  number
;; to count the number of symbols that occur in a-wp
(define (size a-wp) 
  (cond
    [(empty? a-wp) 0]
    [(symbol? (first a-wp)) (+ 1 (size (rest a-wp)))]
    [else (+ (size (first a-wp)) (size (rest a-wp)))]))

;; If the WP is empty then the count is zero,
;; if an element is a symbol, it increases the count by one. If the element is another WP
;; it doesn't increase the count, but continues counting the symbols in the sub-WP.

;; tests
(define page1 '(The TeachScheme! Project aims to improve the 
  problem-solving and organization skills of high 
  school students. It provides software and lecture 
  notes as well as exercises and solutions for teachers.))

(define page2 '(The TeachScheme Web Page
  Here you can find: 
  (LectureNotes for Teachers)
  (Guidance for (DrScheme: a Scheme programming environment))
  (Exercise Sets)
  (Solutions for Exercises)
  For further information: write to scheme@cs))

(check-expect (size empty) 0)
(check-expect (size (cons 'One empty)) 1)
(check-expect (size (cons (cons 'One empty) empty)) 1)
(check-expect (size page1) 29)
(check-expect (size page2) 29)