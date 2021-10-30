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
T1 = [1, 0; 0, k1];
T2 = [k2, 0; 0, k2];
T3 = [1, k3; 0, 1];
T4 = [cosd(24), -sind(24); sind(24), cosd(24)];

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