% Project Euler #28
% Starting with the number 1 and moving to the right in a clockwise 
% direction a 5 by 5 spiral is formed as follows:
% 
% 21 22 23 24 25
% 20  7  8  9 10
% 19  6  1  2 11
% 18  5  4  3 12
% 17 16 15 14 13
% 
% It can be verified that the sum of the numbers on the diagonals is 101.
% 
% What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral 
% formed in the same way?

clear all
clc

i=1;
a=0;
n=1001;

% For the diagonals from the center to the upper right hand corner, each
% value is the square of the length of the side.  So sum all the odd
% squares
while i<=n
    a=a+i^2;
    i=i+2;
end
i=2;
while i<=n
    % For the diagonals from the center to the lower left corner, each
    % value is equal to i^2+1, where i is all the even numbers from 2 to n
    a=a+(i^2+1);
    % For the diagonals from the center to the lower right corner, each
    % value is equal to i*(i-1)+1, where i is all the even numbers from 
    % 2 to n
    a=a+(i*(i-1)+1);
    % For the diagonals from the center to the upper left corner, each
    % value is equal to i*(i+1)+1, where i is all the even numbers from 
    % 2 to n
    a=a+(i*(i+1)+1);
    i=i+2;
end

a