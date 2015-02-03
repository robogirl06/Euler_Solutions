% Project Euler #40
% An irrational decimal fraction is created by concatenating the positive
% integers:
% 
% 0.123456789101112131415161718192021...
% 
% It can be seen that the 12th digit of the fractional part is 1.
% 
% If dn represents the nth digit of the fractional part, find the value of
% the following expression.
% 
% d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000

clear all
clc

% Create string vector containing digits....
% Consider this a length problem....
% if each integer is i=[1:m], then the following will be true
% for i=[1:9] the length is equal to 9
% for i=[10:99] the length is equal to 90*2=180, total length 189
% for i=[100:999] the length is equal to 900*3=1800, total length 1989
% for i=[1000:9999] the length is equal to 9000*4=18000, total 19989
% for i=[10000:99999] the length is 90000*5=180000, total 199989
% for i=[100000:999999] the length is 900000*6=1800000, total 1999989

d1=1;
d10=1;

% Find d(100)
D=[];
for i=[10:70]
    D=[D,num2str(i)];
end

d100=str2double(D(100-9));

D=[];
for i=[100:700]
    D=[D,num2str(i)];
end
d1000=str2double(D(1000-189));

D=[];
for i=[1000:7000]
    D=[D,num2str(i)];
end
d10000=str2double(D(10000-1989));
