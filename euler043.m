% Project Euler #43

% The number, 1406357289, is a 0 to 9 pandigital number because it is made 
% up of each of the digits 0 to 9 in some order, but it also has a rather 
% interesting sub-string divisibility property.

% Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, 
% we note the following:

% d2d3d4=406 is divisible by 2
% d3d4d5=063 is divisible by 3
% d4d5d6=635 is divisible by 5
% d5d6d7=357 is divisible by 7
% d6d7d8=572 is divisible by 11
% d7d8d9=728 is divisible by 13
% d8d9d10=289 is divisible by 17
% Find the sum of all 0 to 9 pandigital numbers with this property.

clear all
clc
format('longe')
% 17 is the most restricted parameter. Determine all 3 digit numbers that 
% are multiples of 17 and pandigital.
VEC17=[];
for i=[1:floor(999/17)]
    x=num2str(i*17);
    if length(unique(x))==length(x)
        if i*17<100
            VEC17=[VEC17;'0',x];            
        else
            VEC17=[VEC17;x];
        end
    end
end

% Now do the same thing for 13.
VEC13=[];
for i=[1:floor(999/13)]
    x=num2str(i*13);
    if length(unique(x))==length(x)
        if i*13<100
            VEC13=[VEC13;'0',x];            
        else
            VEC13=[VEC13;x];
        end
    end
end

% Now determine where 17 and 13 overlap.
VEC4=[];
for i=[1:length(VEC13(:,1))]
    for j=[1:length(VEC17(:,1))]
        if VEC13(i,2:3) == VEC17(j,1:2)
            VEC4=[VEC4;VEC13(i,1),VEC17(j,:)];
        end
    end
end

% Now figure out 11
VEC11=[];
for i=[1:floor(999/11)]
    x=num2str(i*11);
    if length(unique(x))==length(x)
        if i*11<100
            VEC11=[VEC11;'0',x];            
        else
            VEC11=[VEC11;x];
        end
    end
end

% Now determine overlap with VEC4
VEC5=[];
for i=[1:length(VEC11(:,1))]
    for j=[1:length(VEC4(:,1))]
        if VEC11(i,2:3) == VEC4(j,1:2)
            VEC5=[VEC5;VEC11(i,1),VEC4(j,:)];
        end
    end
end

% Now figure out 7
VEC07=[];
for i=[1:floor(999/7)]
    x=num2str(i*7);
    if length(unique(x))==length(x)
        if i*7<10
            VEC07=[VEC07;'00',x];
        else if i*7<100
                VEC07=[VEC07;'0',x];
        else
            VEC07=[VEC07;x];
            end
        end
    end
end

% Now determine overlap with VEC5
VEC6=[];
for i=[1:length(VEC07(:,1))]
    for j=[1:length(VEC5(:,1))]
        if VEC07(i,2:3) == VEC5(j,1:2)
                VEC6=[VEC6;VEC07(i,1),VEC5(j,:)];
        end
    end
end

% Now do 5
VEC05=[];
for i=[1:floor(999/5)]
    x=num2str(i*5);
    if length(unique(x))==length(x)
        if i*5<10
            VEC05=[VEC05;'00',x];
        else if i*5<100
                VEC05=[VEC05;'0',x];
        else
            VEC05=[VEC05;x];
            end
        end
    end
end

% Now determine overlap with VEC6
VEC7=[];
for i=[1:length(VEC05(:,1))]
    for j=[1:length(VEC6(:,1))]
        if VEC05(i,2:3) == VEC6(j,1:2)
                VEC7=[VEC7;VEC05(i,1),VEC6(j,:)];
        end
    end
end

% Now do 3
VEC03=[];
for i=[1:floor(999/3)]
    x=num2str(i*3);
    if length(unique(x))==length(x)
        if i*3<10
            VEC03=[VEC03;'00',x];
        else if i*3<100
                VEC03=[VEC03;'0',x];
        else
            VEC03=[VEC03;x];
            end
        end
    end
end

% Now determine overlap with VEC7
VEC8=[];
for i=[1:length(VEC03(:,1))]
    for j=[1:length(VEC7(:,1))]
        if VEC03(i,2:3) == VEC7(j,1:2)
                VEC8=[VEC8;VEC03(i,1),VEC7(j,:)];
        end
    end
end

% And lastly, we do 2
VEC02=[];
for i=[1:floor(999/2)]
    x=num2str(i*2);
    if length(unique(x))==length(x)
        if i*2<10
            VEC02=[VEC02;'00',x];
        else if i*2<100
                VEC02=[VEC02;'0',x];
        else
            VEC02=[VEC02;x];
            end
        end
    end
end

% Now determine overlap with VEC8
VEC9=[];
for i=[1:length(VEC02(:,1))]
    for j=[1:length(VEC8(:,1))]
        if VEC02(i,2:3) == VEC8(j,1:2)
                VEC9=[VEC9;VEC02(i,1),VEC8(j,:)];
        end
    end
end

% Now eliminate all values that are not pandigital.
VEC=[];
for i=[1:length(VEC9(:,1))]
    if length(unique(VEC9(i,:)))==length(VEC9(i,:))
        VEC=[VEC;VEC9(i,:)];
    end
end

% Last cocantinate the missing value to the front of each number.
FINAL=[];
for i=[1:length(VEC(:,1))]
    if any(VEC(i,:)=='1')==0
        FINAL=[FINAL;'1',VEC(i,:)];
    end
    if any(VEC(i,:)=='2')==0
        FINAL=[FINAL;'2',VEC(i,:)];
    end
    if any(VEC(i,:)=='3')==0
        FINAL=[FINAL;'3',VEC(i,:)];
    end
    if any(VEC(i,:)=='4')==0
        FINAL=[FINAL;'4',VEC(i,:)];
    end
    if any(VEC(i,:)=='5')==0
        FINAL=[FINAL;'5',VEC(i,:)];
    end
    if any(VEC(i,:)=='6')==0
        FINAL=[FINAL;'6',VEC(i,:)];
    end
    if any(VEC(i,:)=='7')==0
        FINAL=[FINAL;'7',VEC(i,:)];
    end
    if any(VEC(i,:)=='8')==0
        FINAL=[FINAL;'8',VEC(i,:)];
    end
    if any(VEC(i,:)=='9')==0
        FINAL=[FINAL;'9',VEC(i,:)];
    end
    if any(VEC(i,:)=='0')==0
        FINAL=[FINAL;'0',VEC(i,:)];
    end
end

% Display all pandigital numbers that meet criteria.
FINAL

% Find sum of values.
for i=[1:length(FINAL(:,1))]
    FINALSUM(i)=str2double(FINAL(i,:));
end

% Display Sum
FSUM=num2str(sum(FINALSUM))

% The code is repetitive. I'm sure that I could write a function to
% simplify it. Don't know if I'll bother.
