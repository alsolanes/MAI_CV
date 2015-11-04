%1.1 Create the three images in gray scale
% first image: half left black, half right white
im1 = zeros(256, 256, 'uint8');
im1(1:256, 128:256)=256;
% second image: top black, down white
im2 = zeros(256,256,'uint8');
im2(128:256, 1:256) = 256;
% third image: top-left white, rest black
im3 = zeros(256, 256, 'uint8');
im3(1:128, 1:128) = 256;

% b : combine the 3 images to construct the color image
img_3channels = cat(3, im1, im2, im3);

figure, imshow(img_3channels)
% c : save image as 3channels.jpg
imwrite(img_3channels, '3channels.jpg', 'jpg')
