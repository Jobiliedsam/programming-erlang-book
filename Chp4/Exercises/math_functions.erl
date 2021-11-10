-module(math_functions).
-export([
    even/1, 
    odd/1, 
    filter/2, 
    filter_guard/2,
    split/1,
    split_ac/1
]).

% * Exercise 4 - 5
even(Number) -> Number rem 2 == 0.

odd(Number) -> Number rem 2 /= 0.

% * Exercise 4 - 6
filter(List, Function) -> [X || X <- List, Function(X) == true].

filter_guard([H|T], Function) ->
    case Function(H) of 
        true -> [H|filter_guard(T, Function)];
        false -> filter_guard(T, Function)
    end;
filter_guard([], _Function) -> [].

% * Exercise 4 - 7
split(L) -> 
    Evens = filter(L, fun(Number) -> Number rem 2 == 0 end),
    Odds = filter(L, fun(Number) -> Number rem 2 /= 0 end),
    {Evens, Odds}.

split_ac(L) ->
    split_acc(L, [], []).

split_acc([H|T], Odds, Evens) ->
    case H rem 2 == 0 of 
        true -> split_acc(T, Odds, [H|Evens]);
        false -> split_acc(T, [H|Odds], Evens)
    end;
split_acc([], Odds, Evens) -> {Odds, Evens}.

