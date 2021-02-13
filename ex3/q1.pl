% sem pendencia
mult3e5(I,F,Cont,Qtd):- I =< F,
                        Res is I mod 3,
                        Res == 0,
                        Res1 is I mod 5,
                        Res1 == 0,
                        Cont1 is Cont + 1,
                        I1 is I + 1,
                        mult3e5(I1,F,Cont1,Qtd),!.

mult3e5(I,F,Cont,Qtd):- I =< F,
                        I1 is I + 1,
                        mult3e5(I1,F,Cont,Qtd),!.

mult3e5(_,_,Cont,Cont).

/*  quando as condiçoes forem verdadeiras as variaveis Cont(inicia com 0 na chamada da clausula) 
    e I são incrementadas na recursao.
    quando nao satisfazem somente o I é incrementado para poder verificar o proximo valor.
    quando I == F, a variavel de saída tem como parametro a variavel Cont que é o total de numeros divisivel por 3 e 5.

ex:. 
    mult3e5(1,15,0,Qtd).
    mult3e5(15,30,0,Qtd).
    mult3e5(1,100,0,Qtd).

*/


% Com pendencia

mult3e5p(I,F,Qtd):- I =< F,
                    Res is I mod 3,
                    Res == 0,
                    Res1 is I mod 5,
                    Res1 == 0,
                    I1 is I + 1,
                    mult3e5p(I1,F,Qtd1),
                    Qtd is Qtd1 + 1,!.

mult3e5p(I,F,Qtd):- I =< F,
                    I1 is I + 1,
                    mult3e5p(I1,F,Qtd),!.

mult3e5p(_,_,0).

/*  as verificaçoes sao idem a sem pendencia a diferença é que nao tem um parametro auxiliar para contar
    e a soma é feita após verificar todo o intervalo.

ex:. 
    mult3e5(1,15,0,Qtd).
    mult3e5(15,30,0,Qtd).
    mult3e5(1,100,0,Qtd).

*/
