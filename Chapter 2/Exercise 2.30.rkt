#lang sicp

(define (square x)
  (* x x))

(define (square-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) 
         (square tree))
        (else
         (cons (square-tree (car tree)) 
               (square-tree (cdr tree))))))

(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))

(define (square-tree-map tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree-map sub-tree)
             (square sub-tree)))
       tree))


;; Testing

(define t (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))