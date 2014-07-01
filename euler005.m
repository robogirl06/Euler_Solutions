%Project Euler #5
%2520 is the smallest number that can be divided by each of the numbers 
%from 1 to 10 without any remainder.
%What is the smallest positive number that is evenly divisible by all of 
%the numbers from 1 to 20?

clear all
clc

a=1;
for i=1:20                      %modify range of i to find other values
    if isprime(i)==1            %if prime, needs to be included in value
        a=a*i;
    else
        if a/i ~= floor(a/i)    %if not prime, is it already a factor?
            n=factor(i);       
            j=1;
            a_mult=1;
            a_temp=a;
            while j<=length(factor(i))  
                %if not already a factor, then check factors and only include missing ones
                if a_temp/(n(j)) == floor(a_temp/n(j))
                    a_temp=a_temp/n(j);
                else
                    a_temp=a_temp*n(j);
                    a_mult=a_mult*n(j);
                end
                j=j+1;
            end
            a=a*a_mult;
        end
    end
    i=i+1;
end
