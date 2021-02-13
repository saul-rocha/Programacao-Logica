delt(A,B,C,_,_):- Delta is (B^2) - 4 * A * C,
	      	  Delta < 0,!.

delt(A,B,C,Res1,Res2):- Delta is (B^2) - 4 * A * C,
	      Delta == 0,
	      Raiz is Delta^(1/2),
	      Res1 is (-B + Raiz)/2*A,
	      Res2 is Res1,!.

delt(A,B,C,Res1,Res2):- Delta is (B^2) - 4 * A * C,
	      Delta > 0,
	      Raiz is Delta^(1/2),
	      Res1 is (-B + Raiz) / 2*A,
	      Res2 is (-B - Raiz) / 2*A,!.

/*
chame a clausula delt com os valores de a, b e c seguido das variaveis de saida

ex:.
 delt(1,12,-13,X1,X2).
 delt(7,3,4,X1,X2).
 obs:. quando delta < 0 o codigo retornará true pois nao efetua nenhum calculo
	por nao existir raizes reais.
 delt(9,-12,4,X1,X2).
 obs:. quando delta = 0 as raizes sao iguais e o X1 mostra que é igual ao X2 e o X2
	igual ao resultado.
*/