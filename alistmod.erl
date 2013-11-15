-module(alistmod).
-compile(export_all).

first([F|_]) -> F.

last([X]) -> X;
last([_|T]) -> last(T).

nth([], _) -> nothing;
nth(L, 0) -> first(L);
nth([_|T], N) -> nth(T, N-1).

% append assuming lists only
append([], L) -> L;
append([X], L) -> [X|L];
append([H|T], L) -> [H|append(T, L)].

% append lists and non-lists to form new list
append2([], L) when is_list(L) -> L;
append2([X], L) when is_list(L) -> [X|L];
append2([H|T], L) when is_list(L) -> [H|append2(T, L)];
append2(X, L) when is_list(L) -> append2([X], L);
append2(L, Y) when is_list(L) -> append2(L, [Y]);
append2(X, Y) -> [X, Y].

% flatten nested lists to single list - using append as defined above
flatten([]) -> [];
flatten([X]) when is_list(X) -> flatten(X);
flatten([X]) -> [X];
flatten([T|H]) -> append(flatten([T]), flatten(H)).

% flatten nested lists to single list - using standard ++ append operator
flatten2([]) -> [];
flatten2([X]) when is_list(X) -> flatten2(X);
flatten2([X]) -> [X];
flatten2([T|H]) -> flatten2([T]) ++ flatten2(H).
