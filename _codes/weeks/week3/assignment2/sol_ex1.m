function sol_ex1(idn)
[eqx, eqy, eqxx, eqyy, ttl] = ex1(idn);

fprintf("Student ID number: %d\n", idn);
fprintf("%s\n%s\n", eqxx, eqyy);

t = -pi:0.01:pi;
eval(eqx);
eval(eqy);

figure(idn);
plot(x, y, 'r');
title(ttl);
grid on;
end

function [eqx, eqy, eqx_, eqy_, ttl] = ex1(idn)
% MAS109 MATLAB assignment 2
% Input: Student ID number (an 8 digits number)
% Output: a message box
%
% Author: Seongeun Kim
%         mireiffe@kaist.ac.kr

rng(idn);
c1 = randi([0, 10], 3, 1);
rng(idn);
c2 = randi([30, 50], 2, 1);

stc1 = sort(c1);
stc2 = sort(c2);

ttl = sprintf("SIDN: %d\nx = %dsin^3(t)\ny = %dcos(t) - %dcos(2t) - %dcos(3t) - %dcos(4t)",...
    idn, stc2(2), stc2(1), stc1(3), stc1(2), stc1(1));


eqx_ = sprintf("x = %dsin^3(t)", stc2(2));
eqy_ = sprintf("y = %dcos(t) - %dcos(2t) - %dcos(3t) - %dcos(4t)", ...
    stc2(1), stc1(3), stc1(2), stc1(1));

eqx = sprintf("x = %d*sin(t).^3;", stc2(2));
eqy = sprintf("y = %d*cos(t) - %d*cos(2*t) - %d*cos(3*t) - %d*cos(4*t);", ...
    stc2(1), stc1(3), stc1(2), stc1(1));

end