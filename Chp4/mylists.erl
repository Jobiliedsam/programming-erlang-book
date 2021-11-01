-module(mylists).
-export([
    sum/1,
    map/2, 
    map_comprehension/2, 
    for/3,
    filter/2,
    for_guards/3
]).

sum([H|T]) -> H + sum(T);
sum([]) -> 0.

 % @ Map Exit Condition: Mapping any function over the elements of an empty list just prodeuces an empty list.
map(Function, [H|T]) -> [Function(H)|map(Function, T)];
map(_, []) -> []. 

map_comprehension(Function, L) -> [Function(X)|| X <- L].

% @ control structure - for(I, Max, F) - to create a list with rules
% @ For Exit Condition: I = Max.
for(Max, Max, Function) -> [Function(Max)];
for(I, Max, Function) -> [Function(I)|for(I + 1, Max, Function)].

for_guards(I, Max, Function) ->
    case I =:= Max of
        true -> [Function(Max)];
        false -> [Function(I)|for_guards(I + 1, Max, Function)]
    end.

% @ filter with guards
% * Case - filter(IsEven, [1, 2, 3, 4])
% * filter(filter(IsEven, [2, 3, 4])
% * filter(filter([2|filter(IsEven, [3, 4])]))
% * filter(filter([2|filter(filter(IsEven, [4| ]))]))
% * filter(filter([2|filter(filter(filter([4|filter(Iseven, [])])))]))
% * filter(filter([2|filter(filter(filter([4|[]])))]))
% * filter(filter([2|filter(filter([4|[]]))]))
% * filter(filter([2|filter([4|[]])]))
% * filter(filter([2|[4|[]])
% * filter([2, 4])
% * [2, 4]
filter(Function, [H|T]) ->
    case Function(H) of 
        true -> [H|filter(Function, T)];
        false -> filter(Function, T)
    end;
filter(_Function, []) -> 
    [].
