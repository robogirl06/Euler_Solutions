% Project Euler #21
% Let d(n) be defined as the sum of proper divisors of n (numbers less 
% than n which divide evenly into n).
% If d(a) = b and d(b) = a, where a ? b, then a and b are an amicable 
% pair and each of a and b are called amicable numbers.
% 
% For example, the proper divisors of 220 are 
% 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. 
% The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
% 
% Evaluate the sum of all the amicable numbers under 10000

clear all
clc
ami=[];

for j=[2:10000]
    %use full_factor function ot solve for factors and find sum
    D1=sum(full_factor(j))-j;
    D2=sum(full_factor(D1))-D1;
    
    %if sums are equal, then save to abundant vector list
    if D2==j && D1~=D2
        ami=[ami; j,D1];
    end
end

%find sum of all abundant numbers
ami_sum=sum(ami(:,1))