function [ image_edges, image_overlapped ] = edges_canny(image, treshold, sigma )
% Canny, looks for the local maxima of the gradient of the image, so at
% this point, localizes the edge.
% In order to calculate the gradient, canny uses the derivative of Gaussian
% filter.
    R = edge(image(:,:,1),'canny',treshold, sigma);
    G = edge(image(:,:,2),'canny',treshold, sigma);
    B = edge(image(:,:,3),'canny',treshold, sigma);
    
    image_edges = R+G+B;
    
    image_overlapped = overlap(image,image_edges);
end