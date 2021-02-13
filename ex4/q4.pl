%%% Para verificar se um número é múltiplo de outro, basta encontrar um número inteiro de modo
%%% que a multiplicação entre eles resulte no primeiro número. Exemplos: a) 35 é múltiplo de 
%%% 7, pois 35 é igual a 7 multiplicado pelo número inteiro.

multiplos(_,[],[]):-!.
multiplos(N,[C|R],L):-  N =< C,
                        Res is C mod N,
                        Res == 0,
                        multiplos(N,R,LR),
                        L = [C|LR],!.
multiplos(N,[_|R],L):-  multiplos(N,R,L),!.

/*
    o predicado tem 3 parametros, dois de entrada, sendo eles o numero desejado e a lista ordenada.
    E o de saída.
    o predicado encerra quando toda a lista é verificada.
    a lista resultante é preenchida recursivamente com pendencia.

    ex:.
        multiplos(10,[1,2,3,4,5,6,7,8,9,10],L).
        multiplos(10,[10,30,40,50,60,70,80,90],L).
        multiplos(2,[1,2,3,4,5,6,7,8,9],L).
        multiplos(1,[1,2,3,4,5,6,7,8,9],L).
*/