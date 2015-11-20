%% Students: Pablo Martinez and Aleix Solanes
%% Subject: Computational Vision
%% Course: Master in Artificial Intelligence


%% Lab2: Feature matching
Ia = imread('images/im2_ex1.jpg');
Ib = imread('images/im1_ex1.jpg');
Ia = single(rgb2gray(Ia));
Ib = single(rgb2gray(Ib));
imshow([Ia Ib],[])

[fa, da] = vl_sift(Ia);
[fb, db] = vl_sift(Ib);

[matches, scores] = vl_ubcmatch(da, db);

figure, show_matches(Ia,Ib,fa,fb,matches);

figure, show_matches(Ia, Ib, fa, fb, random_selection(matches, 50));
figure,
[matches2, scores2] = vl_ubcmatch(da, db, 2.0);
subplot(3,1,1), show_matches(Ia,Ib,fa,fb,matches2), title('Threshold: 2.0');
[matches2, scores2] = vl_ubcmatch(da, db, 3.0);
subplot(3,1,2), show_matches(Ia,Ib,fa,fb,matches2), title('Threshold: 3.0');
[matches2, scores2] = vl_ubcmatch(da, db, 5.0);
subplot(3,1,3), show_matches(Ia,Ib,fa,fb,matches2), title('Threshold: 5.0');
%% linear model
d = fb(1:2,matches(2,:))-fa(1:2,matches(1,:));
p = mean(d,2);
figure, show_matches_linear_model(Ia,Ib,fa,fb,p);

%% Affine model
d = fb(1:2,matches(2,:))-fa(1:2,matches(1,:));
i = size(d, 2);
A = zeros(6,6);
b = zeros(6,1);
for j = 1:i,
    x = fa(1:2,matches(1,j));
    J = [x(1), x(2), 0, 0, 1, 0; 0, 0, x(1), x(2), 0, 1];
    A = A + J'*J;
    b = b + J'*d(1:2,j);
end
p = inv(A)*b;
figure, show_matches_affine_model(Ia,Ib,fa,fb,p);

%% awful result, affine model has too many degrees of freedom
% Now we only consider best matchings
%% best matches
N = 10;
[Y I] = sort(scores);
matches_sorted = matches(:,I);
figure, show_matches(Ia,Ib,fa,fb,matches_sorted(:,1:N));
% linear best matches
N = 10;
d = fb(1:2,matches_sorted(2,1:N))-fa(1:2,matches_sorted(1,1:N));
p = mean(d,2);
figure, show_matches_linear_model(Ia,Ib,fa,fb,p);

%% try to use the affine model
N = 10;
d = fb(1:2,matches_sorted(2,1:N))-fa(1:2,matches_sorted(1,1:N));
i = size(d,2);
A = zeros(6,6);
b = zeros(6,1);
for j = 1:i,
    x = fa(1:2,matches_sorted(1,j));
    J = [x(1),x(2),0,0,1,0; 0,0,x(1),x(2),0,1];
    A = A + J'*J;
    b = b + J'*d(1:2,j);
end
p = inv(A)*b;
figure, show_matches_affine_model(Ia,Ib,fa,fb,p);