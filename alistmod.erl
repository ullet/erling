-module(alistmod).
-compile(export_all).

first([F|_]) -> F.

last([X]) -> X;
last([_|T]) -> last(T).

nth([], _) -> nothing;
nth(L, 0) -> first(L);
nth([_|T], N) -> nth(T, N-1).

append([], L) when is_list(L) -> L;
append([X], L) when is_list(L) -> [X|L];
append([H|T], L) when is_list(L) -> [H|append(T, L)];
append(X, L) when is_list(L) -> append([X], L);
append(L, Y) when is_list(L) -> append(L, [Y]);
append(X, Y) -> [X, Y].

flatten([]) -> [];
flatten([X]) when is_list(X) -> flatten(X);
flatten([X]) -> [X];
flatten([T|H]) -> append(flatten([T]), flatten(H)).
