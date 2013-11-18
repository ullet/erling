-module(alistmod).
-export([
          first/1, 
          last/1, 
          nth/2, 
          append/2, 
          flatten/1, 
          sequence/1, sequence/2, sequence/3
        ]).

% ------------ % ------------- % -------------- % ------------- % ------------ %

first([F|_]) -> F.

last([X]) -> X;
last([_|T]) -> last(T).

nth([], _) -> nothing;
nth(L, 0) -> first(L);
nth([_|T], N) -> nth(T, N-1).

append([], L) -> L;
append([X], L) -> [X|L];
append([H|T], L) -> [H|append(T, L)].

flatten([]) -> [];
flatten([X]) when is_list(X) -> flatten(X);
flatten([X]) -> [X];
flatten([T|H]) -> flatten([T]) ++ flatten(H).

sequence(F, T, S, Acc) when is_list(Acc) and is_integer(S) and (((S < 0) and (F < T)) or ((S >= 0) and (F > T))) -> Acc;
sequence(F, T, S, Acc) when is_list(Acc) and is_integer(S) -> case ((F == T) or maths:divisible(T-F, S)) of
                                              true  -> sequence(F, T-S, S, [T|Acc]);
                                              false -> sequence(F, last_in_sequence(F, T, S), S, Acc) end.

sequence(F, T, S) when is_integer(S) -> sequence(F, T, S, []).

sequence(F, T) -> sequence(F, T, 1).

sequence(N) -> sequence(0, N-1).

% ------------ % ------------- % -------------- % ------------- % ------------ %

last_in_sequence(From, To, Step) when is_integer(Step) -> From + (Step * maths:floor((To - From) / Step)).
