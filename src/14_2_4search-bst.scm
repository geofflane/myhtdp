;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 14_2_4search-bst) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define-struct node (ssn name left right))
;A binary-tree (short: BT) is either
;1. false; or
;2. (make-node soc pn lft rgt) 
;   where soc is a number, pn is a symbol, and lft and rgt are BTs.

;A binary-search-tree (short: BST) is a BT:
;1. false is always a BST;
;2. (make-node soc pn lft rgt) is a BST if
;    a. lft and rgt are BSTs,
;    b. all ssn numbers in lft are smaller than soc, and
;    c. all ssn numbers in rgt are larger than soc.

;; fun-for-node : node  ->  ???
;(define (fun-for-node a-node)
;  (cond
;    [(empty? a-node) ...]
;    [else
;      ... (fun-for-node (node-left a-node)) ...
;      ... (fun-for-node (node-right a-node)) ...
;      ... (node-name a-node) ...
;      ... (node-ssn a-node) ...]))

;; search-bst: number bst -> boolean
;; searches a binary-search-tree for a number n and returns true if it finds it
(define (search-bst n bst)
  (cond
    [(and (node? bst) (= n (node-ssn bst))) true]
    [(and (node? (node-left bst)) (> (node-ssn bst) n)) (search-bst n (node-left bst))]
    [(and (node? (node-right bst)) (< (node-ssn bst) n)) (search-bst n (node-right bst))]
    [else false]))
    

;; Tests
(define a (make-node 15 'd 
                     (make-node 12 'a 
                                (make-node 1 'b false false) false)
                     (make-node 24 'i false 
                                (make-node 27 'b false false))))
  
(check-expect true (search-bst 15 a))
(check-expect true (search-bst 1 a))
(check-expect true (search-bst 27 a))
(check-expect true (search-bst 12 a))
(check-expect true (search-bst 24 a))
(check-expect false (search-bst 0 a))
(check-expect false (search-bst 13 a))
(check-expect false (search-bst 30 a))