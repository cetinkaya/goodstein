%% 2019 - Ahmet Cetinkaya

increase_base_aux(0, _, _, Acc, NewNumber) :- NewNumber is Acc.
increase_base_aux(Number, Base, Index, Acc, NewNumber) :- A is div(Number, Base),
                                                          NextIndex is Index + 1,
                                                          increase_base_aux(Index, Base, 0, 0, Value),
                                                          NewAcc is Acc + ((Base + 1) ** Value) * (Number rem Base),
                                                          increase_base_aux(A, Base, NextIndex, NewAcc, NewNumber).

increase_base(Number, Base, NewNumber) :- increase_base_aux(Number, Base, 0, 0, NewNumber).

goodstein_iterate(Number, Base, NextNumber) :- increase_base(Number, Base, NewNumber), NextNumber is NewNumber - 1.

goodstein_sequence(0, _, [0]).
goodstein_sequence(InitialNumber, InitialBase, [H|T]) :- InitialNumber > 0,
                                                         H is InitialNumber,
                                                         goodstein_iterate(InitialNumber, InitialBase, NextNumber),
                                                         NextBase is InitialBase + 1,
                                                         goodstein_sequence(NextNumber, NextBase, T).
