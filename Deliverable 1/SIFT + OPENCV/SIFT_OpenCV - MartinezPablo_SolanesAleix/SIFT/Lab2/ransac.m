function [panorama_image] = ransac(Ia, Ib, M, num_correspondences)
    %% Panorama creation by using the RANSAC algorithm
    % Assume we load two images from which we want to construct a panoramic
    % image. Compute then the SIFT descriptors for each of both images and
    % compute the correspondences between both images. Let xa be the matched
    % SIFT keypoint coordinates of the first image, and xb the matched SIFT
    % keypoint coordinates of the second image.
    %Ia = imread('images/im2_ex1.jpg');
    %Ib = imread('images/im1_ex1.jpg');
    Ia = single(rgb2gray(Ia));
    Ib = single(rgb2gray(Ib));
    [fa,da] = vl_sift(Ia);
    [fb,db] = vl_sift(Ib);
    [matches, scores] = vl_ubcmatch(da,db);
    numMatches = size(matches,2);
    xa = fa(1:2,matches(1,:));
    xb = fb(1:2,matches(2,:));

    max_N = 0;
    max_Image = 0;
    %M = 100;
    for iteration=1:M
        % a) Select randomly some (in this example we select 10) of the previous correspondencies.   
        subset = vl_colsubset(1:numMatches, num_correspondences);
        % b) Assume that the two images correspond to each other according to a
        %    linear model (i.e. a translation)
        d = xb(1:2,subset) - xa(1:2,subset);
        p = mean(d,2);
        % c) Apply the previous translation to all correspondencies of the previous image
        xb_ = zeros(size(xb));
        for i=1:numMatches,
            xb_(:,i) = xa(:,i) + p;
        end
        % d) Check how many of these new points are near the original ones
        n = 0;
        for i=1:numMatches,
            e = xb_(:,i) - xb(:,i);
            if (norm(e) < 5), n = n + 1; end
        end
        % e) Among all randomly selected displacements, select the one with
        %    largest value of n. Use this displacement to create the panoramic
        %    image.
        if n > max_N
           max_N = n; 
           max_Image = p;
        end
    end

    box2 = [1 size(Ia,2) size(Ia,2) 1; 1 1 size(Ia,1) size(Ia,1)];
    box2_ = zeros(2,4);

    for i=1:4,
        box2_(:,i) = box2(:,i) + max_Image;
    end

    min_x = min(1,min(box2_(1,:)));
    min_y = min(1,min(box2_(2,:)));
    max_x = max(size(Ib,2),max(box2_(1,:)));
    max_y = max(size(Ib,1),max(box2_(2,:)));

    % We now  create the panoramic image by sampling the image Ib and Ia at the
    % corresponding points. Note that the inverse transformation is used for
    % Ia.
    ur = min_x:max_x;
    vr = min_y:max_y;
    [u,v] = meshgrid(ur,vr);
    Ib_ = vl_imwbackward(im2double(Ib),u,v);

    p_inverse = -p;
    u_ = u + p_inverse(1);
    v_ = v + p_inverse(2);
    Ia_ = vl_imwbackward(im2double(Ia),u_,v_);

    mass = ~isnan(Ib_) + ~isnan(Ia_);
    Ib_(isnan(Ib_)) = 0;
    Ia_(isnan(Ia_)) = 0;
    panoramic = (Ib_ + Ia_) ./ mass;
    imshow(panoramic,[]);

end