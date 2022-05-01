%input:
%M and N the number of rows and columns in the grid.
%H_tag and M_tag the new image size.

%output:
%the new rows and columns size.

%note: this code works only on the bicycle image. to change it change mat
%(sliency map) to fit your image.

mat=csvread('pixelMatrix.csv');
M=30;
N=30;
[H,W] = size(mat);
H_tag = 640;
W_tag = 500;

%matNew = ones(H,W);
[s_rows, s_cols] = minimize_energy(M, N, H, W, H_tag, W_tag, mat);

%Q=csvread('C:\Users\97250\Documents\Bar Ilan\semester 7\DGP2\project\appdesigner\Q.csv');