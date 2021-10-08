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
k3 = rand()*(5 - 1) + 1;
kk3 = sign(rand() - .5);
rng(idn*4);
k4 = randi([-60, 60], 1, 1);

img = eval(lst(sel));
res = imnoise(img, 'gaussian', ns);

% figure();
% imshow(res);
% title(sprintf('For %d.png', idn));

imwrite(res, sprintf('For_%d.png', idn));

params = sprintf("\\fontsize{15} Parameters:");
sk1 = sprintf("\\fontsize{15} k_1 = %.2f", k1);
sk2 = sprintf("\\fontsize{15} k_2 = %.2f", k2);
sk3 = sprintf("\\fontsize{15} k_3 = %.2f", kk3*k3);
sk4 = sprintf("\\fontsize{15} k_4 = %d (degree)", k4);

try
    CreateStruct.Interpreter = 'tex';
    CreateStruct.WindowStyle = 'non-modal';
    msgbox({params; sk1; sk2; sk3; sk4},'Assignment5, Exercise2', CreateStruct);
catch
    fprintf("%s\n%s\n%s\n%s\n%s", params, sk1, sk2, sk3, sk4);
end
end