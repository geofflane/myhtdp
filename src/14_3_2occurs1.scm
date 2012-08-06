;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 14_3_2occurs1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;A Web-page (short: WP) is either
;1. empty;
;2. (cons s wp) 
;    where s is a symbol and wp is a Web page; or
;3. (cons ewp wp) 
;   where both ewp and wp are Web pages.

;; occurs1: WP symbol ->  number
;; counts the number of times a-symbol occurs in a-wp without looking in sub-pages
(define (occurs1 a-wp a-symbol) 
  (cond
    [(empty? a-wp) 0]
    [(and (symbol? (first a-wp)) (symbol=? (first a-wp) a-symbol)) (+ 1 (occurs1 (rest a-wp) a-symbol))]
    [else (occurs1 (rest a-wp) a-symbol)]))

;; occurs2: WP symbol ->  number
;; counts the number of times a-symbol occurs in a-wp including looking in sub-pages
(define (occurs2 a-wp a-symbol) 
  (cond
    [(empty? a-wp) 0]
    [(and (symbol? (first a-wp)) (symbol=? (first a-wp) a-symbol)) (+ 1 (occurs2 (rest a-wp) a-symbol))]
    [(cons? (first a-wp)) (+ (occurs2 (first a-wp) a-symbol) (occurs2 (rest a-wp) a-symbol))]
    [else (occurs2 (rest a-wp) a-symbol)]))

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

(check-expect (occurs1 page1 'and) 3)
(check-expect (occurs1 page1 'aims) 1)
(check-expect (occurs1 page2 'for) 0)

(check-expect (occurs2 page1 'for) 1)
(check-expect (occurs2 page2 'for) 3)