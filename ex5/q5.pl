leituraStr(Men,Line):-  write(Men),
                        read_string(user_input, "\n", "\r\t ", _, Line). %ler a string 

converteStoLC(Str,LCarac):- string_chars(Str,LCarac).%converte string para char e vise-versa


space([],Cont,Cont):-!. %predicado de parada
space([C|R],Cont,Qtd):- C == ' ', %verifica espaço em branco
                        Cont1 is Cont + 1,
                        space(R,Cont1,Qtd),!.%recursao sem pendencia
space([_|R],Cont,Qtd):- space(R,Cont,Qtd),!.

main:-  ttyflush,
        leituraStr('Digite uma string: ', S),nl,
        converteStoLC(S,LC),
        space(LC,0,Qtd),
        write(Qtd),nl,!.

/*ex:.

main. qualquer string
ou space(['s','a','u','l',' ','r','o','c','h','a'],0,Qtd).

*/