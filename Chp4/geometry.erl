-module(geometry).
-export([
    area/1, 
    test_area/0, 
    test_perimeter/0,
    perimeter/1,
    hypotenuse/2
]).

test_area() ->
    12 = area({rectangle, 4, 3}),
    16 = area({square, 4}),
    50.26544 = area({circle, 4}),
    tests_worked.

% * Exercise Chp 4 - 1
test_perimeter() -> 
    12.0 = perimeter({ra_triangle, 3, 4}),
    18 = perimeter({rectangle, 4, 5}),
    56.54862 = perimeter({circle, 9}),
    16 = perimeter({square, 4}),
    tests_worked.


% @ This is a function with three clauses
area({ra_triangle, Base, Height}) -> 0.5 * Base * Height; % * Exercise Chp 4 - 1
area({rectangle, Width, Height}) -> Width * Height;
area({circle, Radius}) -> 3.14159 * Radius * Radius;
area({square, Side}) -> Side * Side.

% * Exercise Chp 4 - 1
perimeter({ra_triangle, Base, Height}) -> Base + Height + hypotenuse(Base, Height);
perimeter({rectangle, Width, Height}) -> (2 * Width) + (2 * Height);
perimeter({circle, Radius}) -> 3.14159 * 2 * Radius;
perimeter({square, Side}) -> 4 * Side.

hypotenuse(Base, Height) -> math:sqrt((Base * Base) + (Height * Height)).
