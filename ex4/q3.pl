somaMult3([],0):-!.
somaMult3([C|R],Soma):- Res is C mod 3,
                        Res == 0,
                        somaMult3(R,Soma1),
                        Soma is Soma1 + C,!.
somaMult3([_|R],Soma):- somaMult3(R,Soma),!.

/*
    dois parametros na qual somente a lista de inteiros é de entrada,
    faz uma recursao com pendencia para percorrer a lista.
    predicado de parada é quando a lista está vazia.

ex:.
    somaMult3([1,2,3,4,5,6,9],Soma).
    somaMult3([],Soma).
    somaMult3([1,2,2,2],Soma).
    somaMult3([3,6,9,30],Soma)


*/