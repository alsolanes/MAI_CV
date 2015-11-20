%% Exercice 3.1 %%
%%%%%%%%%%%%%%%%%%
% 
% 1. The command 'imagesc' shows an image with scaled colors. For example,
% imagesc([1;2;3]) and imagesc(100*[1;2;3]) will have the same
% representation
%
% 2. The command 'colorbar' displays a colorbar showing the mapping of the
% data values.
%
% 3. All images shown before correspond to the bank of filters of 
% Leung-Malik. It consists of first and second derivatives of Gaussians at
% 6 orientations and 3 scales making a total of 36; 8 Laplacian of Gaussian 
% filters; and 4 Gaussians.

addpath('src');
testFilters();