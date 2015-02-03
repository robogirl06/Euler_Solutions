% Project Euler #37
% The number 3797 has an interesting property. Being prime itself, it is 
% possible to continuously remove digits from left to right, and remain 
% prime at each stage: 3797, 797, 97, and 7. Similarly we can work from 
% right to left: 3797, 379, 37, and 3.

% Find the sum of the only eleven primes that are both truncatable from 
% left to right and right to left.

% NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.

clear all
clc
vec=[];
% I didn't know that one is not a prime number! How silly of me.
% Start with 23 since that is the first truncatable prime.
i=23;

while length(vec)<11 %test if we've found all 11
    if isprime(i)==1
        z=1;        %toggle to kick out if any non-primes are found
        x=num2str(i);
        for j=[1:(length(x)-1)]
            if z==1
                y1=str2num(x(1:(length(x)-j))); %left
                y2=str2num(x((length(x)-j+1):length(x))); %right
                if isprime(y1)==1 && isprime(y2)==1 %both must be prime
                    z=1;
                else
                    z=0;
                end
            end
        end
        if z==1 % if after all iterations, still prime, then save value
            vec=[vec;i];
        end
    end
    i=i+2; % add two to avoid testing even numbers
end

final=sum(vec)

% This is still slow (~20 seconds).  Don't know if
% there is another test that can reduce the values being reviewed.
