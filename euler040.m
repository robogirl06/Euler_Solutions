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
% for i=[100:999] the length is equal to 900*3=2700, total length 2889
% for i=[1000:9999] the length is equal to 9000*4=36000, total 38889
% for i=[10000:99999] the length is 90000*5=450000, total 488889
% for i=[100000:999999] the length is 900000*6=5400000, total 5888889


% Find d(1), d(10) and d(100)
D=[];
for i=[1:99]
    D=[D,num2str(i)];
end
d1=str2double(D(1));
d10=str2double(D(10));
d100=str2double(D(100));

% Find d(1000)
D=[];
i=100;
while length(D) <= (1000-189)
    % Since we are only going to the value needed don't generate entire string
    D=[D,num2str(i)];
    i=i+1;
end
d1000=str2double(D(1000-189));

D=[];
i=1000;
while length(D) <= (10000-2889)
    D=[D,num2str(i)];
    i=i+1;
end
d10000=str2double(D(10000-2889));

D=[];
i=10000;
while length(D) <= (100000-38889)
    D=[D,num2str(i)];
    i=i+1;
end
d100000=str2double(D(100000-38889));

D=[];
i=100000;
while length(D) <= (1000000-488889)
    D=[D,num2str(i)];
    i=i+1;
end
d1000000=str2double(D(1000000-488889));

final=d1 * d10 * d100 * d1000 * d10000 * d100000 * d1000000
