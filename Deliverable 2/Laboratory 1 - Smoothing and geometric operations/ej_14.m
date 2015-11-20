%% Practicum 2 : 1.4
% this code, reads an image, and let the user choose the column to cut the
% image in two

image = imread('images/clooney.jpg');

% This first function, was used to determine manually the column from where
% to divide the image
%flip_image(image);

% The automatic method that flips the image 
flip_image(image, 223);