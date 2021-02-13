%Quando os dois sao divisiveis, coloca a divisao inteira como sendo os parametros de entrada na chamada recursiva
fatoration(X,Y,Divisor):-   (X > 1;Y > 1),
                            Res is X mod Divisor,
                            Res == 0,
                            Res1 is Y mod Divisor,
                            Res1 == 0,
                            X1 is X div 2,
                            Y1 is Y div 2,
                            write(X),write(' , '),
                            write(Y),write(' | '),
                            write(Divisor),nl,
                            fatoration(X1,Y1,Divisor),!.
%apenas o Y é divisivel, mantem o valor de X e passa a divisao inteira de Y como parametro na recursiva
fatoration(X,Y,Divisor):-   (X > 1;Y > 1),
                            Res1 is Y mod Divisor,
                            Res1 == 0,
                            Y1 is Y div 2,
                            write(X),write(' , '),
                            write(Y),write(' | '),
                            write(Divisor),nl,
                            fatoration(X,Y1,Divisor),!.
%apenas o X divisivel, idem anterior so que ao contrario
fatoration(X,Y,Divisor):-   (X > 1;Y > 1),
                            Res is X mod Divisor,
                            Res == 0,
                            X1 is X div 2,
                            write(X),write(' , '),
                            write(Y),write(' | '),
                            write(Divisor),nl,
                            fatoration(X1,Y,Divisor),!.

/*busca o proximo primo quando nenhum é divisivel*/
fatoration(X,Y,Divisor):-   (X > 1;Y > 1),
                            Divisor1 is Divisor + 1,
                            primo(Divisor1,2,R),
                            R \= 0,
                            fatoration(X,Y,R),!.

fatoration(X,Y,Divisor):-   (X > 1;Y > 1),
                            Divisor1 is Divisor + 1,
                            fatoration(X,Y,Divisor1),!.

fatoration(X,Y,_):- write(X),write(' , '),
                    write(Y),write(' | '),
                    write(1),nl,!.
/*verificase se e primo*/
primo(X,Cont,R):- X > Cont,
                Res is X mod Cont,
                Res == 0,
                R is 0,!.

primo(X,Cont,R):-   X > Cont,
                    Cont1 is Cont + 1,
                    primo(X,Cont1,R),!.

primo(_,Cont,Cont).   

/*
chame a clausula fatoration com os dois valores e o ultimo parametro iniciando com 2.

ex:. 
    fatoration(6,8,2).
    fatoration(3,8,2).
    fatoration(3,5,2).
*/