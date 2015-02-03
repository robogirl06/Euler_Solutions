% Project Euler #48
% The series, 11 + 22 + 33 + ... + 1010 = 10405071317.

% Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.

clear all
clc
format('longe')
vec=[];
for i=[1:1000]
    if floor(i/10)~= i/10
        x=1;
        for j=[1:i]
            x=x*i;
            y=num2str(x);
            % Only need the bottom nine digits for sum
            if length(y) > 9
                x=str2num(y((length(y)-9):length(y)));
            end
        end
        vec=[vec;x];
    end
end

total=sum(vec);
totalstr=num2str(total)

% This solution is optimal in terms of lines of code. Very small, however
% it takes more than 30 seconds to run. I'm not sure if that is fixable.
