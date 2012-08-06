;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 15_3_3occurs) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct wp (header body))
;; A Web-page (short: WP) is a structure: (make-wp h p)
;; where h is a symbol and p is a (Web) document

;; A (Web) document is either
;; 1. empty,
;; 2. (cons s p)
;;    where s is a symbol and p is a document, or
;; 3. (cons w p)
;;    where w is a Web-page and p is a document

;; (define (fun-for-wp a-wp)
;;   ... (wp-header a-wp) ...
;;   ... (wp-body a-wp) ...)

;; (define (fun-for-doc a-doc)
;;   (cond
;;     [(empty? a-doc) ...]
;;     [else ... (fun-for-wp (first a-doc)) ... (fun-for-doc (rest a-doc))...]))

;; occurs: symbol Web-page -> boolean
;; determine if find occurs in a-wp or any sub-documents
(define (occurs find a-wp)
  (cond
    [(empty? (wp-body a-wp)) false]
    [else (occurs-doc find (wp-body a-wp))]))

(define (occurs-doc find a-doc)
  (cond
    [(empty? a-doc) false]
    [(and (symbol? (first a-doc)) (symbol=? find (first a-doc))) true]
    [(symbol? (first a-doc)) (occurs-doc find (rest a-doc))]
    [else (or (occurs find (first a-doc)) 
              (occurs-doc find (rest a-doc)))]))

;; Tests
(define empty-page (make-wp 'header empty))
(define plain-page (make-wp 'header '(foo bar baz)))
(define nested-page (make-wp 'header (list 'foo 'bar 'baz plain-page plain-page)))
 
(check-expect (occurs 'foo empty-page) false)
(check-expect (occurs 'foo plain-page) true)
(check-expect (occurs 'foo nested-page) true)
(check-expect (occurs 'quux nested-page) false)
