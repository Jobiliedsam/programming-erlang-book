-module(generalization).
-export([make_test/1, mult/1]).

make_test(List) -> 
    fun(X) -> 
        lists:member(X, List) 
    end.

mult(Times) ->
    fun(X) ->
        X * Times
    end.
