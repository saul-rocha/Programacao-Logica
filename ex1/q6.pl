pred(X,Y,Res):- X > Y,
	    	Res is (X^2)+(X/Y),!.

pred(X,Y,Res):- X < Y,
		Res is Y * (Y-X),!.

pred(X,Y,Res):- X == Y,
		Res is (X^3) + ((X+Y)^2).

/*
para executar basta chamar a clausula com os dois valores e a variavel de saída

ex:.
 pred(2,1,R).
 pred(3,5,R).
 pred(3,3,R).

*/