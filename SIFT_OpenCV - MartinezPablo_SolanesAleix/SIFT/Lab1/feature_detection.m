%% Students: Pablo Martinez and Aleix Solanes
%% Subject: Computational Vision
%% Course: Master in Artificial Intelligence


%% Lab1: Feature detection
I = vl_impattern('roofs1');
I = single(rgb2gray(I));
%figure, imshow(gradient(I));
figure, imshow(I);
[f,d] = vl_sift(I);

% view the descriptors
figure, show_keypoints(I, f);
% selective view of descriptors. 50 random points
figure, show_keypoints(I, random_selection(f, 50));

%% different peak and edge thresholds
figure
[f,d] = vl_sift(I,'PeakThresh', 0.04, 'EdgeThresh', 2);
subplot(2,3,1), show_keypoints(I,f);
title('Edge threshold:2')

[f,d] = vl_sift(I,'PeakThresh', 0.04, 'EdgeThresh', 6);
subplot(2,3,2), show_keypoints(I,f);
title('Edge threshold:6')

[f,d] = vl_sift(I,'PeakThresh', 0.04, 'EdgeThresh', 8);
subplot(2,3,3), show_keypoints(I,f);
title('Edge threshold:8')

[f,d] = vl_sift(I,'PeakThresh', 0.04, 'EdgeThresh', 10);
subplot(2,3,4), show_keypoints(I,f);
title('Edge threshold:10')

[f,d] = vl_sift(I,'PeakThresh', 0.04, 'EdgeThresh', 12);
subplot(2,3,5), show_keypoints(I,f);
title('Edge threshold:12')

[f,d] = vl_sift(I,'PeakThresh', 0.04, 'EdgeThresh', 20);
subplot(2,3,6), show_keypoints(I,f);
title('Edge threshold:15')

%% alternative view of the image 'river1'

I = vl_impattern('river1');
I = single(rgb2gray(I));
figure, imshow(I);
[f,d] = vl_sift(I);

% view the descriptors
figure, show_keypoints(I,f);

% selective view of descriptors. 50 random points
figure, show_keypoints(I, random_selection(f, 50));

%% Testing the SIFT detector
[f,d] = vl_sift(I,'PeakThresh', 0.01);
figure 
subplot(2,3,1), show_keypoints(I,f);
title('Peak threshold: 0.01')

[f,d] = vl_sift(I,'PeakThresh', 0.02);
subplot(2,3,2), show_keypoints(I,f);
title('Peak threshold: 0.02')

[f,d] = vl_sift(I,'PeakThresh', 0.03);
subplot(2,3,3), show_keypoints(I,f);
title('Peak threshold: 0.03')

[f,d] = vl_sift(I,'PeakThresh', 0.04);
subplot(2,3,4), show_keypoints(I,f);
title('Peak threshold: 0.04')

[f,d] = vl_sift(I,'PeakThresh', 0.05);
subplot(2,3,5), show_keypoints(I,f);
title('Peak threshold: 0.05')

[f,d] = vl_sift(I,'PeakThresh', 0.8);
subplot(2,3,6), show_keypoints(I,f);
title('Peak threshold: 0.8')