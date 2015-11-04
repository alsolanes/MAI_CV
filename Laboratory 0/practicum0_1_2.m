%Open image friends.jpg and display it
img = imread('img/friends.jpg');
size(img)
imshow(img);
%img = rgb2gray(img);
figure, imshow(img);
imgSize = size(img);

%Computing the minimal and maximal greys of the img
maximum_Gray = max(img(:));
minimum_Gray = min(img(:));

%Changing the minimum to 0
img = img - minimum_Gray;
figure, imshow(img);

%Changing the maximum to 255 maximizing its contrast
factor = 255/double(maximum_Gray-minimum_Gray);
img = img * factor;


figure, imshow(img);

