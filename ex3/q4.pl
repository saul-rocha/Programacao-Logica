inter(I,F):- I =< F,
             Res is I mod 7,
             Res == 0,
             write('* '),
             I1 is I + 1,
             inter(I1,F),!.

inter(I,F):-    I =< F,
                Res is I mod 11,
                Res == 0,
                write('o '),
                I1 is I + 1,
                inter(I1,F),!.

inter(I,F):-    I =< F,
                write(I),write(' '),
                I1 is I + 1,
                inter(I1,F),!.

inter(_,_):- nl,!.

