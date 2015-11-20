function [ ] = visualizeFilters(F)
    % Visualizing the filters by pseudocolors
    figure, % visualizing all filters
    for k=1:size(F,3);
         subplot(8,6,k);
         imagesc(F(:,:,k)); colorbar;
    end
end
