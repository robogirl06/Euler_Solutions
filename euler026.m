% Project Euler #26
% A unit fraction contains 1 in the numerator. The decimal representation 
% of the unit fractions with denominators 2 to 10 are given:
% 
% 1/2	= 	0.5
% 1/3	= 	0.(3)
% 1/4	= 	0.25
% 1/5	= 	0.2
% 1/6	= 	0.1(6)
% 1/7	= 	0.(142857)
% 1/8	= 	0.125
% 1/9	= 	0.(1)
% 1/10	= 	0.1
% Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It 
% can be seen that 1/7 has a 6-digit recurring cycle.
% 
% Find the value of d < 1000 for which 1/d contains the longest recurring 
% cycle in its decimal fraction part.

clear all
clc
format long
L=[];
count=0;

% First remove all even numbers, and those that are divisble by 1000
for i=7:999
    if i/2==floor(i/2) || rem(1000,i)==0
        l=0;
    else
        l=1;
    end
    if l==1
        L=[L;i];
    end
end
M=0;
for j=[1:length(L)]
    if L(j)<10
        n=10;
    else if L(j)<100
            n=100;
        else
            n=1000;
        end
    end
    %basically we are doing long division.  As long as the value of the
    %remainder ~= n/10, then the number is not repeating.  When the remainder
    %== n/10, then the process is starting over from the beginning.  This
    %works for all but a small number of cases.  We'll deal with those in a
    %moment.
    
    k(1)=floor(n/L(j));     %k is the value at the 1st non-zero decimal place
    remk(1)=rem(n,L(j));    %remk is the remainder after the first non zero decimal
    m=1;
    p=1;
    while p>0
        %see if the remainder is 1, 10, 100 because that would mean that
        %the decimal is about to repeat.
        if remk(m)~=n/10
            k(m+1)=floor(10*remk(m)/L(j));  %if not, continue to divide
            remk(m+1)=rem(10*remk(m),L(j)); %continue to find the remainder
            m=m+1;                          %increment the index
        end
        %make sure the remainder itself is not repeating
        if remk(m)==n/10  || remk(m)==remk(m-1)
            p=0;
            if m>M
                M(1)=m;
                M(2)=L(j);
                K=k;
                REMK=remk;
            end
        end
        %this last case checks for repeating remainders, which will be the
        %same result as repeating decimals.
        if m > 3 && remk(m)==remk(2) && remk(m-1)==remk(1)
            p=0;
            if m>M
                M(1)=m;
                M(2)=L(j);
                K=k;
                REMK=remk;
            end
        end
    end
end

disp(['The number with the longest recurring decimal is 1/', num2str(M(1,2))])
