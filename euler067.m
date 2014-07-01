% Project Euler #67
% By starting at the top of the triangle below and moving to adjacent 
% numbers on the row below, the maximum total from top to bottom is 23.
% 
%    3
%   7 4
%  2 4 6
% 8 5 9 3
% 
% That is, 3 + 7 + 4 + 9 = 23.
% 
% Find the maximum total from top to bottom in triangle.txt (right click
% and 'Save Link/Target As...'), a 15K text file containing a triangle with
% one-hundred rows.
% 
% NOTE: This is a much more difficult version of Problem 18. It is not
% possible to try every route to solve this problem, as there are 2^99
% altogether! If you could check one trillion (10^12) routes every second 
% it would take over twenty billion years to check them all. There is an
% efficient algorithm to solve it. ;o)

clear all
clc

% tri = [3 0 0 0;...
%     7 4 0 0;...
%     2 4 6 0;...
%     8 5 9 3];

% I C=created a mat file with the triangle saved as a vector and the tri
% variable as a matrix of zeros
load('euler067.mat')
m=1;
n=1;
i=1;

% First convert the vector back into a triangle matrix
while i<=length(triangle)
    for m=[1:100]
        for n=[1:m]
            tri(m,n)=triangle(i);
            i=i+1;
        end
    end
end

% Then code is identical to that in problem #18

m=length(tri(:,1)); % total number of rows
% Working from the bottom of the triangle up...
% Calculate the sum from the bottom most row and the next row up
for i=[1:m-1]
    sum(i)=[tri(m-1,i)+max(tri(m,i),tri(m,i+1))];
end

% Next calculate the sums as you go up the triangle.
j=m-2;

while j>0
    for i=[1:length(sum)-1]
        SUM(i)=(tri(j,i)+max(sum(i),sum(i+1)));
    end
    sum=SUM;
    SUM=[];
    j=j-1;
end







