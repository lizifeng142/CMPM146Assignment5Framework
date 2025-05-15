
(define (problem collect-items-to-r1)
  (:domain rooms)
  (:objects
    c1 - character
    red-ball green-block blue-vase yellow-cube silver-ring golden-idol - item
    r1 r2 r3 r4 r5 r6 hw1 hw2 hw3 hw4 - room
  )

  (:init
    (connected r1 hw1) 
    (connected hw1 r1)
    (connected hw1 hw2) 
    (connected hw2 hw1)
    (connected hw2 r2) 
    (connected r2 hw2)
    (connected hw2 hw3) 
    (connected hw3 hw2)
    (connected hw3 r3) 
    (connected r3 hw3)
    (connected hw3 r4) 
    (connected r4 hw3)
    (connected hw3 hw4) 
    (connected hw4 hw3)
    (connected hw4 r5) 
    (connected r5 hw4)
    (connected r6 hw4) 
    (connected hw4 r6)

    (in red-ball r2)
    (in green-block r3)
    (in blue-vase r4)
    (in yellow-cube r5)
    (in silver-ring r6)
    (in golden-idol r6)

    (at c1 r1)
    (free-hand c1)
  )

  (:goal
    (and
      (in red-ball r1)
      (in green-block r1)
      (in blue-vase r1)
      (in yellow-cube r1)
      (in silver-ring r1)
      (in golden-idol r1)
    )
  )
)
