fib(1, 1) :- !.
fib(2, 1) :- !.
fib(N, Result) :-   N1 is N - 1, 
                    N2 is N - 2, 
                    fib(N1, Result1), 
                    fib(N2, Result2), 
                    Result is Result1 + Result2,!.
%% faz uma recursividade com pendencia em que uma recursividade pega o N-1 e a outra o N-2 e o Result agrega
%% na pilha o resultado Fibonacci da possição
/*
entra com a posição desejada e a variavel de saida

ex:. 
    fib(7,R).
    fib(8,R).
    fib(4,R).

*/