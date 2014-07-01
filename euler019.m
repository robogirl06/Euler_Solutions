% Project Euler #19
% You are given the following information, but you may prefer to do some 
% research for yourself.
% 
% 1 Jan 1900 was a Monday.
% Thirty days has September,
% April, June and November.
% All the rest have thirty-one,
% Saving February alone,
% Which has twenty-eight, rain or shine.
% And on leap years, twenty-nine.
% A leap year occurs on any year evenly divisible by 4, but not on a 
% century unless it is divisible by 400.
% How many Sundays fell on the first of the month during the twentieth 
% century (1 Jan 1901 to 31 Dec 2000)?

clear all
clc

%December 31, 1900 = day 31, month 12, year 1900

day=31;
month=12;
year=1900;
tot_day=31;         %total days in the month
count=0;            %total days since start of count
sun_count=0;        %number of sundays on the 1st of the month
while year < 2001   %only 20th century (end search on 12/31/2000
    %is the current day of the year a Sunday and the 1st of the month?
    if (count+1)/7 == floor((count+1)/7) && day == 1
        sun_count = sun_count + 1;   %increment Sunday count
        sun = [month year]      %save date for validation
    end
    if day < tot_day    %if it is not the last day of the month
        day = day + 1;
    elseif day == tot_day %if it is the last day of the month
        day = 1;    %reset to day 1
        if month < 12   %is it not the last month of the year?
            %if not the last month, increment month and determine how many
            %days are in the new month.
            month = month + 1;  
            if month == 2
                if year/4 == floor(year/4)
                    tot_day = 29;
                else
                    tot_day = 28;
                end
            elseif month == 4 || month == 6 || month == 9 || month == 11
                    tot_day = 30;
            else
                tot_day=31;
            end
        else    %if it is the last month, increment the year
            month = 1;
            year = year+1;
            tot_day = 31;
        end
    end
    %increment the total day count to determine the day of the week
    count=count+1; 
end
disp(['Total Sundays in the 20th Century = ', num2str(sun_count)])