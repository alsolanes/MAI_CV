% 1.2 displaying color images

% read sillas.jpg
sillas = imread('images/sillas.jpg');

% read different channels and display them
red_sillas = sillas(:,:,1);
figure, imshow(red_sillas)
imwrite(red_sillas, 'red_sillas.jpg','jpg')
green_sillas = sillas(:,:,2);
figure, imshow(green_sillas)
imwrite(green_sillas, 'green_sillas.jpg','jpg')
blue_sillas = sillas(:,:,3);
figure, imshow(blue_sillas)
imwrite(blue_sillas, 'blue_sillas.jpg','jpg')

%interchange channels
interchanged = cat(3, green_sillas, blue_sillas, red_sillas);
figure, imshow(interchanged)
imwrite(interchanged, 'interchanged.jpg','jpg')

%multiply one channel by 0. In this case, the red one
green_sillas = green_sillas*0;
final_image=cat(3, red_sillas, green_sillas, blue_sillas);
figure, imshow(final_image)
imwrite(final_image, 'final_image_mult0.jpg','jpg')