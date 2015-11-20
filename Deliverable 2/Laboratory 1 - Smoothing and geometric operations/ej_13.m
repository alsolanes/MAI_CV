% 1.3. managing different size and filters
%% a : read one of the images in the images.rar
image = imread('images/amsterdam.jpg');
figure; 
subplot(1,3,1),imshow(image);
title('Original');
% b : resize image and check histogram
resize = imresize(image, 0.2);
imwrite(resize, 'amsterdam_0_2.jpg','jpg');
subplot(1,3,2);imshow(resize);
title('Resized');

scaled = imresize(resize,5);
imwrite(scaled, 'amsterdam_scaled.jpg','jpg');
subplot(1,3,3);imshow(scaled);
title('Scaled');
% At this moment we can see that the resized image has lost many details,
% because when resizing, many pixels information are lost, so if we rescale
% another time the image, we can see an image of the same size as the
% original, but formed with less pixels than the original one.

%% Original histogram
figure; 
subplot(3,3,1);
imhist(image(:,:,1));
title('Original:R');
subplot(3,3,2)
imhist(image(:,:,2));
title('Original:G');
subplot(3,3,3)
imhist(image(:,:,3));
title('Original:B');

% Histogram of the resized image
subplot(3,3,4);
imhist(resize(:,:,1));
title('Resized:R');
subplot(3,3,5);
imhist(resize(:,:,2));
title('Resized:G');
subplot(3,3,6);
imhist(resize(:,:,3));
title('Resized:B');

% In this histogram we can see how values are not as smooth as the original
% image, because the image now is resized.

%%Histogram of the scaled image
subplot(3,3,7);
imhist(scaled(:,:,1));
title('Scaled:R');
subplot(3,3,8);
imhist(scaled(:,:,2));
title('Scaled:G');
subplot(3,3,9);
imhist(scaled(:,:,3));
title('Scaled:B');

% The scaled image, now, seems a different image from the original, as we
% have lost many information during the resizing. Keeps a similar form, but
% many details have been lost, so, as a result the histogram is changed.

%% c : apply smoothing filters
% simple smoothing filter (horizontal)
filter_s1 = 1/3*[1 1 1];
im1 = imfilter(image,filter_s1);
figure; set(gcf, 'name', '1. Smooth filter ');
imshow(im1);
% gaussian filter
filter_gauss = fspecial('gaussian',12,3);
filter_gauss = imfilter(image, filter_gauss);
figure; set(gcf, 'name', '2. Gaussian filter');
imshow(filter_gauss);
% The gaussian filter is directly influenced by the size of the mask and
% the size of the filter, because it will be more or less sensitive to the
% values of the neighbor pixels.
% As the mask gets bigger, the higher smoothing will be applied.

% Filters on RGB images can be applied in Matlab, as the software applies
% the convolve to each channel of the image. This theorically should be not
% possible because it is not possible to convolve a 2D mask to a 3 channel
% image, but, applying the mask to each channel separatedly permits the
% software to apply a filter to an image RGB.

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

% The difference between these filters, is that each of these filters is
% applied into a direction. The filter [1 1 1 1 1] is applied horizontally,
% the filter [1;1;1;1;1] is applied vertically, and the last one in a
% multidirectional way.

% The mask, must be normalized, because if not, the overall brightness of
% the image would be much higher than expected. It would be the
% multiplication of the sum of each value of the mask.


%% Apply different times in order to see the difference
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

% Applying these filters several times has the effect of a more exagerate
% filter. So the effect is much evident.

%% d: Apply a median filter (by the use of medfilt2(A, [m, n])
% the output of medfilt2 is the median filtering, where each output pixel
% is the median value of the m-by-n neighbourhood around the corresponding
% pixel in the image
size = 3;
filter_median_r = medfilt2(image(:,:,1), [size size]);
filter_median_g = medfilt2(image(:,:,2), [size size]);
filter_median_b = medfilt2(image(:,:,3), [size size]);
img_median = cat(3, filter_median_r, filter_median_g, filter_median_b);
figure, 
subplot(1,3,1),imshow(img_median);
title('Median filter 3x3');

size = 5;
filter_median_r = medfilt2(image(:,:,1), [size size]);
filter_median_g = medfilt2(image(:,:,2), [size size]);
filter_median_b = medfilt2(image(:,:,3), [size size]);
img_median = cat(3, filter_median_r, filter_median_g, filter_median_b);
subplot(1,3,2), 
imshow(img_median);
title('Median filter 5x5');

size = 7;
filter_median_r = medfilt2(image(:,:,1), [size size]);
filter_median_g = medfilt2(image(:,:,2), [size size]);
filter_median_b = medfilt2(image(:,:,3), [size size]);
img_median = cat(3, filter_median_r, filter_median_g, filter_median_b);
subplot(1,3,3), 
imshow(img_median);
title('Median filter 7x7');

% The median filter can be used in order to reduce the noise in an image,
% this is also the case of the other smoothing filters. The main difference
% is on the edges, because the median filter tries to conservate the edges
% in a better way.