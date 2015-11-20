% Computer Vision - MAI
% function fuseImg - which merges two images
function [image] = fuseImg()
% a) Open hand.jpg and convert it to gray scale image
    hand = imread('images/hand.jpg');
    mapfre = imread('images/mapfre.jpg');
    hand_grey = rgb2gray(hand);
    figure, imshow(hand_grey);
    title('Grayscale image');
% b) Perform a binarization to obtain a binary image of 2 regions: the hand
% (called foreground) and the rest(called background). Create the inverse
% binary image changing the areas of foreground and background.
    foreground = threshold(hand_grey, 17);
    figure, imshow(foreground);
    background = inverted_threshold(hand_grey, 17);
    figure, imshow(background);
% c) use the binary matrices created in b) to merge the images hand and
% mapfre.
    merged_imageR = hand(:,:,1) .* uint8(foreground) + mapfre(:,:,1) .* uint8(background);
    merged_imageG = hand(:,:,2) .* uint8(foreground) + mapfre(:,:,2) .* uint8(background);
    merged_imageB = hand(:,:,3) .* uint8(foreground) + mapfre(:,:,3) .* uint8(background);
    merged_image = cat(3, merged_imageR, merged_imageG, merged_imageB);
    figure, imshow(merged_image);
%d) save the image as hand_mapfre_3C.jpg
    imwrite(merged_image,'hand_mapfre_3C.jpg');
end