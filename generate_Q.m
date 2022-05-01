function Q = generate_Q(mat,M,N )

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

K = zeros(M.*N,M+N);
for k=1:1:M*N
    for l=1:1:(M+N)
        
        if(l==ceil(k/N))
            K(k,l) = (sigma(ceil(k/N),(mod((k-1),N)+1)))*(M/m);
        
        elseif(l == M + mod((k-1),N)+1)
            K(k,l) = -(sigma(ceil(k/N),(mod((k-1),N)+1)))*(N/n);
        else
            K(k,l) =0;
        end
    end
    Q = transpose(K)*K;
    writematrix(sigma, 'sigma.csv');
    writematrix(Q,'Q.csv')
end


end