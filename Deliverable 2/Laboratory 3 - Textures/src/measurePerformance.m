function [ A, Anorm ] = measurePerformance(img, F)

grayim = rgb2gray(img);
A = zeros(size(F,3),1);
for k=1:size(F,3);
     num = abs(mean2(conv2(grayim,F(:,:,k),'same')));
     A(k) = num;
end
Anorm = (A - min(min(A)))/(max(max(A)) - min(min(A)));


end
