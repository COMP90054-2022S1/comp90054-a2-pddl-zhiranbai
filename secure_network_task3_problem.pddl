(define (problem task3)
   (:domain secure_network)
   (:objects a1 a2 a3 a4 - agent i1 i2 - information k1 k2 - key)
   (:init 
      (link a1 a2)
      (link a2 a3)
      (link a3 a2)
      (link a2 a4)
      (has-info a1 i1)
      (has-info a3 i2)
      (has-key a1 k1)
      (has-key a2 k1)
      (has-key a2 k2)
      (has-key a3 k2)
      (has-key a4 k2)




   )

   (:goal (and
      (has-info a4 i1)
      (has-info a4 i2)
      
      )
   )
)
