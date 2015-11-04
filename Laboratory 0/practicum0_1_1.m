%1.1 Image construction a/
im = zeros(256, 256, 'uint8');

% b
imSize = size(im);

% c
figure = imshow(im);
imwrite(im, 'void_img.jpg')


%1.1 D - create 256x256.../
im(30:220, 30:220)=255;
figure,imshow(im)
imwrite(im, 'square_img.jpg')