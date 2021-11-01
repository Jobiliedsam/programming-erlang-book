-module(lib_misc).
-export([
    temp_convert/1, 
    qsort/1, 
    py_triplets/1,
    perms/1,
    max/2,
    fib_list/1
]).

temp_convert({c, Temperature}) -> {f, 32 + Temperature * 9 / 5};
temp_convert({f, Temperature}) -> {c, (Temperature - 32) * 5 / 9}.

% @ Quick Sort Algorithm using List Comprehensions with logical operators.
qsort([]) -> [];
qsort([Pivot|T]) -> 
    qsort([X || X <- T, X < Pivot]) 
    ++ [Pivot] ++ % ^ Using ++ in this way is not generally good programming pratice.
    qsort([X || X <- T, X >= Pivot]).

% @ Find pythagorean Triplets {A, B, C} where A^2 + B^2 = C^2
py_triplets(N) -> 
    [ {A, B, C} ||
        A <- lists:seq(1, N),
        B <- lists:seq(1, N),
        C <- lists:seq(1, N),
        A + B + C =< N,
        A * A + B * B =:= C * C
    ].


% @ Anagramsto find all the permutations of a string 
perms([]) -> [[]];
perms(L) -> [[H|T] || H <- L, T <- perms(L -- [H])].

% @ Using guards in max function
max(X, Y) when X > Y -> X;
max(_X, Y) -> Y.


% @ Generate N terms of fibonacci sequence
fib_list(N) ->
    fib_iter(0, 1, [], N, 1).

fib_iter(_Inital, _Next, Result, Terms, Terms) -> lists:reverse(Result);
fib_iter(Initial, Next, Result, Terms, Iter) ->
    H1 = Initial + Next,
    fib_iter(Next, H1, [H1|Result], Terms, Iter + 1).
