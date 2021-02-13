mult3ou5([],[]):-!. %predicado de parada
mult3ou5([C|R],L):- Res is C mod 3,
                    Res1 is C mod 5,
                    (Res == 0;Res1 == 0), % Res ou Res1 igual  a 0 a condição vai ser dada como True
                    mult3ou5(R,LR), %recursividade
                    L = [C|LR],!. % pendencia
mult3ou5([_|R],L):-  mult3ou5(R,L),!.

/*
    ex
        mult3e5([1,2,3,4,5,6],L).
        mult3e5([1,2,3,4,5,6,15],L).
        mult3e5([15,30],L).
        mult3e5([],L).
*/