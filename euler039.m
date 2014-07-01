% Project Euler #39
% If p is the perimeter of a right angle triangle with integral length 
% sides, {a,b,c}, there are exactly three solutions for p = 120.
%
% {20,48,52}, {24,45,51}, {30,40,50}
%
% For which value of p <= 1000, is the number of solutions maximised?

clear all
clc

count_max=0;
for n=[0:1000];      %sum of a b c
    i=-n;       %starting value of search
    max=n;      %ending value of search
    count=0;
    abc=[];
    while i<max;
        c=i;    %test value of c

        %here is where it gets complicated.  On paper, create a polynomial
        %based on the values where c is fixed, and a is solved for b by using
        %a=1000-b-c and a^2=c^2-b^2.  The resultant polynomial is as follows:
        %(2*a^2 - 2(n-c)*a + 2*n*(n-c)-n^2)==0

        p=[2 (-2*(n-c)) (2*n*(n-c)-n^2)];

        %solve for the roots of the polynomial

        a=roots(p);
        A=round(a);
        if imag(a)==0           %if roots are real(no complex part)
            if abs(a - A)<10^-10   %if both roots are integers
                if a(1) > 0 && a(2) > 0
                    abc=[abc;A(2) A(1) c];  %system is solved and ouput vector created
                    count=count+1;  %increment count
                end
            end
        end
        i=i+1;  %increment loop
    end
    if count > count_max
    final=[abc]
    count_max=count
    end
end