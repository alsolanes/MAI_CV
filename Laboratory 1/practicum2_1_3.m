% 1.3. managing different size and filters
%% a : read one of the images in the images.rar
image = imread('images/amsterdam.jpg');
figure; imshow(image);
%% b : resize image and check histogram
resize = imresize(image, 0.7);
imwrite(resize, 'amsterdam_0_7.jpg','jpg');
figure;imshow(resize);
%%
figure;%set(gcf, 'name', 'Original image');
subplot(3,1,1);
imhist(image(:,:,1));
title('R');
subplot(3,1,2)
imhist(image(:,:,2));
title('G');
subplot(3,1,3)
imhist(image(:,:,3));
title('B');

%% Histogram of the resized image
figure;%set(gcf, 'name', 'Resized image');
subplot(3,1,1);
imhist(resize(:,:,1));
title('R');
subplot(3,1,2);
imhist(resize(:,:,2));
title('G');
subplot(3,1,3);
imhist(resize(:,:,3));
title('B');

image = imresize(resize, 4);
figure;imshow(image);


%%Histogram of the scaled image
figure;%set(gcf, 'name', 'Rescaled image with original size');
subplot(3,1,1);
imhist(image(:,:,1));
title('R');
subplot(3,1,2);
imhist(image(:,:,2));
title('G');
subplot(3,1,3);
imhist(image(:,:,3));
title('B');