nasceuEm(joao,picos).
nasceuEm(paulo,fortaleza).
nasceuEm(camila,teresina).
nasceuEm(ana,oeiras).
nasceuEm(joaquim,teresina).
nasceuEm(paula,fortaleza).
ficaEm(picos,piaui).
ficaEm(teresina,piaui).
ficaEm(fortaleza,ceara).
ficaEm(oeiras,piaui).


%%%% imprime cidade e estado de uma pessoa A
%%% Execuçao:.    cidEst.
%%%% deve-se colocar o . no final da digitaçãos
%%      --> Entrada   joao.
%%%     --> Saida     picos

cidEst:-    write('PESSOA: '),
            read(Pessoa),
            nasceuEm(Pessoa,X),
            ficaEm(X,Y),
            write(Pessoa), write(' nasceu em '),write(X), write(' no '),write(Y),nl,!.
cidEst:-    write('Nao encontrado!'),nl.%% condição para caso nao encontre nada

%%estado em que pertence uma cidade B
%%execução:.    estado.
%% idem a anterior
estado:-    write('CIDADE: '),
            read(Cidade),
            ficaEm(Cidade,X),
            write(Cidade),write(' fica no '),write(X),nl,!.
estado:-    write('Cidade nao encontrada!'),nl. %% condição para caso nao encontre nada


%% mostra pessoas que nasceram em uma cidade C
%% execução:. pertenceCidade(teresina).
%%            camila nasceu em teresina
%%            joaquim nasceu em teresina


pertenceCidade(Cidade):-    nasceuEm(X,Cidade),
                            write(X),write(' nasceu em '),write(Cidade),nl,
                            fail. %força uma falha para buscar toda a base de dados

pertenceCidade(Cidade):-    nasceuEm(_,Cidade),!.% caso tenho tenha alguem que more na Cidade nao 
                                                    %importa quem impede a leitura da proxima clausula

pertenceCidade(Cidade):-    write('Ninguem mora em '), write(Cidade),nl.

%%% cidades que fazem parte de um estado D
%%% execução    cidadesEstado(nome_estado).
%% idem anterior
cidadesEstado(Estado):- ficaEm(X,Estado),
                        write(X),write(' fica no '),write(Estado),nl,
                        fail.

cidadesEstado(Estado):- ficaEm(_,Estado),!.

cidadesEstado(Estado):- write('Nenhuma cidade pertence a'),write(Estado),nl.

%%% pessoas que nasceram em um estado E
%%% execução :. pessoasEstado(paui).

%% joao nasceu no estado do piaui
%% camila nasceu no estado do piaui
%% joaquim nasceu no estado do piaui
%% ana nasceu no estado do piaui


pessoasEstado(Estado):- ficaEm(X,Estado),
                        nasceuEm(Pessoa,X),
                        write(Pessoa),write(' nasceu no estado do '),write(Estado),nl,
                        fail.
pessoasEstado(Estado):- ficaEm(X,Estado),
                        nasceuEm(_,X),!.

pessoasEstado(Estado):- write('Ninguem nasceu no '),write(Estado),nl.