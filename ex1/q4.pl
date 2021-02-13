triangulo(A,B,C,1):- (A < (B+C), B < (A+C),C < (A+B)),!.

triangulo(_,_,_,0).	     
		     
/*para executar basta chamar a clausula triangulo com os valores desejados e a
variavel de saida.*/

/*ex:.
 triangulo(1,5,2,R).
 triangulo(16,20,30,R).
*/