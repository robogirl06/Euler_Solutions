%Project Euler #6
%By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, 
%we can see that the 6th prime is 13.
%What is the 10 001st prime number?

clear all
clc

j=1;
i=1;
ptable=[];
while i<=10001
    if isprime(j)==1
        ptable=[ptable;[i,j]];
        i=i+1;
    end
    j=j+1;
end
disp(['10001st prime = ', num2str(ptable(i-1,2))])