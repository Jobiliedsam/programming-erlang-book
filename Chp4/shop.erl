-module(shop).
-export([cost/1, total_cost/1, total/1, test/0]).
-import(mylists, [map/2, sum/1]). % ^ use c(mylists). in erlang prompt before use this module.

cost(newspaper) -> 8;
cost(oranges) -> 5;
cost(apples) -> 2;
cost(pears) -> 9;
cost(milk) -> 7.

total_cost([{Product, Quantity}|T]) -> shop:cost(Product) * Quantity + total_cost(T);
total_cost([]) -> 0.

total(L) ->
    sum(map(fun({Product, Quantity}) -> cost(Product) * Quantity end, L)).

test() ->
    Buy = [{oranges, 4}, {newspaper, 1}, {apples, 10}, {pears, 6}, {milk, 3}],
    123 = lists:sum([cost(Product) * Quantity || {Product, Quantity} <- Buy]), 
    123 = total(Buy),
    test_worked.
