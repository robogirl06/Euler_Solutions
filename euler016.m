%Project Euler #16
%2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
%What is the sum of the digits of the number 2^1000?

clear all
clc
format long
n=[1;zeros(34,1)];
for i=[1:1000]
 n(1)=n(1)+n(1);    %n+n =2*n
 for j=[1:34]
     %if n is going to exceed 9 digits
     if n(j) > 999999999
          %carry one to the next storage in the array
         n(j+1)=n(j+1)+n(j+1)+1;
         %save only the last 9 digits
         n_str=num2str(n(j));       
         n(j)=str2double(n_str(2:10));
     else
         %otherwise just calculate the next value in the array
         n(j+1)=n(j+1)+n(j+1); 
     end
 end
end

for i=[1:34]
    %array will contain all the digits of the value
    n_str=num2str(n(i)); 
    n_add=[];
    for j=[1:length(n_str)]
        %convert digits into individual numbers
        n_add=[n_add,str2double(n_str(j))]; 
    end
    %sum each group of 9 digits into a vector
    n_sum(i)=sum(n_add); 
end

total=sum(n_sum) %sum the whole vector