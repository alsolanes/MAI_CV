% Computer Vision - MAI
% Pablo Martinez and Aleix Solanes

% 2.1. Hybrid images construction
%Given the images Einstein.jpg and Monro.jpg, build a hybrid image from them and
%view it at different scales to obtain the visual effect of hybrid images.
einstein = imread('images/Einstein.jpg');
figure, 
subplot(3,3,1),imshow(einstein);
monro = imread('images/Monro.jpg');
subplot(3,3,2), imshow(monro);

% we should apply a filter (a low-pass filter), a smoothing filter.
% Gaussian filter with hsize = 9 and sigma = 7
filter_1 = fspecial('gaussian',25,9);
figure,
L1 = imfilter(monro, filter_1);
imshow(L1);
title('Low freq.');
% we look for the high frequencies H1 of another image
filter_2 = fspecial('gaussian',25,7);
figure,
H1 = einstein - imfilter(einstein, filter_2);
imshow(H1);
title('High freq.');

figure,
hybrid1 = L1 + H1;
imshow(hybrid1);
title('Hybrid 1');
% sigma values should be different, as the smoothing searched is different
% from the low pass filter and the high pass filter. Different values of
% sigma provide more or less smoothing.

hybrid2 = imresize(hybrid1,0.9);
figure, imshow(hybrid2);

hybrid3 = imresize(hybrid1,0.7);
figure, imshow(hybrid3);

hybrid4 = imresize(hybrid1,0.5);
figure, imshow(hybrid4);

hybrid5 = imresize(hybrid1,0.3);
figure, imshow(hybrid5);

hybrid5 = imresize(hybrid1,0.2);
figure, imshow(hybrid5);