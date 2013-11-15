-module(maths).
-compile(export_all).

floor(X) when (trunc(X) == X) -> trunc(X); % trunc to ensure integer
floor(X) when (X > 0) -> trunc(X);
floor(X) -> trunc(X-1).

ceiling(X) when (trunc(X) == X) -> trunc(X); % trunc to ensure integer
ceiling(X) when (X > 0) -> -trunc(-X-1);
ceiling(X) -> trunc(X).

divisible(X, X) -> true;
divisible(X, Y) when abs(Y) > abs(X) -> false; % also covers zero not divisible by anything
divisible(X, Y) -> X/Y == trunc(X/Y).
