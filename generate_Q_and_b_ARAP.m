function [Q,b] = generate_Q_and_b_ARAP(mat,M,N )

%This function gets the sialency matrix of each pixel and the number of
%rows and columns as input and outputs the matrix Q.
 
%find the sialency matrix 
%m and n are the height and width respectively 
[m,n] = size(mat);
%res is the remaining pixel from the left.
sigma = zeros(M,N);
height = m/M;
width = n/N;

%fill all the semi pixels from the hieght
for i=1:1:M
   for j=1:1:N
     sigma(i,j) = calcPetchValue(i,j,mat,width, height); 
   end
end

R_top = zeros(M.*N,M+N);
R_btm = zeros(M.*N, M+N);

%create R_top
for k=1:1:M*N
    for l=1:1:(M+N)
        
        if(l==ceil(k/N))
            R_top(k,l) = (sigma(ceil(k/N),(mod((k-1),N)+1)))*(M/m);
        else
            R_top(k,l) =0;
        end
    end
    
    
    %create R_btm
    for l=1:1:(M+N)
        
        if(l == M + mod((k-1),N)+1)
            R_btm(k,l) = (sigma(ceil(k/N),(mod((k-1),N)+1)))*(N/n);
        else
            R_btm(k,l) =0;
        end
    end
end   
 

    mul = M*N;
    v = zeros(mul,1);
    for i=1:1:mul
        v(i,1) = sigma(ceil(i/N), mod((i-1),N)+1);
    end
    v_twice = cat(1,v,v);
    R = cat(1,R_top,R_btm);
    b = -2.*transpose(R)*v_twice;
    Q = transpose(R)*R;
    writematrix(Q,'Q_ARAP.csv')



end