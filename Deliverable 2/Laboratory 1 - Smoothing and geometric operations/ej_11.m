%% Pablo Martínez and Aleix Solanes
%% Laboratory 1 
%1.1 a )Create the three images in gray scale
% In order to create the images we begin by creating a matrix of zeros, and
% after that we decide which region of the matrix should be fullfilled with
% values, in this case we chose to represent images in uint8, so the white
% color is the one corresponding to the value 256.
% first image: half left black, half right white
im1 = zeros(256, 256, 'uint8');
im1(1:256, 128:256)=256;
figure;
subplot(2,2,1),imshow(im1);
title('Image 1');

% second image: top black, down white
im2 = zeros(256,256,'uint8');
im2(128:256, 1:256) = 256;

subplot(2,2,2),imshow(im2);
title('Image 2');
% third image: top-left white, rest black
im3 = zeros(256, 256, 'uint8');
im3(1:128, 1:128) = 256;

subplot(2,2,3),imshow(im3);
title('Image 3');

% b : combine the 3 images to construct the color image
% we concatenate the images along the specified dimension to construct the color image
% As we define an image for each color (R,G,B), the resulting image has as
% channels, the previous image values. When a zone for example, has 255 in
% the red channel, and 0 in the other channels, the resulting color will be
% red.
img_3channels = cat(3, im1, im2, im3);

subplot(2,2,4),imshow(img_3channels);
title('Final image');
% c : save image as 3channels.jpg
imwrite(img_3channels, '3channels.jpg', 'jpg')
