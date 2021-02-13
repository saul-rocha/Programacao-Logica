%%inserindo dados no functor 
%insere um functor em uma lista de functores
%OBS:. nao ordena e e alocado em forma de pilha
inserecidadesBr([],P,[P]):-!.
inserecidadesBr([cidade(Nome,Estado,Population,DistanciaCapital)|R],cidade(Nome1,Estado1,Population1,DistanciaCapital1),LR):-   LR = [cidade(Nome1,Estado1,Population1,DistanciaCapital1),cidade(Nome,Estado,Population,DistanciaCapital)|R],!.

%%imprime todas as cidades de um estado A
%ex:.cidadesEst(Estado,[cidade(X,X,X,X),cidade(X,X,X,X),cidade(X,X,X,X)]).
cidadeEst(_,[]):-   write(''),nl,!.
cidadeEst(Estado1,[cidade(Nome,Estado1,Pop,DistC)|R]):- write(Nome),nl,
                                                        write(Estado1),nl,
                                                        write(Pop),nl,
                                                        write(DistC),nl,nl,
                                                        cidadeEst(Estado1,R),!.
cidadeEst(Estado1,[_|R]):-  cidadeEst(Estado1,R),!.

%%imprime as cidades com mais de 100.000 habitantes B
% cidadeCemMil([cidade(X,X,X,X),....]).
cidadeCemMil([]):-  write(''),!.
cidadeCemMil([cidade(Nome,Estado,Population,_)|R]):-    Population > 100000,
                                                        write(Nome),write('-'),
                                                        write(Estado),nl,
                                                        cidadeCemMil(R),!.
cidadeCemMil([_|R]):-   cidadeCemMil(R),!.

%Maior Cidade C
%imprime a maior cidade
%ex:.   maiorCidade(Estado,[cidade(X,Estado,X,X),cidade(X,X,X,X)],0,M).
%%cont inicia de 0
maiorCidade(_,[],_,Maior):- write('MAIOR CIDADE'),nl, 
                            write(Maior),nl,!.
maiorCidade(Estado1,[cidade(Nome,Estado1,Pop,_)|R],Cont,Nome):- Pop > Cont,
                                                                Cont1 is Pop,
                                                                maiorCidade(Estado1,R,Cont1,Nome),!.
maiorCidade(Estado1,[cidade(_,Estado1,_,_)|R],Cont,Maior):- maiorCidade(Estado1,R,Cont,Maior),!.


%%Popuação de um estado D
%Cont inicia de 0
%devolve o total da população de um estado.
%ex:.   calcPop(Estado[cidade(X,Estado,X,X),cidade(X,X,X,X)],Cont,Total).
calcPop(_,[],Cont,Cont):-!.
calcPop(Estado,[cidade(_,Estado,Pop,_)|R],Cont,Soma):-  Cont1 is Cont + Pop,
                                                        calcPop(Estado,R,Cont1,Soma),!.
calcPop(Estado,[_|R],Cont,Soma):-   calcPop(Estado,R,Cont,Soma),!.

%População media de um estado E
%cont e totalpop começa de 0
%devolve a media da população de um estado
%ex:.mediaPop(Estado,[cidade(X,X,X,X),cidade(X,Estado,X,X)],0,0,Media).
mediaPop(_,[],TotalPop,Cont,Media):-    Media is TotalPop / Cont,!.
mediaPop(Estado,[cidade(_,Estado,Pop,_)|R],TotalPop,Cont,Media):-   Cont1 is Cont + 1,
                                                                    TotalPop1 is TotalPop + Pop,
                                                                    mediaPop(Estado,R,TotalPop1,Cont1,Media),!.
mediaPop(_,[_|R],TotalPop,Cont,Media):- mediaPop(_,R,TotalPop,Cont,Media),!.

%%%Cidade mais proxima da capital F
%devolve o nome da cidade mais proxima da capital
%ex:.proxCap(Estado,[cidade(X,Estado,X,X),cidade(X,X,X,X)],0,C).
proxCap(_,[],_,_):-!.
proxCap(Estado,[cidade(Nome,Estado,_,DistCap)|R],Cont,Nome):-       DistCap \= 0,
                                                                    Cont > DistCap,
                                                                    proxCap(Estado,R,DistCap,Nome),!.
proxCap(Estado,[cidade(_,_,_,_)|R],Cont,Cidade):-    proxCap(Estado,R,Cont,Cidade),!.

%%Capital de um Estado G
%verifica se uma cidade é a capital do estado e imprime-a
%ex:.capital(Estado,[cidade(X,Estado,X,X),cidade(X,X,X,X)]).
capital(_,[]):-   write('Nao encontrada'),nl,!.
capital(Estado,[cidade(Nome,Estado,_,DistCap)|_]):- DistCap == 0,
                                                    write('Capital do '),
                                                    write(Estado),
                                                    write(' eh: '),
                                                    write(Nome),nl,!.
capital(Estado,[cidade(_,_,_,_)|R]):-   capital(Estado,R),!.


%%cidade capital?? H
%verifica um functor do tipo cidade para ver se correlaciona às caracteristicas de uma cidade e impreme
%ex:.  cidadeCap(cidade(N,E,Pop,Dist)).
%       Nome eh a capital do estado do Estado
cidadeCap(cidade(Nome,Estado,_,DistCap)):-      DistCap == 0,
                                                write(Nome),
                                                write(' eh a capital do estado do '),
                                                write(Estado),nl,!.
cidadeCap(cidade(_,_,_,_)):-   write('Nao eh capital'),nl,!.

%%%%%%%%% Converte uma string para número
%%%%%%%% Exemplo Chamda do Predicado: converteNRO(['4','3','2','1'],N,1).
%%%%%%%% Resultado: N = 1234
converteNRO([C],N,Unidade):- atom_number(C,C1),
                             N is C1 * Unidade,!.                             
converteNRO([C|R],S,Unidade):-
                   atom_number(C,N),
                   Unidade1 is Unidade * 10,
                   converteNRO(R,S1,Unidade1),
                   S is (N*Unidade) + S1.
%%%%%%%%%%%%% Lê uma linha no formato de string e converte para número
%%%% Exemplo Chamda do Predicado leituraNRO('Nro: ',Nro).
%%%% Resultado: Nro: 1234
leituraNRO(Men,Nro):- write(Men),
	                  read_string(user_input, "\n", "\r\t ", _, Line),
	                  string_chars(Line,LineChars),
	                  inverte(LineChars,[],LineInvertida),
	                  converteNRO(LineInvertida,Nro,1).

%%%%%%%%%%%%%%%%%%%%% Inverte uma Lista
%%%% Exemplo de Chamada do Predicado inverte([1,2,3,4],[],LR).
%%%%% Resdultado: LR = [4,3,2,1]

inverte([],Aux,Aux):-!.
inverte([C|R],Aux,LR):- inverte(R,[C|Aux],LR).


%%%ler string
leituraStr(Men,Line):-  write(Men),
                        read_string(user_input, "\n", "\r\t ", _, Line).
%%%Opções 
%% Aqui é onde é chamado os predicados de acordo com as opões escolhidas na main

caso1(1,LE,LS):- ttyflush,
                leituraStr('Nome da Cidade:',Nome),
                leituraStr('Estado:',Estado),
                leituraNRO('Populacao:',Pop),
                leituraNRO('Distancia para a capital:',DistCap),
                inserecidadesBr(LE,cidade(Nome,Estado,Pop,DistCap),LS),!.
%%ver cidades de um estado
caso(2,LE):-    leituraStr('Estado que deseja ver as cidades:',Estado),
                cidadeEst(Estado,LE),!.

%%mostra cidades com mais de 100.000 habitantes
caso(3,LE):-    write('CIDADES COM MAIS DE 100MIL HABITANTES'),nl,
                cidadeCemMil(LE),!.


%Maior cidade
caso(4,LE):-    leituraStr('Estado que deseja saber a maior cidade: ',Estado),
                maiorCidade(Estado,LE,0,_),!.

%%Popuação de um estado

caso(5,LE):-    leituraStr('Estado que deseja saber a populacao:',Estado),
                calcPop(Estado,LE,0,Res),
                write('Populacao total = '),
                write(Res),nl,!.

%População media de um estado
caso(6,LE):-    leituraStr('Estado que deseja saber MEDIA da populacao:',Estado),
                mediaPop(Estado,LE,0,0,Media),
                write('Meida = '),write(Media),nl,!.

%%%Estado mais proximo da capital
caso(7,LE):- leituraStr('Estado que deseja saber a cidade mais proxima da capital: ',Estado),
            proxCap(Estado,LE,100000,Cid),
            write('Cidade mais proxima da capital eh: '),
            write(Cid),nl,!.

%%Capital de um Estado
caso(8,LE):-    leituraStr('Estado que deseja saber a capital: ',Estado),
                capital(Estado,LE),!.
%%%
caso(9,_):-     ttyflush,

                leituraStr('Nome da Cidade:',Nome),
                leituraStr('Estado:',Estado),
                leituraNRO('Populacao:',Pop),
                leituraNRO('Distancia para a capital:',DistCap),
                cidadeCap(cidade(Nome,Estado,Pop,DistCap)),!.
%%%
% A função main deve iniciar com uma lista vazia ou uma lista pre definida
%esta função é como o nome ja diz é a raiz de todo o programa, onde reune todas as informações e executa os predicados
%feitos acima
%OBS:. na leitura das opçoes por algum motivo que nao descobri a execução pede para ler a opção duas vezes
% e vai executar a opcao desejada ao ler a segunda vez. isso elo menos no meu pc utilixando w10
main(L):-   ttyflush,
            write('1 - Adicionar cidade'),nl,
            write('2 - Ver cidades cidades de um estado'),nl,
            write('3 - Ver cidades com mais de 100mil habitantes'),nl,
            write('4 - Maior Cidade'),nl,
            write('5 - Populacao de um estado'),nl,
            write('6 - Populacao Media de um Estado'),nl,
            write('7 - Cidade mais proxima da Cpital'),nl,
            write('8-  Capital de um Estado '),nl,
            write('9 - Cidade eh Capital'),nl,
            write('0 - Sair'),nl,
            leituraNRO('Opcao: ',Op),
            Op == 1,
            caso1(Op,L,LR),
            main(LR),!.
%%%%%

main(L):-   ttyflush,
            write('1 - Adicionar cidade'),nl,
            write('2 - Ver cidades cidades de um estado'),nl,
            write('3 - Ver cidades com mais de 100mil habitantes'),nl,
            write('4 - Maior Cidade'),nl,
            write('5 - Populacao de um estado'),nl,
            write('6 - Populacao Media de um Estado'),nl,
            write('7 - Cidade mais proxima da Cpital'),nl,
            write('8-  Capital de um Estado '),nl,
            write('9 - Cidade eh Capital'),nl,
            write('0 - Sair'),nl,
            leituraNRO('Opcao:',Op),
            Op \= 0,
            caso(Op,L),
            main(L),!.

main(_):-   write('Obrigado'),nl,!.