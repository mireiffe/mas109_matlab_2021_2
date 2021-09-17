function MAS109_assign2_ex2(idn)
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

eq_ = sprintf("ID number: %d\n Your equation: z = %s %s %s", idn, t{1}, t{2}, t{3});

eq = sprintf("\\fontsize{15} %s", eq_);

if sum(abs(c)) == 0
    try
        eqq_ = sprintf("ID number: %d\n Your equation: z = -2cos(4xy) + sin(y) + e^{(-x^2 -y^2)}", idn);
%         eqq_ = 'z = -2cos(4xy) + sin(y) + e^{(-x^2 -y^2)}';
        eqq = sprintf("\\fontsize{15} %s", eqq_);
        CreateStruct.Interpreter = 'tex';
        CreateStruct.WindowStyle = 'non-modal';
        msgbox(eqq,'Assignment2, Exercise2', CreateStruct);
    catch
        fprintf("%s\n", eqq_);
    end
else
    try
        CreateStruct.Interpreter = 'tex';
        CreateStruct.WindowStyle = 'non-modal';
        msgbox(eq,'Assignment2, Exercise2', CreateStruct);
    catch
        fprintf("%s\n", eq_);
    end
end
end