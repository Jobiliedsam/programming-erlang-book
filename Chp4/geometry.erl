-module(geometry).
-export([
    area/1, 
    test_area/0
]).

test_area() ->
    12 = area({rectangle, 4, 3}),
    16 = area({square, 4}),
    50.26544 = area({circle, 4}),
    tests_worked.

% @ This is a function with three clauses
area({rectangle, Width, Height}) -> Width * Height;
area({circle, Radius}) -> 3.14159 * Radius * Radius;
area({square, Side}) -> Side * Side.
