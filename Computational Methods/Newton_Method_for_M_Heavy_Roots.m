% Author: Bao Wenjie
% Date  : 2020-8-17
% Copyright Bao Wenjie
% Email : bwj_678@qq,com
% Introduction ţ�ٵ�������m�ظ�
% param: func: f(x)
% param: dfunc: f'(x)
% param: n: ����n��
% param x0: ��ֵ

function X = Newton_Method_for_M_Heavy_Roots(func, dfunc, n, x0, m)
X = x0;
for i = 1:n
    df = dfunc(X);
    if df == 0
        return;
    end
    X = X - m*func(X)/df;
end
end