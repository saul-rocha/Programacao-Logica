posImpares([],Cont,Cont):-!.

posImpares([I],Cont,Mult):- Cont1 is Cont * I,
                            Mult is Cont1,!.

posImpares([I,_|R],Cont,Mult):- Cont1 is Cont * I,
                                posImpares(R,Cont1,Mult),!.


/*
os parametros sao uma lista de inteiros, um auxiliar para fazer o produto e o de saída.
o predicado faz uma reucursao sem pendencia para percorrer a lista.

os predicados de parada sao  quando a lista fica vazia ou resta apenas um elemento na lista.

ex:.
    posImpares([1,2,3,4,5,6,7,8,9],1,Q).
    posImpares([1,2,3,4,5,6,7,8,9,10],1,Q).
    posImpares([1,2,3,4,5,6,7,8,9,10,11],1,Q).

*/