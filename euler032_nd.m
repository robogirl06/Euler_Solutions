% Project Euler #32
% We shall say that an n-digit number is pandigital if it makes use of all
% the digits 1 to n exactly once; for example, the 5-digit number, 15234, 
% is 1 through 5 pandigital.
% 
% The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing
% multiplicand, multiplier, and product is 1 through 9 pandigital.
% 
% Find the sum of all products whose multiplicand/multiplier/product 
% identity can be written as a 1 through 9 pandigital.
% 
% HINT: Some products can be obtained in more than one way so be sure to 
% only include it once in your sum.

clear all
clc

p=['987654321'];
P=perms(p);
% maximum value of product is equal to 9876
% maximum value of one multiplicand is 4987
% no multiplicand/multiplier values can end in 1
% no values can end in 5


