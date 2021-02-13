leituraStr(Men,Line):-  write(Men),
                        read_string(user_input, "\n", "\r\t ", _, Line).%ler string

converteStoLC(Str,LCarac):- string_chars(Str,LCarac).%converte string em caractere e vise-versa

contida([],_,1):-!.%predicado de parada se string 1  contida em strng 2
contida(_,[],0):-!.%inverso da acima
contida([C1|R1],[C2|R2],Res):-  C1 == C2, %verificação
                                contida(R1,[C2|R2],Res),!.%recursao sem pendencia

contida([C1|R1],[_|R2],Res):- contida([C1|R1],R2,Res),!. 


main:-  ttyflush,
        leituraStr('Digite uma string: ', S),nl,
        leituraStr('Digite uma string: ', S1),nl,
        converteStoLC(S,LC), %string para lista de caractere
        converteStoLC(S1,LC1),
        contida(LC,LC1,Res),
        write(Res),nl,!.