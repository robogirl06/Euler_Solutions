% Project Euler #30
% Surprisingly there are only three numbers that can be written as the 
% sum of fourth powers of their digits:

% 1634 = 1^4 + 6^4 + 3^4 + 4^4
% 8208 = 8^4 + 2^4 + 0^4 + 8^4
% 9474 = 9^4 + 4^4 + 7^4 + 4^4
% As 1 = 1^4 is not a sum it is not included.
% 
% The sum of these numbers is 1634 + 8208 + 9474 = 19316.
% 
% Find the sum of all the numbers that can be written as the sum of 
% fifth powers of their digits.

clear all
clc

% Initialize Variables
sum_5=[];
i=2;
i_str='2';
while i<6*9^5 
    % Upper bound is determined by finding when the number will exceed
    % 9^5 * string length.  This happens when the string is longer than 6.
    % No sum of factors to the 5th power will be able to equal that value.
    i_str=num2str(i);
    for j=[1:length(i_str)]
        % Convert number to string
        a(j)=str2double(i_str(j));
    end
    % Skip impossible values. Ie. If the value contains a nine and it is
    % smaller than 9^5 than it is impossible. Do this for all smaller
    % numbers.  This will improve speed at the low end.
    if any(i_str == '9') && i < 9^5
    elseif any(i_str == '8') && i < 8^5
    elseif any(i_str == '7') && i < 7^5
    elseif any(i_str == '6') && i < 6^5
    elseif any(i_str == '5') && i < 5^5
    elseif any(i_str == '4') && i < 4^5
    elseif any(i_str == '3') && i < 3^5
    elseif any(i_str == '2') && i < 2^5
    elseif sum(a.^5) == i
        % If the sum of the digits to the 5th power is equal to the number,
        % then store in vector.
        sum_5=[sum_5;i];
    end
    i=i+1;
end

disp(['The sum equals: ', num2str(sum(sum_5))]);