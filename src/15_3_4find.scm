;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 15_3_4find) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
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


;; find: symbol Web-page -> Scheme-type
;; determine if a-sym is found in a-wp or any sub-documents
;; if a-sym is not found it returns false, otherwise it returns a list-of-symbols of the headers of the
;; documents that make up the path to the symbol found
(define (find a-sym a-wp)
  (cond
    [(not (occurs a-sym a-wp)) false]
    [(occurs-this-doc? a-sym (wp-body a-wp)) (list (wp-header a-wp))]
    [else (append (list (wp-header a-wp)) (find-in-doc a-sym (wp-body a-wp)))]))

;; find-in-doc: symbol Web-document -> list-of-symbols
;; determine if a-sym is found in a-doc or any sub pages.
(define (find-in-doc a-sym a-doc)
  (cond
    [(empty? a-doc) empty]
    [(symbol? (first a-doc)) (find-in-doc a-sym (rest a-doc))]
    [(occurs-this-doc? a-sym (wp-body (first a-doc))) (list (wp-header (first a-doc)))]
    [else (append (find a-sym (first a-doc)) (find-in-doc a-sym (rest a-doc)))]))

;; occurs-this-doc?: symbol Web-document -> boolean
;; does a-sym occur in a-doc (not including sub pages.
(define (occurs-this-doc? a-sym a-doc)
  (cond
    [(empty? a-doc) false]
    [else (or (and (symbol? (first a-doc)) (symbol=? a-sym (first a-doc)))
              (occurs-this-doc? a-sym (rest a-doc)))]))

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
(define plain-page (make-wp 'header2 '(foo bar baz)))
(define nested-page (make-wp 'header1 (list 'foo 'bar plain-page empty-page)))
 
(check-expect (find 'foo empty-page) false)
(check-expect (find 'foo plain-page) '(header2))
(check-expect (occurs 'baz nested-page) true)
(check-expect (find 'baz nested-page) '(header1 header2))
(check-expect (find 'quux nested-page) false)
