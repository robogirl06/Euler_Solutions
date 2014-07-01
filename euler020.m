% Project Euler #20
% n! means n  (n  1)  ...  3  2  1
% 
% For example, 10! = 10  9  ...  3  2  1 = 3628800,
% and the sum of the digits in the number 10! is:
% 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
% 
% Find the sum of the digits in the number 100!

clear all
clc

%Since Matlab is limited to 16 digit precision (and really it's pretty
%useless after about 12 digits, we need to multiply manually (digit by
%digit)
i=0;    % Ones Digit initial value
j=10;   % Tens Digit initial value
a=[1];  % Initial value for product

while j ~= 0 || i>0
    while a(length(a))== 0  
        % While loop is to remove trailing zeros since they are not 
        % necessary for sum of digits
        a=a(1:length(a)-1);
    end
    n=length(a);
    k=n;
    c=[];
    % First calculate the units digit. If next number in the factorial
    % is a multiple of ten, just multiply the units digit by the
    % tens digit since it will not affect the sum of digits.
    if i==0 && j~=0
       b=a(n)*j;
    else
       b=a(n)*i+a(n)*j*10;
    end
    
    % then if that multiple is > 9, we will need to carry to the next value.
    if b>9
        b_str=num2str(b);
        c(1)=str2double(b_str(1,length(b_str)));
        c_carry=str2double(b_str(1:(length(b_str)-1)));
    else
        % otherwise, don't need to carry
        c(1)=b;
        c_carry=0;
    end
    
    % Now that the units digit is done, use a loop to calculate the
    % remaining digits.
    k=k-1;
    while k>0
        if i==0 && j~=0
           b=a(k)*j+c_carry;
        else
           b=a(k)*i+a(k)*j*10+c_carry;
        end
        if b > 9
            b_str=num2str(b);
            c=[str2double(b_str(1,length(b_str))),c];
            c_carry=str2double(b_str(1:(length(b_str)-1)));
        else
            c=[b,c];
            c_carry=0;
        end
        k=k-1;
    end
    
    % If the last carry value is 10 or greater, need to parse the digits.
    if c_carry ~= 0
        if c_carry > 9
           c_carry_str=num2str(c_carry);
           d=[];
           for l=[1:length(c_carry_str)]
               d=[d,str2double(c_carry_str(l))];
           end
           c_carry=d;
        end
        a=[c_carry,c];   
    else
        a=c;
    end
    
    % Increment down to the next number
    if i == 0
        i=9;
        j=j-1;
    else
        i=i-1;
    end
end

disp(['The sum of the digits of 100! is: ',num2str(sum(a))])