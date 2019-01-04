%% 2019 - Ahmet Cetinkaya

increaseBaseAux(0, _, _, Acc, NewNumber) :- NewNumber is Acc.
increaseBaseAux(Number, Base, Index, Acc, NewNumber) :- A is div(Number, Base),
                                                        NextIndex is Index + 1,
                                                        increaseBaseAux(Index, Base, 0, 0, Value),
                                                        NewAcc is Acc + ((Base + 1) ** Value) * (Number rem Base),
                                                        increaseBaseAux(A, Base, NextIndex, NewAcc, NewNumber).

increaseBase(Number, Base, NewNumber) :- increaseBaseAux(Number, Base, 0, 0, NewNumber).

goodsteinIterate(Number, Base, NextNumber) :- increaseBase(Number, Base, NewNumber), NextNumber is NewNumber - 1.

goodsteinSequence(0, _, [0]).
goodsteinSequence(InitialNumber, InitialBase, [H|T]) :- InitialNumber > 0,
                                                        H is InitialNumber,
                                                        goodsteinIterate(InitialNumber, InitialBase, NextNumber),
                                                        NextBase is InitialBase + 1,
                                                        goodsteinSequence(NextNumber, NextBase, T).
