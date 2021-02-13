impares([],[],[]):-!.
% somente primeira lista com elementos
impares([C1|R1],[],L):- Imp is C1 mod 2,
                        Imp \= 0,
                        impares(R1,_,LR),
                        L = [C1|LR],!.

impares([_|R1],[],L):- impares(R1,[],L),!.

impares([C1],[],L):-    Imp is C1 mod 2,
                        Imp \= 0,
                        impares([],[],LR),
                        L = [C1|LR],!.

impares([_],[],L):-    impares([],[],L),!.

% somente a segunda lista com elementos

impares([],[C2|R2],L):- Imp is C2 mod 2,
                        Imp \= 0,
                        impares([],R2,LR),
                        L = [C2|LR],!.

impares([],[_|R2],L):- impares([],R2,L),!.

impares([],[C2],L):-    Imp is C2 mod 2,
                        Imp \= 0,
                        impares([],[],LR),
                        L = [C2|LR],!.

impares([],[_],L):-    impares([],[],L),!.


%% duas listas com elementos

impares([C1|R1],[C2|R2],L):-    C1 < C2,
                                Imp is C1 mod 2,
                                Imp \= 0,
                                impares(R1,[C2|R2],LR),
                                L = [C1|LR],!.

impares([C1|R1],[C2|R2],L):-    C1 > C2,
                                Imp is C2 mod 2,
                                Imp \= 0,
                                impares([C1|R1],R2,LR),
                                L = [C2|LR],!.
impares([C1|R1],[C1|R2],L):- 
                             Imp is C1 mod 2,
                             Imp \= 0,
                             impares(R1,R2,LR),
                             L = [C1|LR],!.

impares([_|R1],[_|R2],L):- impares(R1,R2,L),!. % quando ambas as cabeças das listas nao sao impares


/*
    recebe duas lsitas de inteiros ordenados e um paremetro de saída.
    faz uma recursao com pendencia para preencher a lista resultante.
    sao tratados todos os casos em que uma lista pode estar vazia e outra nao, finaliza quando ambas forem vazias.

    ex:.
        impares([2,4,6],[2,6,12,26,27],R).
        impares([],[1,3,5,7,9],R).
        impares([1,3,5,11],[],R).
        impares([1,2,3],[1,2,3],R).


*/