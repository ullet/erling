-module(alistmod).
-export([first/1, last/1, nth/2]).

first([F|_]) -> F.

last([X]) -> X;

last([_|T]) -> last(T).

nth([], _) -> nothing;

nth(L, 0) -> first(L);

nth([_|T], N) -> nth(T, N-1).
