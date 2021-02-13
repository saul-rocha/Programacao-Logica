mult3e5([],[]):-!. %predicado de parada
mult3e5([C|R],L):-  Res is C mod 3,
                    Res1 is C mod 5,
                    Res == 0,
                    Res1 == 0,
                    mult3e5(R,LR), %recursividade
                    L = [C|LR],!. % pendencia
mult3e5([_|R],L):-  mult3e5(R,L),!.

/*
    ex
        mult3e5([1,2,3,4,5,6],L).
        mult3e5([1,2,3,4,5,6,15],L).
        mult3e5([15,30],L).
        mult3e5([],L).
*/