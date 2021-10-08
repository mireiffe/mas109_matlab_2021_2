function MAS109_assign5_ex2(idn)
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
k3 = rand()*(1.3 - 0.7) + 0.7;
rng(idn*4);
k4 = rand()*(1.3 - 0.7) + 0.7;

img = eval(lst(sel));
res = imnoise(img, 'gaussian', ns);

figure();
imshow(res);
title(sprintf('For %d.png', idn));

imwrite(res, sprintf('For_%d.png', idn));

submat = sprintf("\\fontsize{15} Submatrix:");
rows = sprintf("\\fontsize{15}          Rows : %d < r < %d", rc1(1), rc2(1));
cols = sprintf("\\fontsize{15}         Columns : %d < c < %d", rc1(2), rc2(2));


end