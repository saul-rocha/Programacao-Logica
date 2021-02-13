mult([],[],[]):-!. %predicado de parada
mult([C|R],L1,L2):-     Res is C mod 3,
                        Res == 0,  % veeificação
                        mult(R,L1R,L2), %recursao
                        L1 = [C|L1R],!. %pendenca

mult([C|R],L1,L2):- Res is C mod 5,
                    Res == 0, % veeificação
                    mult(R,L1,L2R), %recursao
                    L2 = [C|L2R],!. % pendencia

mult([_|R],L1,L2):- mult(R,L1,L2),!.


/*
ex:.
    mult([1,2,3,4,5,6,7,8,9,10],L1,L2).
    mult([],L1,L2).
    mult([2,3],L1,L2).
    mult([2,5],L1,L2).

*/

