#lang racket
(require "util.rkt")

(define
  process
  (lambda (parsed-exp)
    (cond
      ; empty program
      ((null? parsed-exp)
       (displayln "ERROR: EMPTY PROGRAM."))

      ; error handler from parser
      ((void? parsed-exp)
       (void))

      ; variable expression
      ((equal? 'var-exp (car parsed-exp))
       (let ((value (resolve_env environment (cadr parsed-exp))))
         (if (void? value)
             (displayln "ERROR: Variable not found")
             value)))


      ; number expression
      ((equal? 'num-exp (car parsed-exp))
       (cadr parsed-exp))

      ; unsupported expression
      (else
       (displayln "ERROR: expression has not been supported yet.")))))

(provide (all-defined-out))
