leituraStr(Men,Line):-  write(Men),
                        read_string(user_input, "\n", "\r\t ", _, Line).

converteStoLC(Str,LCarac):- string_chars(Str,LCarac).

vogal([],Cont,Cont):-!.
vogal([C|R],Cont,Qtd):- (C == 'a';C == 'e';C == 'i';C =='o';C == 'u'),
                        Cont1 is Cont + 1,
                        vogal(R,Cont1,Qtd),!.
vogal([_|R],Cont,Qtd):- vogal(R,Cont,Qtd),!.



main:-  ttyflush,
        leituraStr('Digite uma string: ', S),nl,
        converteStoLC(S,LC),
        vogal(LC,0,Qtd),
        write(Qtd),nl,!.