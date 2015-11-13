%% Students: Pablo Martinez and Aleix Solanes
%% Subject: Computational Vision
%% Course: Master in Artificial Intelligence


%% Lab1: Feature detection : test different values and justify

I = vl_impattern('roofs1');
I = single(rgb2gray(I));
figure, imshow(I);
[f,d] = vl_sift(I);

% view the descriptors
figure, show_keypoints(I, f);
% selective view of descriptors. 50 random points
figure, show_keypoints(I, random_selection(f, 50));

[f,d] = vl_sift(I,'PeakThresh', 0.04, 'EdgeThresh', 10);
figure, show_keypoints(I,f);

[f,d] = vl_sift(I,'PeakThresh', 0.04, 'EdgeThresh', 8);
figure, show_keypoints(I,f);

[f,d] = vl_sift(I,'PeakThresh', 0.04, 'EdgeThresh', 5);
figure, show_keypoints(I,f);

[f,d] = vl_sift(I,'PeakThresh', 0.04, 'EdgeThresh', 12);
figure, show_keypoints(I,f);

[f,d] = vl_sift(I,'PeakThresh', 0.04, 'EdgeThresh', 15);
figure, show_keypoints(I,f);

%% alternative view of the image 'river1'

I = vl_impattern('river1');
I = single(rgb2gray(I));
figure, imshow(I);
[f,d] = vl_sift(I);

% view the descriptors
figure, show_keypoints(I,f);

%Testing the SIFT detector
[f,d] = vl_sift(I,'PeakThresh', 0.01);
figure, show_keypoints(I,f);

[f,d] = vl_sift(I,'PeakThresh', 0.03);
figure, show_keypoints(I,f);

[f,d] = vl_sift(I,'PeakThresh', 0.05);
figure, show_keypoints(I,f);

[f,d] = vl_sift(I,'PeakThresh', 0.08);
figure, show_keypoints(I,f);

[f,d] = vl_sift(I,'PeakThresh', 0.005);
figure, show_keypoints(I,f);