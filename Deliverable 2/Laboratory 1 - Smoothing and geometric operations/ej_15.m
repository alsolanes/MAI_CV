% Computer Vision (MAI)
% Pablo Martínez and Aleix Solanes
% 1.5 Image binarization
%% a) Create the binary version of the original image by  a threshold value
% of 20. What does it happen if we use different threshold
% values(30,150,255)? Why?
car = imread('images/car_gray.jpg');

binarized_car_20 = threshold(car,20);
figure, 
subplot(2,2,1); imshow(binarized_car_20);
title('Binarized Threshold 20');
binarized_car_30 = threshold(car,30);
subplot(2,2,2), imshow(binarized_car_30);
title('Binarized Threshold 30');
binarized_car_150 = threshold(car,150);
subplot(2,2,3), imshow(binarized_car_150);
title('Binarized Threshold 150');
binarized_car_255 = threshold(car,255);
subplot(2,2,4), imshow(binarized_car_255);
title('Binarized Threshold 255');

% As the threshold goes to a higher number, the image tends to be darker.
% This is because when a value is under the threshold turns to have value
% 0.

%% b) Visualize and save the image of threshold 150 as car_binary.jpg
figure, imshow(binarized_car_150);
title('Binarized Th. 150');
imwrite(binarized_car_150, 'car_binary.jpg');

%% c) What will happen if you multiply the original image by the binary
% image?
multiplied_car = car .* uint8(binarized_car_150);
figure, imshow(multiplied_car);
% what will happen, is that the values under the threshold will be zero,
% but the values over the threshold will keep its original value. So the
% darker sides will be completely black, but the whiter ones will keep its
% own value.

%% d) What will happen if you multiply the original image with the inverted binary image?
multiplied_inverted = car .* uint8(~im2bw(car,150/256));
figure, imshow(multiplied_inverted);
% in this case, the values that keep as in the original image are the ones
% that were darker, so, the higher valued values will be white.