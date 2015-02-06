% Project Euler #38
% Take the number 192 and multiply it by each of 1, 2, and 3:

% 192 × 1 = 192
% 192 × 2 = 384
% 192 × 3 = 576
% By concatenating each product we get the 1 to 9 pandigital, 192384576. 
% We will call 192384576 the concatenated product of 192 and (1,2,3)
% 
% The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 
% 4, and 5, giving the pandigital, 918273645, which is the concatenated 
% product of 9 and (1,2,3,4,5).
% 
% What is the largest 1 to 9 pandigital 9-digit number that can be formed 
% as the concatenated product of an integer with (1,2, ... , n) where 
% n > 1?

clear all
clc

% Using the idea from #32, that the largest mulitplicand is 9876 in order
% for any value to have n>1. (assuming 4 digit multiplicand and 5 digit
% product)

VEC=[];
for i=[1:9876]
    x=num2str(i);
    if length(x) == length(unique(x))
        % Remove all values that are not unique digits
        if any(x=='0')==0
            % Remove all values that contain a 0
            if x(length(x))~='5'
                % Remove all values that end in 5
                if x(length(x))~='1'
                    % Remove all values that end in 1
                    if x(1)=='9'
                        %Only test values with first digit as 9, since we
                        %already know that the value is equal to or greater
                        %than 918273645
                        VEC=[VEC;i];
                        % VEC is the total number of mulitplicands that need
                        % to be tested.
                    end
                end
            end
        end
    end
end

FINAL=[];
for i=[1:length(VEC)]
    j=2;
    x=num2str(VEC(i)); % Build value starting with x*1
    while j<6
        x=[x,num2str(j*VEC(i))]; % Cocantinate next integer mulitple
        if length(x) < 9
            % Is the length less than 9? If so, increment integer.
            j=j+1;
        else if length(x)==9
                % Is the length == 9?
                if length(x) == length(unique(x))
                    % Is it pandigital?
                    if any(x=='0')==0
                        % Is it free of zeros?
                        FINAL=[FINAL;x];
                        % If so, then save value and kick out of loop.
                        j=6;
                    end
                end
            else
                % If length > 9 kick out of loop.
                j=6;
            end
        end
    end
end

FIN=FINAL(length(FINAL(:,1)),:)
