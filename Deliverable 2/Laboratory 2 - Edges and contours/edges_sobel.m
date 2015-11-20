function [ image_edges, image_overlapped ] = edges_sobel(image, treshold, direction, option )
% Sobel tries to find edges by the use of the approximation to the
% derivative. So, will find an edge at the place where there is a maximum
% in the gradient of I.
    R = edge(image(:,:,1),'sobel',treshold, direction, option);
    G = edge(image(:,:,2),'sobel',treshold, direction, option);
    B = edge(image(:,:,3),'sobel',treshold, direction, option);
    
    image_edges = R+G+B;
    
    image_overlapped = overlap(image,image_edges);
end