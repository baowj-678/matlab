% Author: Bao Wenjie
% Date  : 2020-8-12
% Copyright Bao Wenjie
% Email : bwj_678@qq,com
% Introduction �򵥵�������������Է��̵Ľ�
% param func: x=f(x)�ĺ���
% param e: ��ȷ��
% param x0: ��ֵ


function [x, n] = Simple_Iterative_Method(func, e, x0)
n = 1;
x = func(x0);
while abs(x0 - x) > e && n < 1000
    x0 = x;
    x = func(x);
    n = n + 1;
end
end