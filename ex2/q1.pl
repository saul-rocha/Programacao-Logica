primo(X,Cont):- X == 1,
		write(X),
		write(' Eh primo!'),!.

primo(X,Cont):- X > Cont,
		X \= 1,
		Res is X mod Cont,
		Res == 0,
		write(X),
   		write(' NAO eh primo!'),!.
primo(X,Cont):- X == Cont,
		write(X),
		write(' Eh primo!'),!.


primo(X,Cont):- X > Cont, 
		Res is X mod Cont,
		Res \= 0,
		Cont1 is Cont + 1,
		primo(X,Cont1). /*enquanto uma das condições acima nao for
				  saciada a clausula e chama novamente incrementando
				  Cont.*/

/*
chame a clausula primo seguido do numero desejado e a variavel cont como
sendo igual a 2.

ex:. 
 primo(1,2).
 primo(5,2).
 primo(10000,2)
*/