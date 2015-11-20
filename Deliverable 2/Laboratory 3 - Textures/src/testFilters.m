function [ ] = testFilters()
    % Illustrating Gaussian filter bank
    F=makeLMfilters(); % generating the filters
    visualizeFilters(F);
    
end