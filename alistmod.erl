-module(listy).
-export([first/1, last/1]).

first([F|_]) -> F.

last([X]) -> X;

last([_|T]) -> last(T).
