-module(maths).
-export([floor/1, ceiling/1, divisible/2, even/1, odd/1]).

floor(X) when (trunc(X) == X) -> trunc(X); % trunc to ensure integer
floor(X) when (X > 0) -> trunc(X);
floor(X) -> trunc(X-1).

ceiling(X) when (trunc(X) == X) -> trunc(X); % trunc to ensure integer
ceiling(X) when (X > 0) -> -trunc(-X-1);
ceiling(X) -> trunc(X).

divisible(X, Y) -> (X rem Y) == 0.

even(X) -> divisible(X, 2).

odd(X) -> not divisible(X, 2).
