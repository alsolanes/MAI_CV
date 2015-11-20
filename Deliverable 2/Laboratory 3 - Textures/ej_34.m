%% EXERCICE 3.3

% Set an input image
addpath('src');
path = 'texturesimages/forest/forest_22.jpg';
forest = 'texturesimages/forest';
F = makeLMfilters();

img = imread(path);

% Get the class features
[forest_feat, ffiles]     = getClassFeatures(forest, F);

% Retrieve the 5 most similar images to img
retrieveKImages(img, forest, forest_feat,5);



