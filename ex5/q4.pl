mult3e5([],[],[]). %predicado de parada

mult3e5([C1|R1],[],L):-     Res is C1 mod 3,
                            Res1 is C1 mod 5,
                            Res == 0,
                            Res1 == 0,
                            mult3e5(R1,[],LR),
                            L = [C1|LR],!.

mult3e5([_|R1],[],L):- mult3e5(R1,[],L),!.

mult3e5([],[C2|R2],L):-      Res is C2 mod 3,
                            Res1 is C2 mod 5,
                            Res == 0,
                            Res1 == 0,
                            mult3e5([],R2,LR),
                            L = [C2|LR],!.

mult3e5([],[_|R2],L):-     mult3e5([],R2,L),!.
%C1 maior que C2
mult3e5([C1|R1],[C2|R2],L):-    Res is C1 mod 3,
                                Res1 is C1 mod 5,
                                Res2 is C2 mod 3,
                                Res3 is C2 mod 5,
                                Res == 0,
                                Res1 == 0,
                                Res2 == 0,
                                Res3 == 0,
                                C1 < C2,
                                mult3e5(R1,[C2|R2],LR),
                                L = [C1|LR],!.
%C2 maior que C1
mult3e5([C1|R1],[C2|R2],L):-    Res is C1 mod 3,
                                Res1 is C1 mod 5,
                                Res2 is C2 mod 3,
                                Res3 is C2 mod 5,
                                Res == 0,
                                Res1 == 0,
                                Res2 == 0,
                                Res3 == 0,
                                C1 > C2,
                                mult3e5([C1|R1],R2,LR),
                                L = [C2|LR],!.
% C1 igual a C2
mult3e5([C1|R1],[C2|R2],L):-    Res is C1 mod 3,
                                Res1 is C1 mod 5,
                                Res2 is C2 mod 3,
                                Res3 is C2 mod 5,
                                Res == 0,
                                Res1 == 0,
                                Res2 == 0,
                                Res3 == 0,
                                mult3e5(R1,R2,LR),
                                L = [C1|LR],!.
%somente C1 divisvel
mult3e5([C1|R1],[_|R2],L):-     Res is C1 mod 3,
                                Res1 is C1 mod 5,
                                Res == 0,
                                Res1 == 0,
                                mult3e5([C1|R1],R2,L),!.
%somente C2 divisivel
mult3e5([_|R1],[C2|R2],L):-     Res is C2 mod 3,
                                Res1 is C2 mod 5,
                                Res == 0,
                                Res1 == 0,
                                mult3e5(R1,[C2|R2],L),!.
% para caso nao seja divisivel
mult3e5([_|R1],[_|R2],L):-  mult3e5(R1,R2,L),!.


/*
ex:.

mult3e5([],[1,3,5,7,15],L).
mult3e5([1,5,7],[1,3,5,7,15],L).
mult3e5([1,5,7,30],[1,3,5,7,15],L).
mult3e5([30,45,65],[15,80,105],L).
mult3e5([30,45,65],[15,75,105],L).

*/