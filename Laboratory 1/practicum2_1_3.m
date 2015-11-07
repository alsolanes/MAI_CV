% 1.3. managing different size and filters
%% a : read one of the images in the images.rar
image = imread('images/amsterdam.jpg');
figure; imshow(image);
%% b : resize image and check histogram
resize = imresize(image, 0.7);
imwrite(resize, 'amsterdam_0_7.jpg','jpg');
figure;imshow(resize);

%% Original histogram
figure; set(gcf, 'name', 'Original image');
subplot(3,1,1);
imhist(image(:,:,1));
title('Red');
subplot(3,1,2)
imhist(image(:,:,2));
title('Green');
subplot(3,1,3)
imhist(image(:,:,3));
title('Blue');

%% Histogram of the resized image
figure; set(gcf, 'name', 'Resized image');
subplot(3,1,1);
imhist(resize(:,:,1));
title('Red');
subplot(3,1,2);
imhist(resize(:,:,2));
title('Green');
subplot(3,1,3);
imhist(resize(:,:,3));
title('Blue');

image = imresize(resize, 4);
figure;imshow(image);


%%Histogram of the scaled image
figure; set(gcf, 'name', 'Rescaled image with original size');
subplot(3,1,1);
imhist(image(:,:,1));
title('Red');
subplot(3,1,2);
imhist(image(:,:,2));
title('Green');
subplot(3,1,3);
imhist(image(:,:,3));
title('Blue');

%% c : apply smoothing filters
% simple smoothing filter (horizontal)
filter_s1 = 1/3*[1 1 1];
im1 = imfilter(image,filter_s1);
figure; set(gcf, 'name', '1. Smooth filter ');
imshow(im1);
% gaussian filter
filter_gauss = imgaussfilt(image, 2);
figure; set(gcf, 'name', '2. Gaussian filter');
imshow(filter_gauss);
% filter applied horizontally
filter_s2 = 1/5*[1 1 1 1 1];
figure; set(gcf, 'name', '3. Horizontal filter');
im2 = imfilter(image,filter_s2);
imshow(im2);
% filter applied vertical
filter_s3 = 1/5*[1;1;1;1;1];
figure; set(gcf, 'name', '4. Vertical filter');
im3 = imfilter(image,filter_s3);
imshow(im3);
% 5x5 filter
filter_s4 = 1/25*[1 1 1 1 1;1 1 1 1 1;1 1 1 1 1;1 1 1 1 1;1 1 1 1 1];
figure; set(gcf, 'name', '5. 5x5 filter');
im4 = imfilter(image, filter_s4);
imshow(im4);

% Apply different times in order to see the difference
for i=1:10
    im1 = imfilter(im1, filter_s1);
    im2 = imfilter(im2, filter_s2);
    im3 = imfilter(im3, filter_s3);
    im4 = imfilter(im4, filter_s4);
end

figure; set(gcf, 'name', '1. 10 times filter 3x1 filter');
imshow(im1);
figure; set(gcf, 'name', '2. 10 times filter 5x1 filter');
imshow(im2);
figure; set(gcf, 'name', '3. 10 times filter 1x5 filter');
imshow(im3);
figure; set(gcf, 'name', '4. 10 times filter 5x5 filter');
imshow(im4);

%% d: Apply a median filter (by the use of medfilt2(A, [m, n])
% the output of medfilt2 is the median filtering, where each output pixel
% is the median value of the m-by-n neighbourhood around the corresponding
% pixel in the image
size = 3;
filter_median_r = medfilt2(image(:,:,1), [size size]);
filter_median_g = medfilt2(image(:,:,2), [size size]);
filter_median_b = medfilt2(image(:,:,3), [size size]);
img_median = cat(3, filter_median_r, filter_median_g, filter_median_b);
figure, set(gcf,'name','Median filter 3x3');
imshow(img_median);
size = 5;
filter_median_r = medfilt2(image(:,:,1), [size size]);
filter_median_g = medfilt2(image(:,:,2), [size size]);
filter_median_b = medfilt2(image(:,:,3), [size size]);
img_median = cat(3, filter_median_r, filter_median_g, filter_median_b);
figure, set(gcf,'name','Median filter 5x5');
imshow(img_median);
size = 7;
filter_median_r = medfilt2(image(:,:,1), [size size]);
filter_median_g = medfilt2(image(:,:,2), [size size]);
filter_median_b = medfilt2(image(:,:,3), [size size]);
img_median = cat(3, filter_median_r, filter_median_g, filter_median_b);
figure, set(gcf,'name','Median filter 7x7');
imshow(img_median);
