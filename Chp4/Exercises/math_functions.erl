-module(math_functions).
-export([even/1, odd/1, filter/2]).

% * Exercise 4 - 5
even(Number) -> Number rem 2 == 0.

odd(Number) -> Number rem 2 /= 0.

% * Exercise 4 - 6
filter(List, Function) -> [ X || X <- List, Function(X) == true].