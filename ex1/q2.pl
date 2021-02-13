div3e5(X,1):- Res is X mod 3,
	      Res == 0,
	      Res1 is X mod 5,
	      Res1 == 0,!.      

div3e5(X,0).


/* para executar basta chamar a clausula div3e5(valordesejado, 
variavel qualquer) */

/*
ex:. 
div3e5(15,R).
div3e5(1,R).
div3e5(2,R).
div3e5(30,R).
*/



	      