%Project Euler #3
%The prime factors of 13195 are 5, 7, 13 and 29.
%What is the largest prime factor of the number 600851475143?
clear all
clc
%initialize variables
n_org=600851475143;
n=n_org;
prime=[];
a=2;
%remove all occurances of even numbers (not needed for this problem
%but if this is reused for prime factorization, we need to account for 
%multiples of 2)
while a == 2
    if n/a == floor(n/a)
        prime=[prime, a];
        n=n/a;
    else
        a=3;
    end    
end

%look at primes greater than 2
while a < n/a          
    if isprime(a)==1            %check if a is a prime number
        if n/a == floor(n/a)    %check if a is an integer multiple of n
            prime=[prime, a];   %build vector of prime factors
            n=n/a;              %reduce n for faster calculations
            if n<2^32 
                if isprime(n)==0;   %check if reduced n is a prime
                    a=max(prime)-2; % if not start next iteration at the maximum prime
                else
                    a=n;            %if reduced n is prime, then end check
                end
            end
        end
    end
    a=a+2; %increment a to next odd number
end

prime=[prime, n];
disp(['Prime factors of ', num2str(n_org), ' are [', num2str(prime), ']'])