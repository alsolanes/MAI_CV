function [ output_args ] = getFeatures( img )
%GETFEATURES extract the descriptors given an image
fig = figure();
colormap(fig,'jet');
F = makeLMfilters();
grayim = rgb2gray(img);
for k=1:size(F,3);
     subplot(8,6,k);
     imagesc(conv2(grayim,F(:,:,k),'same')); colorbar;
end

end

