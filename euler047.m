% Project Euler #47

% The first two consecutive numbers to have two distinct prime factors are:

% 14 = 2 × 7
% 15 = 3 × 5

% The first three consecutive numbers to have three distinct prime 
% factors are:

% 644 = 2² × 7 × 23
% 645 = 3 × 5 × 43
% 646 = 2 × 17 × 19.

% Find the first four consecutive integers to have four distinct prime 
% factors. What is the first of these numbers?

clear all
clc

i=1;        % Initial Index
z=0;        % Toggle to kick out of loop when solution found
count=0;    % Count of number of consecutive integers
vec=[];     % Vector to save integer values
while z==0  
    if isprime(i)==0    % Check if value is prime.
        if length(unique(factor(i)))==4 
            % If value has 4 factors, increment count and save value.
            count=count+1;
            vec=[vec;i];
        else
            % If value does not, reset count and empty vector
            count=0;
            vec=[];
        end
    else
        % If value is prime, reset count and empty vector
        count=0;
        vec=[];
    end
    if count == 4 %Once cont is 4, kick out of loop.
        z=1;
    end
    i=i+1;  % Increment i
end

final = num2str(vec(1)) % Display result
