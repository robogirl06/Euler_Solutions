% Project Euler #23
% A perfect number is a number for which the sum of its proper divisors is 
% exactly equal to the number. For example, the sum of the proper divisors
% of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect
% number.
% 
% A number n is called deficient if the sum of its proper divisors is less
% than n and it is called abundant if this sum exceeds n.
% 
% As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the 
% smallest number that can be written as the sum of two abundant numbers 
% is 24. By mathematical analysis, it can be shown that all integers 
% greater than 28123 can be written as the sum of two abundant numbers. 
% However, this upper limit cannot be reduced any further by analysis even 
% though it is known that the greatest number that cannot be expressed as 
% the sum of two abundant numbers is less than this limit.
% 
% Find the sum of all the positive integers which cannot be written as the 
% sum of two abundant numbers.

clear all
clc

% First determine all of the abundant numbers below 28123-12 (largest value
% minus the smallest abundant number.
vec_abu=[];
for i=[1:(28123-12)]
    if (sum(full_factor(i))-i)>i
        % if the sum of the full factor is greater than the value then
        % include the value in the abundant vector
        vec_abu=[vec_abu;i];
    end
end

% Since we know that values 1-23 are definitely not the sum of two abundant
% numbers, start the vector with those values.
vec_abd_2sum=[1:23]';
for i=[25:28123]
    % Only need to check from the smallest number to the first number
    % greater than i-12 (first abundant number)
    n=find(vec_abu(:)>=(i-12),1,'first');
    j=1;
    while j <= n
       cand=i-vec_abu(j); % take the value and subtract an abundant number
       if any(vec_abu(:)==cand) 
           % if the remainder is abundant then skip to the end.
           j=length(vec_abu)+1;
       else
           % Otherwise test the next value
           j=j+1;
       end
       if j==n
           % If after testing all values, assume that the number cannot be
           % represented as the sum of two abundant numbers.
           vec_abd_2sum=[vec_abd_2sum;i];
           j=length(vec_abu)+1;
       end
    end
end

disp(['The sum of all the positive integers which cannot be written'])
disp(['as the sum of two abundant numbers is: ',num2str(sum(vec_abd_2sum))])

            
            
        
    