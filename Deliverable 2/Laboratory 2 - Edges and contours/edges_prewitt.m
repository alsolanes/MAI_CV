function [ image_edges, image_overlapped ] = edges_prewitt(image, treshold, direction )
% Prewitt, uses the approximation to the derivative and looks for maximum
% values on the gradient of the image to find edges.
    R = edge(image(:,:,1),'prewitt',treshold, direction);
    G = edge(image(:,:,2),'prewitt',treshold, direction);
    B = edge(image(:,:,3),'prewitt',treshold, direction);
    
    image_edges = R+G+B;
    
    image_overlapped = overlap(image,image_edges);
end