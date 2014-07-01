% Project Euler #34

% 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
% 
% Find the sum of all numbers which are equal to the sum of the factorial
% of their digits.
% 
% Note: as 1! = 1 and 2! = 2 are not sums they are not included.

clear all
clc
count=0;
VEC=[];
MAG =[10^4 10^3 100 10 1]';

% Need to figure out bounds.  I just started with a bound of 5 digits, but
% really, I had no logic for that.  Maybe check the thread?

% First increment the digits using for loops.
for a=[0:9]
    for b=[0:9]
        for c=[0:9]
            for d=[0:9]
                for e=[0:9]
                    TEST=[a b c d e];
                    % Find the index of the first non-zero term to remove
                    % leading zeros.
                    ind=min(find(TEST));
                    % Check if the value is equal to the sum of the
                    % factorial of it's digits.
                    if TEST*MAG == factorial(TEST(ind:5))*ones(6-ind,1)
                        count = count+1;
                        VEC=[VEC; TEST*MAG];
                    end
                end
            end
        end
    end
end

% Calculate the sum
SUM=0;
for i=[1:length(VEC)]
    if VEC(i)>2
        SUM=SUM+VEC(i);
    end
end