---- MODULE hanoi ----
EXTENDS Integers, Sequences, TLC

VARIABLES
    Left, Center, Right

TypeOK == TRUE \* TODO

N == 6 \* number of disks (use N instead of a specific number throughout your solution)

\* this creates the sequence <<1, ..., N>> for any N
Full == [n \in 1..N |-> n]
Empty == << >>

\* we'll use sequences in such a way that the head corresponds to the topmost disk

Init == 
    /\ Left = Full
    /\ Center = Empty
    /\ Right = Empty

CanMove(s, d) == \* TODO your job: can one move one disk from source to destination?
    /\ s # Empty
    /\ IF d = Empty THEN TRUE ELSE Head(s) < Head(d)

Move(s, a, d) == \* TODO your job: attempt to move one disk from source to destination using a (aux) as the spare?
    /\ CanMove(s, d)
    /\ s' = Tail(s)
    /\ d' = << Head(s) >> \o d
    /\ UNCHANGED a

Next == 
    \/ Move(Left, Center, Right)
    \/ Move(Left, Right, Center)
    \/ Move(Center, Right, Left)
    \/ Move(Center, Left, Right)
    \/ Move(Right, Center, Left)
    \/ Move(Right, Left, Center)

Solved == \* TODO your job
    Right = Full

Unsolved == ~ Solved

====
