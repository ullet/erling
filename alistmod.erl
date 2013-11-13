-module(alistmod).
-compile(export_all).

first([F|_]) -> F.

last([X]) -> X;
last([_|T]) -> last(T).

nth([], _) -> nothing;
nth(L, 0) -> first(L);
nth([_|T], N) -> nth(T, N-1).

append([], L) -> L;
append([X], L) -> [X|L];
append([H|T], L) -> [H|append(T, L)].
