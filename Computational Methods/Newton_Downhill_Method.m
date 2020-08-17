% Author: Bao Wenjie
% Date  : 2020-8-17
% Copyright Bao Wenjie
% Email : bwj_678@qq,com
% Introduction ţ����ɽ��
% param: func: f(x)
% param: dfunc: f'(x)
% param: n: ����n��
% param x0: ��ֵ
% param lambda: ��ɽ����

function X = Newton_Downhill_Method(func, dfunc, n, x0, lambda)
X = x0;
for i = 1:n
    df = dfunc(X);
    if df == 0
        return;
    end
    X = X - lambda*func(X)/dfunc(X);
end
end