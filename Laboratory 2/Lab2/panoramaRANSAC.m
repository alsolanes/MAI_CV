Ia = imread('images/im2_ex1.jpg');
Ib = imread('images/im1_ex1.jpg');
num_correspondences = 10;
M = 100;
ransac(Ia,Ib,M,num_correspondences);