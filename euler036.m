% Project Euler #36
% The decimal number, 585 = 1001001001 (binary), is palindromic in both
% bases.
% 
% Find the sum of all numbers, less than one million, which are palindromic
% in base 10 and base 2.
% 
% (Please note that the palindromic number, in either base, may not include
% leading zeros.)

clear all
clc

% First we need to create the palendrome vector in base 10, then we need to
% convert it to base 2 and compare.

VEC=[];
a=0;
b=0;
c=1;
i=1;
% This method will create multiple versions of the same palendromic number
% but it will not miss any.  Consider finding a more efficient way to
% create all the values.

while [a b c]*[100 10 1]' < 999
    j=[a b c]*[100 10 1]';
    for a=[0:9]
        for b=[0:9]
            for c=[1:9]
                VEC=[VEC, c];
                VEC=[VEC, [c c]*[10 1]'];
                VEC=[VEC, [c b c]*[100 10 1]'];
                VEC=[VEC, [c b b c]*[1000 100 10 1]'];
                VEC=[VEC, [c b a b c]*[10^4 10^3 100 10 1]'];
                VEC=[VEC, [c b a a b c]*[10^5,10^4,10^3,100,10,1]'];
            end
        end
    end
end

% Our vector will not include the final values, because of the less than
% 999 criteria for the vector build.
VEC=[VEC 999 999999];
VEC=sort(VEC)';
vect=[];

% Remove all redundant values
for i=[i:length(VEC)-1]
    if VEC(i)~=(VEC(i+1))
        vect=[vect;VEC(i)];
    end
end
VEC=vect;

vect=[];
% Remove all even numbered values because they will end in zero
for i=[1:length(VEC)]
    if VEC(i)/2 ~= floor(VEC(i)/2)
        vect=[vect;VEC(i)];
    end
end
VEC=vect;

% Now convert to base 2 and determine if it is palendromic in base 2 as
% well.
pal=0;
PAL=[];
for i=[1:length(VEC)]
    binstr=dec2base(VEC(i),2);
    j=1;
    l=length(binstr);
    while j <= l/2
        if binstr(j)==binstr(l+1-j) % are the first and last values equal?
            j=j+1;  % if yes then increment to the next digit
            pal=1;  % still palendromic
        else
            j=l;    % if no then move on to next value
            pal=0;  % not palendromic
        end
    end
    if pal==1
        % If after checking all digits pal==1, then save value in PAL
        PAL=[PAL;VEC(i)];   
    end
end

% Sum all the palendromic values.  Add one, since one is also a palendromic
% value, but it doesn't show up in the PAL vector because its length in
% only 1.

sum(PAL)+1
