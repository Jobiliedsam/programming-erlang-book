-module(my_tuple_to_list).
-export([my_tuple_to_list/1]).

% * Exercise 4 - 2
my_tuple_to_list(Tuple) when is_tuple(Tuple) == true ->
    my_tuple_to_list_iter(1, Tuple);
my_tuple_to_list(_Tuple) -> "bad argument.".

my_tuple_to_list_iter(I, Tuple) when I > tuple_size(Tuple) -> [];
my_tuple_to_list_iter(I, Tuple) -> 
    IterItem = element(I, Tuple),
    [IterItem|my_tuple_to_list_iter(I + 1, Tuple)].

% real_iter(Max, Max, Tuple, List) -> [element(Max, Tuple)|List];
% real_iter(I, Max, Tuple, List) -> 
%     real_iter(I + 1, Max, Tuple, [element(I, Tuple)|List]).
