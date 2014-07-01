%Project Euler #1
%If we list all the natural numbers below 10 that are multiples of 3 or 5, 
%we get 3, 5, 6 and 9. The sum of these multiples is 23.
%Find the sum of all the multiples of 3 or 5 below 1000.

n=1000;
i3=n/3;
i5=n/5;
i35=n/15;
sum3=0;
sum5=0;
sum35=0;
i=1;
while i<i3
    sum3=sum3+i*3;
    i=i+1;
end

i=1;
while i<i5
    sum5=sum5+i*5;
    i=i+1;
end

i=1;
while i<i35
    sum35=sum35+i*15;
    i=i+1;
end

sum=sum3+sum5-sum35