% load image
img = imread('For_20219999.png');
[m, n] = size(img);
[Y, X] = meshgrid(0:n-1, 0:m-1);

% given parameters
k1 = 1.21;
k2 = 0.96;
k3 = -3.65;
k4 = 24;

% representative matrices for each parameter
% for simplicity, we can use 'cell' which is a
% structure independent of data type.
T{1} = [1, 0; 0, k1];
T{2} = [k2, 0; 0, k2];
T{3} = [1, k3; 0, 1];
T{4} = [cosd(24), -sind(24); sind(24), cosd(24)];

% for numerical computations
flatX = reshape(X, 1, []);
flatY = reshape(Y, 1, []);
flatXY = [flatY; flatX];

% applying each transformation
for i = 1:4
    TXY{i} = T{i} * flatXY;
    TY{i} = reshape(TXY{i}(1, :), m, []);
    TX{i} = reshape(TXY{i}(2, :), m, []);
end

% visualiation
figure();
subplot(2, 3, [1, 4]);
surface(Y, X, img(end:-1:1, :), 'LineStyle', 'none');
colormap gray; axis tight;
title('original image');

subplst = [2, 3, 5, 6];
for i = 1:4
    subplot(2, 3, subplst(i));
    surface(TY{i}, TX{i}, img(end:-1:1, :), 'LineStyle', 'none');
    colormap gray; axis tight;
    title(sprintf('T%d', i));
end