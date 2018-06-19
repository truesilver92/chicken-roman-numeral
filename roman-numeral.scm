
(use srfi-1)

(define (number->roman
         number)
  (define (recur
           rule
           results)
    (if (> (first rule)
           (first results))
        results
        (recur rule
               (list (- (first results)
                        (first rule))
                     (append (last results)
                              (last rule))))))
  (let ((rules `(
                 (1000 ,(string->list "M"))
                 (900 ,(string->list "CM"))
                 (500 ,(string->list "D"))
                 (400 ,(string->list "CD"))
                 (100 ,(string->list "C"))
                 (90 ,(string->list "XC"))
                 (50 ,(string->list "L"))
                 (40 ,(string->list "XL"))
                 (10 ,(string->list "X"))
                 (9 ,(string->list "IX"))
                 (5 ,(string->list "V"))
                 (4 ,(string->list "IV"))
                 (1 ,(string->list "I")))))
    (list->string
     (last
      (fold recur
            (list number '())
            rules)))))

(print (number->roman 3999))
