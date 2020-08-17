% Author: Bao Wenjie
% Date  : 2020-8-17
% Copyright Bao Wenjie
% Email : bwj_678@qq,com
% Introduction ţ�ٵ�����
% param: func: f(x)
% param: dfunc: f'(x)
% param: n: ����n��
% param x0: ��ֵ

function X = Newton_Method(func, dfunc, n, x0)
X = x0;
for i = 1:n
    df = dfunc(X);
    if df == 0
        X = inf;
        return;
    end
    X = X - func(X)/dfunc(X);
end
end