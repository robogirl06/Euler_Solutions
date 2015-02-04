% Project Euler #52

% It can be seen that the number, 125874, and its double, 251748, contain 
% exactly the same digits, but in a different order.

% Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, 
% contain the same digits.

clear all
clc
res=[];
d=0;
j=1;
while isempty(res)==1;  %while solution still not found
    VEC=[];
    k=10^j; % Order of magnitude. Increment every round.
    while k<floor((10^(j+1))/6)
        % Since same number of digits, divide order of magnitude by 6. This
        % value is the maximum for that order of magnitude that will be
        % possible to satisfy the criteria. Use this value to bound the
        % upper calculation and determine when to move to the next order.
        
        VEC=[k,2*k,3*k,4*k,5*k,6*k]; % Generate vector of multiples
        x1=sort(num2str(VEC(1)));
        x2=sort(num2str(VEC(2)));
        % Check for equality
        if x1==x2
            x3=sort(num2str(VEC(3)));
            if x2==x3
                x4=sort(num2str(VEC(4)));
                if x3==x4
                    x5=sort(num2str(VEC(5)));
                    if x4==x5
                        x6=sort(num2str(VEC(6)));
                        if x5==x6
                            % If all 6 are equal, then write to answer and
                            % kick out of loop.
                            res=VEC(1)
                            k=floor((10^(j+1))/6);
                        end
                    end
                end
            end
        end
        if k<floor((10^(j+1))/6) 
            % test if still in loop or same order of magnitude. If so then
            % increase k.
            k=k+1;
        end
    end
    % Increase order of magnitude.
    j=j+1;
end 
