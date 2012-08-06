;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 14_3_4depth) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;A Web-page (short: WP) is either
;1. empty;
;2. (cons s wp) 
;    where s is a symbol and wp is a Web page; or
;3. (cons ewp wp) 
;   where both ewp and wp are Web pages.

;; depth: WP  ->  number
;; to count the depth of sub-pages that occur in a-wp
(define (depth a-wp) 
  (cond
    [(empty? a-wp) 0]
    [(not (cons? (first a-wp))) (depth (rest a-wp))]
    [else (max (+ 1 (depth (first a-wp)))
                    (depth (rest a-wp)))]))

;; tests
(check-expect (depth '((foo))) 1)
(check-expect (depth '(foo (foo (foo)))) 2)
(check-expect (depth '(foo 
                       (foo)
                       (foo)
                       (foo (foo)))) 2)
(check-expect (depth '(foo 
                       (foo)
                       (foo)
                       (foo (foo) (foo (foo))))) 3)

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

(define page3 '(The TeachScheme Web Page
  Here you can find: 
  (LectureNotes for Teachers)
  (Guidance for (DrScheme: a Scheme programming environment (foo)))
  (Exercise Sets)
  (Solutions for Exercises)
  For further information: write to scheme@cs))

(check-expect (depth page1) 0)
(check-expect (depth page2) 2)
(check-expect (depth page3) 3)