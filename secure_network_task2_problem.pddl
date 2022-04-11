(define (problem task2)
   (:domain secure_network)
   (:objects a1 a2 a3 - agent i - information k -key)
   (:init 
        (link a1 a2)
        (link a2 a3)
        (has-info a1 i)
        (has-key a1 k)
        (has-key a3 k)
        
        
   
   )

   (:goal 
        (has-info a3 i)
        
   )
)
