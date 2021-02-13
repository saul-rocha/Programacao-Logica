leituraStr(Men,Line):-  write(Men),
                        read_string(user_input, "\n", "\r\t ", _, Line).%ler string

converteStoLC(Str,LCarac):- string_chars(Str,LCarac).%converte string em caractere e vise-versa

vogais([],[]):-!.
vogais([C|R],L):-   (C == 'a';C == 'e';C == 'i';C =='o';C == 'u'),
                    vogais(R,LR),
                    L  = [C|LR],!.

vogais([_|R],L):- vogais(R,L),!.



main:-  ttyflush,
        leituraStr('Digite uma string: ', S),nl,
        converteStoLC(S,LC), %string para lista de caractere
        vogais(LC,L),
        converteStoLC(LR,L), %lista de caractere para string
        write(LR),nl,!.