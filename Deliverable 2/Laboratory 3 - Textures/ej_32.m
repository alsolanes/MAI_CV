%% EXERCICE 3.2

% The descriptor that responds better to the images is the laplacian of
% gaussians, this is because it's quite small compared with the contours of
% the image and it fits in many places.
% The size of the descriptor is (4,12) - This is extracted from the VGG 
% webpage.

addpath('src');

img = imread('texturesimages/buildings/buildings_3.jpg');
%img = imread('texturesimages/forest/forest_9.jpg');
F = makeLMfilters();
getFeatures(img);
[A, Anorm] = measurePerformance(img, F);
figure();

for k=1:size(F,3);
     subplot(8,6,k);
     imshow(Anorm(k,1));
     xlabel(num2str(A(k,1)));
end
