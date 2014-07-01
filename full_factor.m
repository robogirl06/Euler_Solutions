%FULL_FACTOR
%This function is to find all the natural number factors for any given
%integer.

function n_factor=full_factor(n)
    %check if n is a prime number
    if isprime(n)==0    
        %if not prime, then find prime factors
        n_fac=[1,factor(n)];
            i=2;
            while i<length(n_fac) 
                %loop to multiply the prime factors together to make
                %non-prime multiples.
                k=1;
                while k<(length(n_fac)-i)
                    temp = n_fac(i)*n_fac(i+k);
                    if n/temp==floor(n/temp) && any(n_fac(:)==temp)==0 
                        % is the value a multiple and is it not already 
                        % in the factor vector?
                        n_fac=[n_fac,temp];
                    end
                    k=k+1;
                end
                i=i+1;
            end
            n_fac=sort(n_fac);           %sort factors
            n_factor=[n_fac(1)];
            for i=1:(length(n_fac)-1)   %remove duplicate primes
                if n_fac(i)~=n_fac(i+1)
                    n_factor=[n_factor,n_fac(i+1)];
                end
            end
            %final vector containing all factors
            if any(n_factor(:)==n)==0
                n_factor=[n_factor,n];
            end
    else
        n_factor=[1,n];
    end
end

