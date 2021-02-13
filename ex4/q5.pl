pertence([_|_],[],0):-!. %quando a segunda lista fica vazia e nao tem todos ou nenhum elementos da primeira lista.  Return 0.
pertence([_],[],0):-!. % quando a segunda lista fica vazia e resta apenas um elemento na primeira. Return 0.
pertence([],[_],1):-!. % quando resta apenas um elemento na segunda lista, porem a primeira lista é vazia. Return 1.
pertence([],[_|_],1):-!. %  quando resta mais de um elemento na segunda lista, porem a primeira é vazia. Return 1.
pertence([C1|R1],[C2|R2],Res):- C1 == C2,
                                pertence(R1,[C2|R2],Res),!. % recursividade para procurar os demais elementos da primeira lista na segunda

pertence([C1|R1],[_|R2],Res):- pertence([C1|R1],R2,Res),!. % recursividade para procura o elemento que nao foi achado na segunda lsita no proximo elemento da segunda lista.


/*
    Duas listas como parametros de entrada. E um parametro de saída.

    ex:.
        pertence([1,2],[3],R).
        pertence([1,2,3,4,5],[1,10],R).
        pertence([2,5,7],[2,4,5,6,7],R).
        pertence([1,2,3,4,5],[1,2],R).

*/