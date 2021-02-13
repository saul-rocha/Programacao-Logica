mdc(X,Y,MDC):- X == 0,
               MDC is Y,!.

mdc(X,Y,MDC):- X > 0,
               Res is Y mod X,
               mdc(Res,X,MDC),!.
/*enquanto X nao for igual a zero, será recursivamente chamada até que encontre o MDC*/

principal(A,B,C,Resp):- mdc(A,B,R1),
                        mdc(R,C,R2),
                        Resp is R2.

/*
execute a clausula principal com os respectivos valores e a variavel de saída

ex:.
    principal(2,4,100,MDC).
    principal(13,26,9,MDC).
    principal(12,24,48,MDC).
    principal(1,-1,2,MDC).
    principal(0,0,0,MDC).
*/