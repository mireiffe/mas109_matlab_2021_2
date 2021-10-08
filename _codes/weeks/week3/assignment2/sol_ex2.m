function sol_ex2(idn)

eq = ex2(idn);
ttl = mkttl(idn);

fprintf("Student ID number: %d\n", idn);
fprintf("%s\n", eq)

xx = -1:0.1:1;
yy = -1:0.1:1;
[x, y] = meshgrid(xx, yy);

eval(eq);

figure(idn);
mesh(x, y, z);
title(ttl);
grid on;

end

function eqq_ = ex2(idn)
% MAS109 MATLAB assignment 2
% Input: Student ID number (an 8 digits number)
% Output: a message box
%
% Author: Seongeun Kim
%         mireiffe@kaist.ac.kr

rng(idn);
c = randi([-3, 3], 3, 1);
rng(idn);
p = randi([1, 3], 4, 1);
rng(idn);
r = randi([2, 7], 2, 1) .* sign(rand(2, 1) - .5);
rng(idn);
xy = randi([1, 3], 2, 1);
fs = {'cos', 'sin', 'exp'};
ps = {'x', 'y', 'x.*y'};

t = cell(3, 1);
i = 1;
if c(i) == 0
    t{i} = '';
elseif c(i) == 1
    t{i} = sprintf("%s(%d*%s).^%d", fs{i}, r(i), ps{xy(i)}, p(i));
elseif c(i) == -1
    t{i} = sprintf("- %s(%d*%s).^%d", fs{i}, r(i), ps{xy(i)}, p(i));
else
    t{i} = sprintf("%+d*%s(%d*%s).^%d", c(i), fs{i}, r(i), ps{xy(i)}, p(i));
end

i = 2;
if c(i) == 0
    t{i} = '';
elseif c(i) == 1
    t{i} = sprintf("+ %s(%d*%s).^%d", fs{i}, r(i), ps{xy(i)}, p(i));
elseif c(i) == -1
    t{i} = sprintf("- %s(%d*%s).^%d", fs{i}, r(i), ps{xy(i)}, p(i));
else
    t{i} = sprintf("%+d*%s(%d*%s).^%d", c(i), fs{i}, r(i), ps{xy(i)}, p(i));
end


if c(3) == 0
    t{3} = '';
elseif c(3) == 1
    t{3} = sprintf("+ %s(-x.^%d-y.^%d)", fs{3}, p(3), p(4));
elseif c(3) == -1
    t{3} = sprintf("- %s(-x.^%d-y.^%d)", fs{3}, p(3), p(4));
else
    t{3} = sprintf("%+d*%s(-x.^%d-y.^%d)", c(3), fs{3}, p(3), p(4));
end

eq_ = sprintf("z = %s%s%s;", t{1}, t{2}, t{3});

if sum(abs(c)) == 0
    eqq_ = sprintf("z = -2 * cos(4*x.*y) + sin(y) + exp(-x.^2-y.^2);");
else
    eqq_ = eq_;
    
end
end

function ttl = mkttl(idn)
% MAS109 MATLAB assignment 2
% Input: Student ID number (an 8 digits number)
% Output: a message box
%
% Author: Seongeun Kim
%         mireiffe@kaist.ac.kr

rng(idn);
c = randi([-3, 3], 3, 1);
rng(idn);
p = randi([1, 3], 4, 1);
rng(idn);
r = randi([2, 7], 2, 1) .* sign(rand(2, 1) - .5);
rng(idn);
xy = randi([1, 3], 2, 1);
fs = {'cos', 'sin', 'e'};
ps = {'x', 'y', 'xy'};

t = cell(3, 1);
i = 1;
if c(i) == 0
    t{i} = '';
elseif c(i) == 1
    t{i} = sprintf("%s^%d(%d%s)", fs{i}, p(i), r(i), ps{xy(i)});
elseif c(i) == -1
    t{i} = sprintf("- %s^%d(%d%s)", fs{i}, p(i), r(i), ps{xy(i)});
else
    t{i} = sprintf("%+d%s^%d(%d%s)", c(i), fs{i}, p(i), r(i), ps{xy(i)});
end

i = 2;
if c(i) == 0
    t{i} = '';
elseif c(i) == 1
    t{i} = sprintf("+ %s^%d(%d%s)", fs{i}, p(i), r(i), ps{xy(i)});
elseif c(i) == -1
    t{i} = sprintf("- %s^%d(%d%s)", fs{i}, p(i), r(i), ps{xy(i)});
else
    t{i} = sprintf("%+d%s^%d(%d%s)", c(i), fs{i}, p(i), r(i), ps{xy(i)});
end


if c(3) == 0
    t{3} = '';
elseif c(3) == 1
    t{3} = sprintf("+ %s^{(-x^%d-y^%d)}", fs{3}, p(3), p(4));
elseif c(3) == -1
    t{3} = sprintf("- %s^{(-x^%d-y^%d)}", fs{3}, p(3), p(4));
else
    t{3} = sprintf("%+d%s^{(-x^%d-y^%d)}", c(3), fs{3}, p(3), p(4));
end

eq_ = sprintf("SIDN: %d\nz = %s %s %s", idn, t{1}, t{2}, t{3});

if sum(abs(c)) == 0
    
    ttl = sprintf("SIDN: %d\nz = -2cos(4xy) + sin(y) + e^{(-x^2 -y^2)}", idn);
    
else
    ttl = eq_;
end
end