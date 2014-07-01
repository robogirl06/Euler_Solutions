%Project Euler #15
%Starting in the top left corner of a 2x2 grid, and only being able to move 
%to the right and down, there are exactly 6 routes to the bottom right 
%corner.
%How many such routes are there through a 20x20 grid?

clear all
clc

%size of grid
grid=20;

%Based on combinatorial logic from
%http://mathforum.org/library/drmath/view/70459.html

path=factorial(2*grid)/(factorial(grid)^2);

path = num2str(path)
