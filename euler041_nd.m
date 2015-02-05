% Project Euler #41
% We shall say that an n-digit number is pandigital if it makes use of all 
% the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital 
% and is also prime.

% What is the largest n-digit pandigital prime that exists?

clear all
clc
format('longe')

% Starting at largest possibility. Generate 7 digit pandigital vector.
p=['7654321'];
P=perms(p);
VEC=[];
% Only purpose of this loop is to remove the obvious 'not prime' values
% such as even numbers and those ending in 5. It will reduce the test
% vector to less than 1/2.
for i=[1:length(P(:,1))]
    x=str2double(P(i,7));
    if x~=5
        if x/2 ~= floor(x/2)
            VEC=[VEC;P(i,:)];
        end
    end
end

% Test each value for prime. I suppose I could combine the above and below.
i=length(VEC(:,1));
vec=[];
while i>0
    x=str2double(VEC(i,:));
    if isprime(x)==1;
        vec=[vec;x];
    end
    i=i-1;
end

final=num2str(max(vec))

% So originally I tested 9 pandigital and there were no primes and it took 
% several minutes to run. Then I tested 8 pandigital and there were no
% primes but it ran in under a min. When I reduced to 7, it ran in under a 
% second. The problem is how to solve for 9 from the beginning and not have
% it be so slow. Might have to revisit this one after looking at solutions.
