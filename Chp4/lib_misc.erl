-module(lib_misc).
-export([
    temp_convert/1, 
    qsort/1, 
    py_triplets/1,
    perms/1,
    max/2,
    fib_list/1,
    odds_and_evens_c/1,
    odds_and_evens_a/1
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

% @ Generate a tuple with two segregated list between odds and evens - Using Comprehensions List
% ^ In this way we traverse the list twice - performance problem.
odds_and_evens_c(List) ->
    odds = [X || X <- List, (X rem 2) == 1],
    evens = [X || X <- List, (X rem 2) == 0],
    {odds, evens}.

% @ Generate a tuple with two segregated list between odds and evens - Using Accumulators Pattern
odds_and_evens_a(List) ->
    odds_and_evens_acc(List, [], []).

odds_and_evens_acc([H|T], Odds, Evens) ->
    case (H rem 2) of
        1 -> odds_and_evens_acc(T, [H|Odds], Evens);
        0 -> odds_and_evens_acc(T, Odds, [H|Evens])
    end;
odds_and_evens_acc([], Odds, Evens) -> {Odds, Evens}.


