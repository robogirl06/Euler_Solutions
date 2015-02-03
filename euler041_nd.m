% Project Euler #41
% We shall say that an n-digit number is pandigital if it makes use of all 
% the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital 
% and is also prime.

% What is the largest n-digit pandigital prime that exists?

clear all
clc
format('longe')
vec=[];
% Start with the largest 9 digit pan digital 9876543210.
i=9876543201;
z=1; %toggle to kick out if not pandigital
while isempty(vec)
    z=1;
    x=factor(i);
    if length(x)>1
        z=0;
    end
    x=num2str(i);
    for j=[1:length(x)]
        if sum((x(j)== x))>1
            z=0;
        end
    end
    if z==1 % if pass all checks, then save value
        vec=x
    end
    i=i-2; % subtract 2 to avoid testing even numbers
end

% this kicks out the largest 9 digit pandigital prime. However, the problem
% states n digit... which means n might not equal 9. So I need to think
% about it some more...
