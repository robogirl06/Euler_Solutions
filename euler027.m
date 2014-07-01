% Project Euler #27
% Euler discovered the remarkable quadratic formula:
%
% n^2 + n + 41
%
% It turns out that the formula will produce 40 primes for the consecutive 
% values n = 0 to 39. However, when n = 40, 402 + 40 + 41 = 40(40 + 1) + 41
% is divisible by 41, and certainly when n = 41, 41² + 41 + 41 is clearly 
% divisible by 41.
% 
% The incredible formula  n^2 ? 79n + 1601 was discovered, which produces 
% 80 primes for the consecutive values n = 0 to 79. The product of the 
% coefficients, ?79 and 1601, is ?126479.
% 
% Considering quadratics of the form:
% 
% n² + an + b, where |a| < 1000 and |b| < 1000
% 
% where |n| is the modulus/absolute value of n
% e.g. |11| = 11 and |?4| = 4
% Find the product of the coefficients, a and b, for the quadratic 
% expression that produces the maximum number of primes for consecutive 
% values of n, starting with n = 0.

clear all
clc

% First, b must be a postitive prime number since when n==0, the result
% must be a prime number.  This will limit the search.  a can be any
% integer between -999 and 999.  n must be an integer from 0...total count.

% Build vector of positive primes that are < 1000
p=primes(1000);
m=length(p);
total_count=0;
for i=[1:m];
    % This will increment the value of b along the prime vector
    b=p(i);
    for j=[-999:999]
        % This will increment a
        a=j;
        n=0;
        count=0;
        % This will increment n
        while  n > -1
            if n^2 + a*n + b > 0 % Check if result of formula > 0
                if isprime(n^2 + a*n + b) == 1 % Check if prime
                    count = count + 1; 
                    n=n+1;
                    % If prime increment count and check next value
                else
                    n=-1; % If not prime end evaluation
                end
            else
                n=n+1; % If not positive, increment count
            end
            if count > total_count
                % If new count is greater than maximum, save value.
                quad=[a b count];
                total_count=count;
            end
        end
    end
end

disp(['Coeficients are: ', num2str(quad(1)), ' & ', num2str(quad(2))])
disp(['Their product is: ',num2str(quad(1)*quad(2))])

