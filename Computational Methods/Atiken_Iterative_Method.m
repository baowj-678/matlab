% Author: Bao Wenjie
% Date  : 2020-8-12
% Copyright Bao Wenjie
% Email : bwj_678@qq,com
% Introduction Atiken��������������Է��̵Ľ�
% param func: x=f(x)�ĺ���
% param e: ��ȷ��
% param x0: ��ֵ


function [x, n] = Atiken_Iterative_Method(func, e, x0)
y = func(x0);
z = func(y);
n = 1;
tmp = z - 2*y + x0;
if tmp == 0
    x = x0;
    return;
end
x = x0 - (y - x0)^2/tmp;
while abs(x - x0) > e && n < 1000
    x0 = x;
    y = func(x0);
    z = func(y);
    tmp = z - 2*y + x0;
    if tmp == 0
        return;
    end
    x = x0 - (y - x0)^2/tmp;
    n = n + 1;
end
end