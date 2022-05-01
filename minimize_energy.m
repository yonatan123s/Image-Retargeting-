%This code should minimize the ASAP energy funciton 
%for the energy values stored in M.csv at:
%C:\Users\97250\Documents\Bar Ilan\semester 7\DGP2\project\appdesigner
%
%input:  M & N, H & W, H' & W'.
%output: s_rows ( vector of size M), s_cols (vector of size N)

function [s_rows, s_cols] = minimize_energy(M, N, H, W, H_tag, W_tag,mat)
    n = M+N; %first M are the rows and last N are cols
    epsilon = 0.0001;
    [Q,b] = generate_Q_and_b_ARAP(mat,M,N);
    %This is the cvx code to minimize the energy
    %s denotes the vector of rows and cols unknown variables
    cvx_begin
        variable s(n) 
        minimize( quad_form(s,Q) + s.'*b );
        subject to
            s>=0;
            %sum of rows is equal to the new image hight and the sum of the
            %columns to the width
            sum(s(1:M))== H_tag;
            sum(s(M+1:(M+N))) == W_tag;
    cvx_end
    
    
    %returned vlaues
    s_rows = s(1:M);
    s_cols = s(M+1:(M+N));
    directory = 'C:\Users\97250\Documents\MATLAB\DGP_CODE_DIR\Commands';
    filename  = 's_rows.csv';
    fileDest  = fullfile(directory,filename); 
    writematrix(s_rows,fileDest);
    
    
    directory = 'C:\Users\97250\Documents\MATLAB\DGP_CODE_DIR\Commands';
    filename  = 's_cols.csv';
    fileDest  = fullfile(directory,filename); 
    writematrix(s_cols,fileDest);
    
end