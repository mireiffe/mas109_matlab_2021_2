function sol_ex2_2(idn)

[k1, k2, k3, k4] = ex2(idn);
% load image
img = imread(sprintf('For_%d.png', idn));
[m, n] = size(img);
[Y, X] = meshgrid(0:n-1, 0:m-1);



% representative matrices for each parameter
T1 = [1, 0; 0, k1];
T2 = [k2, 0; 0, k2];
T3 = [1, k3; 0, 1];
T4 = [cosd(k4), -sind(k4); sind(k4), cosd(k4)];

% for numerical computations
flatX = reshape(X, 1, []);
flatY = reshape(Y, 1, []);
flatXY = [flatY; flatX];

% applying each transformation
TXY = T4*T3*T2*T1*flatXY;
TY = reshape(TXY(1, :), m, []);
TX = reshape(TXY(2, :), m, []);

% visualiation
figure();
subplot(1, 2, 1);
surface(Y, X, img(end:-1:1, :), 'LineStyle', 'none');
colormap gray; axis tight;
title('Original image');
subplot(1, 2, 2);
surface(TY, TX, img(end:-1:1, :), 'LineStyle', 'none');
colormap gray; axis tight;
title('Result');
end


function [k1, k2, k3, k4] = ex2(idn)
% MAS109 MATLAB assignment 5
% Input: Student ID number (an 8 digits number)
% Output: a message box
%
% Author: Seongeun Kim
%         mireiffe@kaist.ac.kr

load DATA.mat
lst = ['C', 'I', 'P', 'S', 'T'];

rng(idn);
sel = randi([1, 5], 1, 1);
rng(idn);
ns = rand() * 0.04 + .01;
rng(idn);
k1 = rand()*(1.3 - 0.7) + 0.7;
rng(idn*2);
k2 = rand()*(1.3 - 0.7) + 0.7;
rng(idn*3);
k3 = rand()*(5 - 1) + 1;
kk3 = sign(rand() - .5);
rng(idn*4);
k4 = randi([-60, 60], 1, 1);

img = double(eval(lst(sel))) / 255;

noise = randn(size(img)) * ns;
res = noise + img;

% figure();
% imshow(res);
% title(sprintf('For %d.png', idn));

imwrite(res, sprintf('For_%d.png', idn));

params = sprintf("Parameters:");
sk1 = sprintf("k_1 = %.2f", k1);
sk2 = sprintf("k_2 = %.2f", k2);
sk3 = sprintf("k_3 = %.2f", kk3*k3);
sk4 = sprintf("k_4 = %d (degree)", k4);

fprintf("%s\n%s\n%s\n%s\n%s\n", params, sk1, sk2, sk3, sk4);

end