%Project Euler #9
%A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
%a^2 + b^2 = c^2
%For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
%There exists exactly one Pythagorean triplet for which a + b + c = 1000.
%Find the product abc.

clear all
clc

n=1000;     %sum of a b c
i=-n;       %starting value of search
max=n;      %ending value of search

while i<max;
    c=i;    %test value of c
    
    %here is where it gets complicated.  On paper, create a polynomial
    %based on the values where c is fixed, and a is solved for b by using
    %a=1000-b-c and a^2=c^2-b^2.  The resultant polynomial is as follows:
    %(2*a^2 - 2(n-c)*a + 2*n*(n-c)-n^2)==0
    
    p=[2 (-2*(n-c)) (2*n*(n-c)-n^2)];
    
    %solve for the roots of the polynomial by finding the eigen values.  a and b
    %will be the eigen values.
    
    M=[-p(2)/p(1) -p(3)/p(1);1 0];  
    a=eig(M);
    if imag(a)==0           %if eigen values are real(no complex part)
        if a(1)==floor(a(1)) && a(2)==floor(a(2))   %if both eigen values are integers
            if a(1) > 0 && a(2) > 0
                abc=[a(2) a(1) c]  %system is solved and ouput vector created
                out=prod(abc)
                %i=max;      %exit loop
            end
        end
    end
    i=i+1;  %increment loop
end
 