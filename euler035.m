% Circular primes 
% Problem 35 
% The number, 197, is called a circular prime
% because all rotations of the digits: 197, 971, and 719, are themselves
% prime.
% 
% There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37,
% 71, 73, 79, and 97.
% 
% How many circular primes are there below one million?

clear all
clc
CIR=[];
p=primes(10^6);
%start with the first prime > 100, since we already know for less than 100.
i=26;
while i<=length(p)
    %convert to string
    a=num2str(p(i));
    b=length(a);
    cir=0;
    %eliminate all values that will result in non-prime such as evens,
    %zeros and fives.
    if sum(a=='0')==0 && sum(a=='2')==0 && sum(a=='4')==0 && sum(a=='5')==0 && sum(a=='6')==0 && sum(a=='8')==0
        k=1;
        while k<=b
            %rotate string by one digit
            c=[''];
            if b>2
                for j=1:b-1
                    c(j+1)=a(j);
                end
                c(1)=a(b);
            end
            d=str2double(c);
            %check if prime
            if isprime(d)
                %if prime then increment and check the next rotation
                cir=1;
                a=c;
                k=k+1;
            else
                %if not prime then jump to next value
                cir=0;
                k=b+1;
            end
        end
        %if after all rotations, the value is still prime, then save to
        %vector
        if cir==1
            CIR=[CIR;p(i)];
        end
    end
    i=i+1;
end

%don't forget to add the primes below 100 that we didn't check again.
disp(['Number of circular primes = ' num2str(length(CIR)+13)])