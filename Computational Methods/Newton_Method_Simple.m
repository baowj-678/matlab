% Author: Bao Wenjie
% Date  : 2020-8-17
% Copyright Bao Wenjie
% Email : bwj_678@qq,com
% Introduction ��ţ�ٵ�����
% param: func: f(x)
% param: dfunc: f'(x0)
% param: n: ����n��
% param: x0: ��ֵ

function X = Newton_Method_Simple(func, c, n, x0)
if c == 0
    X = inf;
    return;
end
X = x0;
for i = 1:n
    X = X - func(X)/c;
end
end