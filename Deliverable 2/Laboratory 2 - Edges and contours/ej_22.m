% Computer Vision - MAI
% Pablo Martínez and Aleix Solanes
% 2.2 Determine the optimal edges

% Read the image "starbuck.jpg" and find its edges. Apply the different
% operators and find the optimal parameters for each of them. Overlap the
% edges on the image as shown in FIg.2(right). How many ways do you know to
% obtain the edges of the image?
star_orig = imread('images/starbuck.jpg');
figure, 
subplot(4,3,1), imshow(star_orig);
title('Original');

% Sobel
[edges overlap]  = edges_sobel(star_orig,0.08,'both','thinning');
subplot(4,3,2), imshow(edges);
title('Sobel');
subplot(4,3,3), imshow(overlap);
title('overlapped');
% Prewitt
subplot(4,3,4), imshow(star_orig);
title('Original');
[edges overlap]  = edges_prewitt(star_orig,0.15,'both');
subplot(4,3,5), imshow(edges);
title('Prewitt');
subplot(4,3,6), imshow(overlap);
title('overlapped');
% Laplacian of the gaussian
subplot(4,3,7), imshow(star_orig);
title('Original');
[edges overlap]  = edges_laplacian(star_orig,0.15,1);
subplot(4,3,8), imshow(edges);
title('Laplacian');
subplot(4,3,9), imshow(overlap);
title('overlapped');
% Canny
subplot(4,3,10), imshow(star_orig);
title('Original');
[edges overlap]  = edges_canny(star_orig,0.1,0.1);
subplot(4,3,11), imshow(edges);
title('Canny');
subplot(4,3,12), imshow(overlap);
title('overlapped');

% In order to find the edges, we have applied four methods: Prewitt,
% Laplacian of the gaussian and Canny. Each of these methods are briefly
% explained in the corresponding function. The best values have been chosen
% experimentally, and are those currently set.

% Which is the best edge detector? Which are the optimal parameters of this
% operator for this image? Repeat the experiment on 3-4 other images. Discuss if the
% parameters should be changed. What are the advantages and disadvantages you
% see when extracting the edges on the different images?

% The best edge detector is the Canny method, it gives a cleaner result.
% This method uses a threshold for the stronger edges, and another
% threshold for the weaker edges. The resulting edge will include strong
% edges, but if the weak edges are related to the stronger ones, will
% appear too. This means that the noise is reduced, and its objective is to
% only show relevant edges.
% And for this image, the values are 0.1 both for the threshold and the
% sigma value.
% Now, we apply the best chosen method (Canny) to other images. In this
% case using the same values as before gives bad results, as the image used
% before has different characteristics than the current images. So, the
% values should be changed and adapted to each image in order to obtain a
% good representation of the edges.
figure,
% dog.jpg
orig = imread('images/dog.jpg');
subplot(4,3,1), imshow(orig);
title('Original');
[edges overlap]  = edges_canny(orig,0.1,0.1);
subplot(4,3,2), imshow(edges);
title('Canny');
subplot(4,3,3), imshow(overlap);
title('overlapped');

% doulphin.jpg
orig = imread('images/doulphin.jpg');
subplot(4,3,4), imshow(orig);
title('Original');
[edges overlap]  = edges_canny(orig,0.1,0.1);
subplot(4,3,5), imshow(edges);
title('Canny');
subplot(4,3,6), imshow(overlap);
title('overlapped');

% fabulous.jpg
orig = imread('images/fabulous.jpg');
subplot(4,3,7), imshow(orig);
title('Original');
[edges overlap]  = edges_canny(orig,0.1,0.1);
subplot(4,3,8), imshow(edges);
title('Canny');
subplot(4,3,9), imshow(overlap);
title('overlapped');

% towerWoman.jpg
orig = imread('images/towerWoman.jpg');
subplot(4,3,10), imshow(orig);
title('Original');
[edges overlap]  = edges_canny(orig,0.1,0.1);
subplot(4,3,11), imshow(edges);
title('Canny');
subplot(4,3,12), imshow(overlap);
title('overlapped');

%-------------------------------------------------------------------------
%% optimal values
% for example, in the dog.jpg image, a threshold value of around 0.3 is far
% better that the value from before.
% dog.jpg
orig = imread('images/dog.jpg');
subplot(1,3,1), imshow(orig);
title('Original');
[edges overlap]  = edges_canny(orig,0.3,0.1);
subplot(1,3,2), imshow(edges);
title('Canny threshold = 0.3 sigma 0.1');
subplot(1,3,3), imshow(overlap);
title('overlapped');
