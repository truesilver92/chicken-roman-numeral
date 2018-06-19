
(use srfi-1)

(define (number->roman
         number)
  (define (recur
           rule
           results)
    (let ((value (last (assq 'value
                             rule)))
          (characters (last (assq 'characters
                                  rule)))
          (remaining (last (assq 'remaining
                                 results)))
          (numeral (last (assq 'numeral
                               results))))
      (if (> value
             remaining)
          results
          (recur rule
                 `((remaining ,(- remaining
                                  value))
                   (numeral ,(append numeral
                                     characters)))))))
  (let ((rules `(
                 ((value 1000) (characters ,(string->list "M")))
                 ((value 900) (characters ,(string->list "CM")))
                 ((value 500) (characters ,(string->list "D")))
                 ((value 400) (characters ,(string->list "CD")))
                 ((value 100) (characters ,(string->list "C")))
                 ((value 90) (characters ,(string->list "XC")))
                 ((value 50) (characters ,(string->list "L")))
                 ((value 40) (characters ,(string->list "XL")))
                 ((value 10) (characters ,(string->list "X")))
                 ((value 9) (characters ,(string->list "IX")))
                 ((value 5) (characters ,(string->list "V")))
                 ((value 4) (characters ,(string->list "IV")))
                 ((value 1) (characters ,(string->list "I"))))))
    (list->string (last (assq 'numeral
                              (fold recur
                                    (list (list 'remaining
                                                number)
                                          (list 'numeral
                                                '()))
                                    rules))))))

(print (number->roman 3999))
