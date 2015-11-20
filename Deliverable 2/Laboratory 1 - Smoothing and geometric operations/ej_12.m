%% Pablo Martínez and Aleix Solanes
%% Laboratory 1 

% 1.2 displaying color images

% read sillas.jpg
sillas = imread('images/sillas.jpg');
figure, 
subplot(3,2,1); imshow(sillas);
title('Original');
% read different channels and display them
% The channels are the last parameter, with the order 1=R, 2=G, 3=B
red_sillas = sillas(:,:,1);
subplot(3,2,2); imshow(red_sillas);
title('Only R');
green_sillas = sillas(:,:,2);
subplot(3,2,3); imshow(green_sillas)
title('Only G');
blue_sillas = sillas(:,:,3);
subplot(3,2,4); imshow(blue_sillas)
title('Only B');

%interchange channels. We change from RGB to GBR. As the most important
%color is the red one (the most easy to see directly in the pillows of the
%chairs), this will be the color that will be seen as a color changing. In
%this case, will change from the red original one, to blue.
interchanged = cat(3, green_sillas, blue_sillas, red_sillas);
subplot(3,2,5); imshow(interchanged),
title('Interchanged channels: GBR');

%multiply one channel by 0. In this case, the green one. At each pixel the
%part corresponding to Green channel will not be shown. So, the image will
%be formed only by the channels Red and Blue, which gives a purple tone
%color.
green_sillas = green_sillas*0;
final_image=cat(3, red_sillas, green_sillas, blue_sillas);
subplot(3,2,6); imshow(final_image);
title('Green channel suppressed');