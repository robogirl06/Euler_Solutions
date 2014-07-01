%Project Euler #17
%If the numbers 1 to 5 are written out in words: one, two, three, four, 
%five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
%If all the numbers from 1 to 1000 (one thousand) inclusive were written 
%out in words, how many letters would be used?
%
%NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and 
%forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 
%20 letters. The use of "and" when writing out numbers is in compliance 
%with British usage.

clear all
clc
s1='one';
s2='two';...
s3='three';
s4='four';
s5='five';
s6='six';
s7='seven';
s8='eight';
s9='nine';
s10='ten';
s11='eleven';
s12='twelve';
s13='thirteen';
s14='fourteen';
s15='fifteen';
s16='sixteen';
s17='seventeen';
s18='eighteen';
s19='nineteen';
s20='twenty';
s30='thirty';
s40='forty';
s50='fifty';
s60='sixty';
s70='seventy';
s80='eighty';
s90='ninety';
shund='hundred';
s1000='thousand';
and='and';


n=21;
while n<100
    sd=num2str(n);
    if sd(1,2)~= '0'
        eval(['s',num2str(n),'=[s',sd(1,1),'0,s',sd(1,2),'];'])
    end
    n=n+1;
end

n=100;
while n<1000
    sd=num2str(n);
    if sd(1,3)== '0' && str2num(sd(1,2:3))==0
        if str2num(sd(1,2:3))~='0'
            eval(['s',num2str(n),'=[s',sd(1,1), ',shund];']);
        end
    else        
        if str2num(sd(1,2:3))<10
            eval(['s',num2str(n),'=[s',sd(1,1),'00,' and ',s',sd(1,3),'];']);
        else
            eval(['s',num2str(n),'=[s',sd(1,1),'00,' and ',s',sd(1,2:3),'];']);
        end
    end 
    n=n+1;
end
    

slength=0;
for i=1:999
    eval(['slength=slength+length(s',num2str(i),');']);
end

slength = slength+length(s1)+length(s1000)