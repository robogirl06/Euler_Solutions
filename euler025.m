%Project Euler #25
% The Fibonacci sequence is defined by the recurrence relation:
% 
% Fn = Fn?1 + Fn?2, where F1 = 1 and F2 = 1.
% Hence the first 12 terms will be:
% 
% F1 = 1
% F2 = 1
% F3 = 2
% F4 = 3
% F5 = 5
% F6 = 8
% F7 = 13
% F8 = 21
% F9 = 34
% F10 = 55
% F11 = 89
% F12 = 144
% The 12th term, F12, is the first term to contain three digits.
% 
% What is the first term in the Fibonacci sequence to contain 1000 digits?

clear all
clc
format long

%Initial Values for Fibonacci sequence
n0=[1;zeros(111,1)];    %1st term
n1=n0;                  %2nd term
n2=[zeros(111,1)];      %3rd term
i=2;
while n1(112)<1         %while total digits is < 1000
    n2(1)=n0(1)+n1(1);  %3rd term is the sum of the 1st and 2nd
    for j=[1:111]
        if n2(j) > 999999999
             %carry one to the next storage in the array
             n2(j+1)=n0(j+1)+n1(j+1)+1;
             %save only the last 9 digits
             n_str=num2str(n2(j));       
             n2(j)=str2double(n_str(2:10));
        else
             %otherwise just calculate the next value in the array
             n2(j+1)=n0(j+1)+n1(j+1); 
        end
    end
    n0=n1;  %cycle terms so that 2nd becomes 1st
    n1=n2;  %3rd becomes 2nd
    i=i+1;  %increment index
end

disp(['Index of 1st Fibonacci number with > 1000 digits is: ', num2str(i)])