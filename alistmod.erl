-module(alistmod).
-export([
          first/1, first/2,
          last/1, 
          nth/2, 
          append/2, 
          flatten/1, 
          sequence/1, sequence/2, sequence/3,
          contains/2,
          any/2,
          all/2,
          reverse/1,
          remove_duplicates/1,
          count/1,
          map/2
        ]).

% ------------ % ------------- % -------------- % ------------- % ------------ %

first([F|_]) -> F.

first(P, [T|H]) -> case P(T) of true -> T; false -> first(P, H) end.

last([X]) -> X;
last([_|T]) -> last(T).

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

any(_, []) -> false;
any(P, [X]) -> P(X);
any(P, [T|H]) -> P(T) or any(P, H).

contains(X, L) -> any(fun(Y) -> X == Y end, L).

all(_, []) -> true;
all(P, [X]) -> P(X);
all(P, [T|H]) -> P(T) and all(P, H).

reverse(L) -> reverse(L, []).

remove_duplicates(L) -> remove_duplicates(reverse(L), []).

count([]) -> 0;
count([_|H]) -> 1 + count(H).

map(F, L) -> [F(X) || X <- L].

% ------------ % ------------- % -------------- % ------------- % ------------ %

last_in_sequence(From, To, Step) when is_integer(Step) -> To - ((To - From) rem Step).

reverse([], Acc) -> Acc;
reverse([T|H], Acc) -> reverse(H, [T|Acc]).

% removes duplicates but doesn't preserve order,
% infact is the 'correct' order if the list was in the reverse order
remove_duplicates([], Acc) -> Acc;
remove_duplicates([T|H], Acc) -> case contains(T, H) of
                                   true -> remove_duplicates(H, Acc);
                                   false -> remove_duplicates(H, [T|Acc]) end.
