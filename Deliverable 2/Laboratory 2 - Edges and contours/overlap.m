function [overlapped_image] = overlap(im1,im_edge)
% This function overlaps im1 with im_edge. im1 is the original image, and
% im_edge is the image with only the edges in black and white.
    size_im = size(im1);
    overlapped_image = im1;
    for i=1:size_im(1)
        for j=1:size_im(2)
            if im_edge(i,j)>0
                overlapped_image(i,j,1) = 0;
                overlapped_image(i,j,2) = 0;
                overlapped_image(i,j,3) = 0;
            end
        end
    end
end