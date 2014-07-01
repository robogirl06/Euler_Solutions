%Project Euler #4
%A palindromic number reads the same both ways. The largest palindrome made 
%from the product of two 2-digit numbers is 9009 = 91 99.
%Find the largest palindrome made from the product of two 3-digit numbers.

clear all
clc

%initialize variables
a=9;
b=9;
c=9;
i=1;
vec=[10^5;10^4;10^3;10^2;10;1];
while i==1
x=[a b c c b a]*vec;
ub=floor(sqrt(x));  %upper bound of the search
lb=floor(x/1000);   %lower bound of the search
test=ub;            %starting point is upper bound
while test>lb
    if x/test==floor(x/test)            %check if multiple of palindrome
        if x/test < 1000 && test<1000   %Are both less than 3 digits?
            xfact=[x, test, x/test];    %if so, then finish
            i=0;
            test=lb;
        end
    %if both multiples are not less than 1000, skip to next palindrome
    else
        test=test-1;    %test next number
    end
end
%build next palindrome down
n=[num2str(a) num2str(b) num2str(c)];
n=num2str(str2num(n)-1);
a=str2num(n(1,1));

b=str2num(n(1,2));
c=str2num(n(1,3));
end

disp(['Palindrome is: ' num2str(xfact(1,1)) ' with factors [' num2str(xfact(1,2:3)) ']'])