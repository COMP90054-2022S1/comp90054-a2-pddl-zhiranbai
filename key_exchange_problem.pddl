(define (problem key_exchange_problem)
   (:domain key_exchange)
   (:objects a1 a2 a3 - agent k -key pk1 pk2 pk3 - publicKey)
   (:init 
        (link a1 a2)
        (link a2 a1)
        (link a2 a3)
        (link a3 a2)
       
        (has-key a1 k)
        
        (has-PublicKey a1 pk1)
        (has-PublicKey a2 pk2)
        (has-PublicKey a3 pk3)
   )

   (:goal 
        (has-key a3 k)
   )
)
