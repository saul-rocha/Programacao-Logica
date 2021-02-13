intervaloA(I,F,Cont,Qtd):-  I =< F,
                            I \= 0,
                            I \= 1,
                            Res1 is I mod 3,
                            Res1 == 0,
                            Res2 is I mod 5,
                            Res2 == 0,
                            I1 is I + 1,
                            Cont1 is Cont + 1,
                            intervaloA(I1,F,Cont1,Qtd),!.

intervaloA(I,F,Cont,Qtd):-  I =< F,
                            I1 is I + 1,
                            intervaloA(I1,F,Cont,Qtd),!.

intervaloA(_,_,Cont,Cont).
/*
intervaloA entra com os valores do intervalo, Cont inicia de 0 e por fim a variavel de saída.

ex:. 
    intervaloA(0,0,0,Qtd). 
    intervaloA(1,15,0,Qtd).
    intervaloA(1,100,0,Qtd).


*/

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

intervaloB(I,F,Cont,Prod):- I =< F,
                            I \= 1,
                            Par is I mod 2,
                            Par == 0,
                            I1 is I + 1,
                            Cont1 is Cont * I,
                            intervaloB(I1,F,Cont1,Prod),!.

intervaloB(I,F,Cont,Prod):- I =< F,
                            I1 is I + 1,
                            intervaloB(I1,F,Cont,Prod),!.

intervaloB(_,_,Cont,Cont).

/*
intervaloB entra com os valores do intervalo, Cont inicia de 1, pois irá efetuar uma multiplicação
e por fim a variavel de saída.

ex:. 
    intervaloB(0,0,1,Qtd). 
    intervaloB(1,4,1,Qtd).
    intervaloB(1,6,1,Qtd).


*/

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

intervaloC(I,F,Cont,Soma):- I =< F,
                            I > 10, 
                            M5 is I mod 5,
                            M5 == 0, 
                            I1 is I + 1,
                            Cont1 is Cont + I,
                            intervaloC(I1,F,Cont1,Soma),!.

intervaloC(I,F,Cont,Soma):- I =< F,
                            I1 is I + 1,
                            intervaloC(I1,F,Cont,Soma),!.

intervaloC(_,_,Cont,Cont).

/*
intervaloC entra com os valores do intervalo, Cont inicia de 0, pois irá efetuar uma soma
e por fim a variavel de saída.

ex:. 
    intervaloC(1,12,0,Q) 
    intervaloC(1,20,0,Q).
    intervaloC(1,15,0,Q).

*/

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

intervaloD(I,F,Contpares,ContPrd,Soma,Prod):-   I =< F,
                                                Par is I mod 2,
                                                Par == 0,
                                                I1 is I + 1,
                                                Cont1 is Contpares + I,
                                                intervaloD(I1,F,Cont1,ContPrd,Soma,Prod),!.

intervaloD(I,F,Contpares,ContPrd,Soma,Prod):-   I =< F,
                                                I1 is I + 1,
                                                Cont2 is ContPrd * I,
                                                intervaloD(I1,F,Contpares,Cont2,Soma,Prod),!.

intervaloD(_,_,Contpares,ContPrd,Contpares,ContPrd).


/*
intervaloD entra com os valores do intervalo, Contpares inicia de 0, pois irá efetuar uma soma,
ContPrd inicia de 1, pois efetua um produto e por fim as variaveis de saída.

ex:. 
    intervaloD(1,7,0,1,Par,Impar). 
    intervaloD(10,12,0,1,Par,Impar).
    intervaloD(3,9,0,1,Par,Impar).

*/