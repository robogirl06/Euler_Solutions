%Project Euler #10
%The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
%Find the sum of all the primes below two million.

clear all
clc
p=primes(2*10^6);
format long
psum=sum(p);
disp(num2str(psum))