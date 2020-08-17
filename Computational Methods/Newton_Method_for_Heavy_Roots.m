% Author: Bao Wenjie
% Date  : 2020-8-17
% Copyright Bao Wenjie
% Email : bwj_678@qq,com
% Introduction ţ�ٵ��������ظ�
% param: func: f(x)
% param: dfunc: f'(x)
% param: ddfunc: f''(x)
% param: n: ����n��
% param x0: ��ֵ

function X = Newton_Method_for_Heavy_Roots(func, dfunc, ddfunc, n, x0)
X = x0;
for i = 1:n
    df = dfunc(X);
    denominator = df^2 - func(X)*ddfunc(X);
    if df == 0
        return;
    end
    X = X - func(X)*df/denominator;
end
end