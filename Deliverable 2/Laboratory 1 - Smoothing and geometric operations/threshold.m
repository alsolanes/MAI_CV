function [image] = threshold(im, val_th)
    image = (zeros(size(im)));
    image(im >= val_th) = 1;
end