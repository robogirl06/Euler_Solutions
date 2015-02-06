% Project Euler #32
% We shall say that an n-digit number is pandigital if it makes use of all
% the digits 1 to n exactly once; for example, the 5-digit number, 15234, 
% is 1 through 5 pandigital.
% 
% The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing
% multiplicand, multiplier, and product is 1 through 9 pandigital.
% 
% Find the sum of all products whose multiplicand/multiplier/product 
% identity can be written as a 1 through 9 pandigital.
% 
% HINT: Some products can be obtained in more than one way so be sure to 
% only include it once in your sum.

clear all
clc

% The largest mulitplicand is going to be 9876/2 = 4986
VEC=[];
for i=[1:4938]
    x=num2str(i);
    if length(x) == length(unique(x))
        % Remove all values that are not unique digits
        if any(x=='0')==0 
            % Remove all values that contain a 0
            if x(length(x))~='5'
                % Remove all values that end in 5
                if x(length(x))~='1'
                    % Remove all values that end in 1
                    VEC=[VEC;i];
                    % VEC is the total number of mulitplicands that need
                    % to be tested.
                end
            end
        end
    end
end

FINAL=[];
i=1;
while i<=length(VEC)
    j=i+1;
    while j<=length(VEC)
        x1=num2str(VEC(i)); % Multiplicand
        x2=num2str(VEC(j)); % Mulitple
        x3=num2str(VEC(i)*VEC(j)); % Product
        x=[x1,x2,x3]; % String with all 3
        if length(x) == 9 % Is it exactly length 9?
            if length(x) == length(unique(x)) % Is it pandigital?
                if any(x=='0')==0 % Does it contain zeros?
                    FINAL=[FINAL;str2double(x1),str2double(x2),str2double(x3)];
                end
            end
        end
        if length(x)>9
            % If length is greater than nine, then time to kick out of 
            % loop and increment i since length of all remaining values
            % will also be greater than 9
            j=length(VEC)+1; 
        else
            j=j+1;
        end
    end
    i=i+1;
end

% Remove duplicates
FIN=sum(unique(FINAL(:,3)));
num2str(FIN)
