mult5maior10(I,F,Cont,Qtd):- I =< F,
                            Res is I mod 5,
                            Res == 0,
                            I > 10,
                            Cont1 is Cont + I,
                            I1 is I + 1,
                            mult5maior10(I1,F,Cont1,Qtd),!.

mult5maior10(I,F,Cont,Qtd):- I =< F,
                        I1 is I + 1,
                        mult5maior10(I1,F,Cont,Qtd),!.

mult5maior10(_,_,Cont,Cont).


/*
    idem questao 1, mudando apenas as condiçoes.

ex:.
    mult5maior10(10,100,0,Q).
    mult5maior10(1,15,0,Q).
    mult5maior10(10,30,0,Q).
*/
