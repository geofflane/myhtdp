;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 14_2_3inorder) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
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

;; inorder: bt -> list-of-numbers
;; traverse bt in a depth-first, left-to-right order and produce a list of the number found
(define (inorder bt)
  (cond
    [(and (node? (node-left bt)) (node? (node-right bt))) 
     (append (inorder (node-left bt)) (list (node-ssn bt)) (inorder (node-right bt)))]
    [(node? (node-left bt)) (append (inorder (node-left bt)) (list (node-ssn bt)))]
    [(node? (node-right bt)) (append (list (node-ssn bt)) (inorder (node-right bt)))]
    [else (list (node-ssn bt))]))

;; Tests
(define a (make-node 15 'd 
                     (make-node 12 'a 
                                (make-node 1 'b false false) false)
                     (make-node 24 'i false 
                                (make-node 27 'b false false))))
  
(check-expect (list 1 12 15 24 27) (inorder a))