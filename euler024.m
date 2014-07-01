% Project Euler #24
% A permutation is an ordered arrangement of objects. For example, 3124 
% is one possible permutation of the digits 1, 2, 3 and 4. If all of the 
% permutations are listed numerically or alphabetically, we call it 
% lexicographic order. The lexicographic permutations of 0, 1 and 2 are:
%
% 012   021   102   120   201   210
%
% What is the millionth lexicographic permutation of the digits 
% 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?

clear all
clc

p=[0 1 2 3 4 5 6 7 8 9];    % vector of values for permutation
p_new=p;
l=length(p);    % length of vector containing values
M=perms(p);     % permutation
ind=1000000;    % what index are we looking for?
for i=[1:l-1]
    count(i)=factorial(l-i);    % count of each value by position
end

% So if we look at this as a length problem... there are 1/9 of the values
% that will start with 0, 1, 2, ...  So first take index/9 and that will
% tell us the first value.  Then the remainder of that division/8 will tell
% us the next value, etc...  You never have to actually calculate all the
% permutations this way.  Since each value can only be used once, then
% remove it from the choice vector.
b(1)=ind;
for i=(1:l-1)
    a(i)=ceil(b(i)/count(i));  % a is the index in the p vector for the value.
    if a(i)==0
        a(i)=length(p_new);  %if there is no remainder then it is the largest remaining value.
    end
    b(i+1)=rem(b(i),count(i)); % b is the remainder
    
    c(i)=p_new(a(i));   % c is the value of the digit at that index.
    
    vec=[];
    for j=(1:length(p_new))
        if p_new(j)~=c(i)
            vec=[vec,p_new(j)]; % remove value, since each can only occur once
        end
    end
    p_new=vec; %vector of remaining available values. 
end
c(l)=p_new(1); % last value is the last one remaining.

disp(['The ', num2str(ind), 'th lexigraphic permutation is:'])
disp(num2str(c))


