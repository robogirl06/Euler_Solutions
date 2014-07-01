% Project Euler #31
% In England the currency is made up of pound, £, and pence, p, and there 
% are eight coins in general circulation:
% 
% 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
% It is possible to make £2 in the following way:
% 
% 1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
% How many different ways can £2 be made using any number of coins?

clear all
clc

% p is a vector containing all the values of the coins
p=[200 100 50 20 10 5 2 1];
% n is the vector combination of the coins
n=[0 0 0 0 0 0 0 0];
count=0;

while n(1) < 2
    % increment the coins each time through
    % determine the maximum number of 1p coins given the number of larger
    % coins
    if n(8)<(200-p(1:7)*n(1:7)')
        n(8)=n(8)+1;
    else
        n(8)=0;
        %determine the number of 2p coins available given the number of
        %larger coins.  Repeat for each larger coin.
        if n(7)<(100-(p(1:6)*n(1:6)')/2)
            n(7)=n(7)+1;
        else
            n(7)=0;
            if n(6)<(50-(p(1:5)*n(1:5)')/5)
                n(6)=n(6)+1;
            else
                n(6)=0;
                if n(5)<(20-(p(1:4)*n(1:4)')/10)
                    n(5)=n(5)+1;
                else
                    n(5)=0;
                    if n(4)<(10-(p(1:3)*n(1:3)')/20)
                        n(4)=n(4)+1;
                    else
                        n(4)=0;
                        if n(3)<(4-(p(1:2)*n(1:2)')/50)
                            n(3)=n(3)+1;
                        else
                            n(3)=0;
                            if n(2)<(2-p(1)*n(1)/100)
                                n(2)=n(2)+1;
                            else
                                n(2)=0;
                                n(1)=n(1)+1;
                            end
                        end
                    end
                end
            end
        end
    end 
    %If the value of the coins == 200, count and save.
    if p*n'== 200
        % count n
        count=count+1;
    end   
end

% The final value of count is the answer.

