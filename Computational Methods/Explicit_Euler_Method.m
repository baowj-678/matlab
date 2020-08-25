% Author: Bao Wenjie
% Date  : 2020-8-25
% Copyright Bao Wenjie
% Email : bwj_678@qq,com
% Introduction ��ʽŷ������ⳣ΢�ַ���
% param func: dy/dx = f(x, y)�ĺ���
% param y0: ��ʼֵ
% param x0: ��ʼֵ
% param h: ����
% parma x0: ������

function y = Explicit_Euler_Method(func, x0, y0, h, xn)
for i=x0+h:h:xn
    y0 = y0 + func(x0, y0);
    x0 = x0 + h;
end
end