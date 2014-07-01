% Project Euler #39
% The fraction 49/98 is a curious fraction, as an inexperienced
% mathematician in attempting to simplify it may incorrectly believe that
% 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.
% 
% We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
% 
% There are exactly four non-trivial examples of this type of fraction,
% less than one in value, and containing two digits in the numerator and
% denominator.
% 
% If the product of these four fractions is given in its lowest common
% terms, find the value of the denominator

clear all
clc
VEC=[];
count=0;
% There are only 4 possible instances with a two digit numerator and 2
% digit denominator:  ab/ac, ab/ca, ba/ca, ba/ac.  The other criteria is
% that the fraction must be less than 1.

% First possible instance is ab/ac

for a=[1:9]
    for b=[0:9]
        B = [a b]*[10;1];
        for c=[0:9]
            C = [a c]*[10;1];
            if B/C == b/c && B<C
                % Only count it if the digits cancel and the numerator is
                % larger than the denominator.  Also save the numerator and
                % denominator in a vector.
                count=count+1;
                VEC=[VEC;B C];
            end
        end
    end
end

% Second possible instance is ab/ca

for a=[1:9]
    for b=[0:9]
        B = [a b]*[10;1];
        for c=[0:9]
            C = [c a]*[10;1];
            if B/C == b/c && B<C
                count=count+1;
                VEC=[VEC;B C];
            end
        end
    end
end

% Third possible instance is ba/ca

for a=[1:9]
    for b=[0:9]
        B = [b a]*[10;1];
        for c=[0:9]
            C = [c a]*[10;1];
            if B/C == b/c && B<C
                count=count+1;
                VEC=[VEC;B C];
            end
        end
    end
end

% Fourth possible instance is ba/ac

for a=[1:9]
    for b=[0:9]
        B = [b a]*[10;1];
        for c=[0:9]
            C = [a c]*[10;1];
            if B/C == b/c && B<C
                count=count+1;
                VEC=[VEC;B C];
            end
        end
    end
end


PROD=1;
for i=[1:length(VEC(:,1))]
    % Determine the product of all the values found
    PROD=PROD*VEC(i,1)/VEC(i,2)
end