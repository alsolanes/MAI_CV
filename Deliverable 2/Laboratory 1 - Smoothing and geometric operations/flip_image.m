%% 1.4 : flip images. Clooney to the left

function [flipped_image] = flip_image(image, column_number)
%The column_number is optional, if not specified, the column number of the
%cut is set manually using the function imcrop.
%
if nargin < 2
    I = imcrop(image);
    column_number = size(I);
    column_number = column_number(2)
end

size_of_image = size(image);

left_photo = image(:, [1:column_number], :);
right_photo = image(:, [column_number:size_of_image(2)],:);
flipped_image = cat(2, right_photo, left_photo);

figure, set(gcf, 'name', 'Flipped image');
imshow(flipped_image);

end