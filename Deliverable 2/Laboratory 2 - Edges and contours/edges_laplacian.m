function [ image_edges, image_overlapped ] = edges_laplacian(image, treshold, sigma )
% This method applies the Laplacian of the Gaussian, which looks for zero
% crossings in order to find edges. 
    R = edge(image(:,:,1),'log',treshold, sigma);
    G = edge(image(:,:,2),'log',treshold, sigma);
    B = edge(image(:,:,3),'log',treshold, sigma);
    
    image_edges = R+G+B;
    
    image_overlapped = overlap(image,image_edges);
end