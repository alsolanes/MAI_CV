%% EXERCICE 3.3

addpath('src/');

buildings = 'texturesimages/buildings/';
forest = 'texturesimages/forest/';
sunset = 'texturesimages/sunset';

F = makeLMfilters();
[buildings_feat, bfiles]  = getClassFeatures(buildings, F);
[sunset_feat, sfiles]     = getClassFeatures(sunset, F);
[forest_feat, ffiles]     = getClassFeatures(forest, F);

clear buildings forest sunset F
