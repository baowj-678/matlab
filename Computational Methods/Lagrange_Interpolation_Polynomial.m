% Author: Bao Wenjie
% Date  : 2020-8-17
% Copyright Bao Wenjie
% Email : bwj_678@qq,com
% Introduction Lagrange��ֵ�㷨

% param x: ��ֵ��(m, 1)
% param y: ��ֵ��(m, 1)
% param X: ��ֵ��(n, 1)


function Y = Lagrange_Interpolation_Polynomial(x, y, X)
n = size(X);
m = size(x);
n = n(1);
m = m(1);
Y = zeros(n, 1);
for j = 1:m
    tmp_ = y(j);
    for k = 1:m
        if j ~= k
            tmp_ = tmp_ .* (X - x(k)) ./ (x(j) - x(k));
        end
    end
    Y = Y + tmp_;
end
end