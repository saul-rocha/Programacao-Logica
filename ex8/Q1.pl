:-dynamic(nasceuCidade/2).%Pessoa nasceu em Cidade
:-dynamic(cidadeEstado/2).%Cidade fica em Estado
:-dynamic(estadoPais/2).%Estado fica no Pais
%%%%

%%%ler string
leituraStr(Men,Line):-  write(Men),
                        read_string(user_input, "\n", "\r\t ", _, Line).

%verifica se um pais existe
existePais(Pais,1):- estadoPais(_,Pais),!.
existePais(_,0).

%%% verifica se um estado existe
existeEstado(Estado,1):- estadoPais(Estado,_),!.
existeEstado(_,0).

%% verifica se uma cidade existe.
existeCity(Cidade,1):- cidadeEstado(Cidade,_),!.
existeCity(_,0).

%%%%%%			cadastro do pais de um estado	 I
cadastrarPaisEstado:-   leituraStr('Digite o Estado do Pais que Deseja Cadastrar: ',Estado),
                        existeEstado(Estado,Resp1),
                        Resp1 == 0,
                        leituraStr('Digite o Pais do Estado Acima: ',Pais),
                        assert(estadoPais(Estado,Pais)),!.
					
cadastrarPaisEstado:- write('Pais e/ou Estado ja Existente!!!'),nl.

%%%                 cadastro cidade de um estado II

cadastrarCityEstado:-   leituraStr('Digite a Cidade do Estado que Deseja Cadastrar: ',City),
                        existeCity(City,Resp),
                        Resp == 0,
                        leituraStr('Digite o Estado da Cidade Acima: ',Estado),
                        existeEstado(Estado,Resp1),
                        Resp1 == 1,
                        assert(cidadeEstado(City,Estado)),!.
cadastrarcityEstado:-  write(' Primeiro cadastrar o pais deste estado ou a cidade ja existe!!!'),nl.

%%                  cadastrar cidade de nascimento de uma pessoa III

cadastroPessoa:-    leituraStr('Digite a Cidade de Nascimento da Pessoa: ',City),
                    existeCity(City,Resp),
                    Resp == 1,
                    leituraStr('Digite o Nome da Pessoa: ',Pessoa),
                    assert(nasceuCidade(Pessoa,City)),!.
cadastroPessoa:-    write('Primeiro deve cadastrar o estado desta cidade!!!'),nl,!.
                  


%%%%%%%             imprimir pessoa, cidade e estado IV 
imprimirCityPessoa(Pessoa):-    nasceuCidade(Pessoa,City),
                                cidadeEstado(City,Estado),
                                write(Pessoa),write(' nasceu em '),write(City),
                                write(' no '),write(Estado),
                                write('.'),nl,!.
			
imprimirCityPessoa.

%%estado em que pertence uma cidade  V
%%execução:.    estado.
%% idem a anterior
estado(Cidade):-    
            cidadeEstado(Cidade,X),
            write(Cidade),write(' fica no '),write(X),nl,!.
estado(_).


%% mostra pessoas que nasceram em uma cidade VI
%% execução:. pertenceCidade(teresina).
%%            camila nasceu em teresina
%%            joaquim nasceu em teresina


pertenceCidade(Cidade):-    nasceuCidade(X,Cidade),
                            write(X),write(' nasceu em '),write(Cidade),nl,
                            fail. %força uma falha para buscar toda a base de dados

pertenceCidade(Cidade):-    nasceuCidade(_,Cidade),!.% caso tenho tenha alguem que more na Cidade nao 
                                                    %importa quem impede a leitura da proxima clausula

pertenceCidade(Cidade):-    write('Ninguem mora em '), write(Cidade),nl.

%%% cidades que fazem parte de um estado VII
%%% execução    cidadesEstado(nome_estado).
%% idem anterior
cidadesEstado(Estado):- cidadeEstado(X,Estado),
                        write(X),write(' fica no '),write(Estado),nl,
                        fail.

cidadesEstado(Estado):- cidadeEstado(_,Estado),!.

cidadesEstado(Estado):- write('Nenhuma cidade pertence a'),write(Estado),nl.



%%% pessoas que nasceram em um estado VIII
%%% execução :. pessoasEstado(paui).

%% joao nasceu no estado do piaui
%% camila nasceu no estado do piaui
%% joaquim nasceu no estado do piaui
%% ana nasceu no estado do piaui


pessoasEstado(Estado):- cidadeEstado(X,Estado),
                        nasceuCidade(Pessoa,X),
                        write(Pessoa),write(' nasceu no estado do '),write(Estado),nl,
                        fail.
pessoasEstado(Estado):- cidadeEstado(X,Estado),
                        nasceuCidade(_,X),!.

pessoasEstado(Estado):- write('Ninguem nasceu no '),write(Estado),nl.

%%%%%%
converteNRO([C],N,Unidade):- atom_number(C,C1),
							N is C1 * Unidade,!.                             
converteNRO([C|R],S,Unidade):-
					atom_number(C,N),
					Unidade1 is Unidade * 10,
					converteNRO(R,S1,Unidade1),
					S is (N*Unidade) + S1.
					
					
%%%%%

menu(Op):- ttyflush,
            write('1 - Cadastrar Pais de um Determinado Estado'), nl,
            write('2 - Cadastrar Estado de uma Determinada Cidade'), nl,
            write('3 - Cadastrar Cidade de Nascimento uma Pessoa'), nl,
            write('4 - Imprimir Pessoa, Cidade que Nasceu e Estado'), nl,
            write('5 - Imprimir Estado que Pertence uma Cidade'), nl,
            write('6 - Imprimir Pessoas que Nasceram em uma Cidade'),nl,
            write('7 - Imprimir Cidades de um Estado'), nl,
            write('8 - Imprimir Pessoas que Nasceram em um Estado'), nl,
            write('9 - Sair'),
            write('Digite a opção desejada: '),	
            read_string(user_input, "\n", "\r\t ", _, Line), nl,
            string_chars(Line,LineChars),
            converteNRO(LineChars,Op,1).
			
			
caso(1):- cadastrarPaisEstado,!.

caso(2):- cadastrarCityEstado,!.		

caso(3):- cadastroPessoa,!.
			
caso(4):-   leituraStr('Nome da Pessoa: ',Pessoa),
            imprimirCityPessoa(Pessoa),!.
			
			
caso(5):-   leituraStr('CIDADE: ',Cidade),
            estado(Cidade),!.

caso(6):-   leituraStr('Cidade: ',Cidade),
            pertenceCidade(Cidade),!.
caso(7):-   leituraStr('Estado: ',Estado),
            cidadesEstado(Estado),!.

caso(8):-   leituraStr('Estado: ',Estado),
            pessoasEstado(Estado),!.

			
principal:- menu(Op),
			Op \= 9,
			caso(Op),
			principal,!.
			
principal.						
