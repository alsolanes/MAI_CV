function [features, files] = getClassFeatures(directory, F)
files=dir(fullfile(directory,'*.jpg'));
features = zeros(size(files,1), size(F,3));

for i=1:size(files,1)
    im=imread(fullfile(directory, files(i).name));
    [features(i, :), ~] = measurePerformance(im, F);
end
end