;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 14_2_5create-bst) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
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


;; create-bst bst number symbol -> bst
;; creates a bst a bst and a new number and new symbol by creating a node 
;; from n and s and inserting it into the proper place in the bst
(define (create-bst b n s)
  (cond
    [(boolean? b) (make-node n s false false)]
    [(> (node-ssn b) n) (make-node (node-ssn b) (node-name b) (create-bst (node-left b) n s) (node-right b))]
    [else (make-node (node-ssn b) (node-name b) (node-left b) (create-bst (node-right b) n s))]))

;; Tests
(define created (create-bst (create-bst false 66 'a) 53 'b))
(define a (make-node 66 
             'a
             (make-node 53 'b false false)
             false))
  
(check-expect created a)
