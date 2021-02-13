qtdivisores([],_,0):-!.
qtdivisores([C|R],N,Qtd):-  Res is N mod C,
                            Res == 0,
                            qtdivisores(R,N,Qtd1),
                            Qtd is Qtd1 + 1,!.
qtdivisores([_|R],N,Qtd):- qtdivisores(R,N,Qtd),!.

/*
os parametros sao uma lista de inteiros, o numero desejado e o de saída.
o predicado faz uma reucursao com pendencia para percorrer a lista e incrementar a quantidade ao final do processo.

o predicado de parada é quando a lista fica vazia.

ex:.
    qtdivisores([1,2,3,4,5,6,7,8,9],10,Q).
    qtdivisores([1,2,3,4,5,6,7,8,9,10],1,Q).
    qtdivisores([1,2,3,4,5,6,7,8,9,10,11],50,Q).

*/