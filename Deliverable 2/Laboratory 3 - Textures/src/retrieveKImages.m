function [] = retrieveKImages(img, directory, feat,  k)


F = makeLMfilters();
[perf, ~] = measurePerformance(img, F);
knearest = knnsearch(feat, perf', 'k', k);
files=dir(fullfile(directory,'*.jpg'));
figure; subplot(2, size(knearest,1), 1);
imshow(img);
for i=1:size(knearest,2)
    subplot(2, size(knearest,2), size(knearest,2)+i)
    imshow(imread(fullfile(directory, files(knearest(i)).name)));
    im=imread(fullfile(directory, files(i).name));
end
end