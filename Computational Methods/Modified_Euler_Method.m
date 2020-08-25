% Author: Bao Wenjie
% Date  : 2020-8-25
% Copyright Bao Wenjie
% Email : bwj_678@qq,com
% Introduction �Ľ�ŷ������ⳣ΢�ַ���
% param func: dy/dx = f(x, y)�ĺ���
% param y0: ��ʼֵ
% param x0: ��ʼֵ
% param h: ����
% parma x0: ������

function y = Modified_Euler_Method(func, y0, x0, h, xn)
for i=x0+h:h:xn
    yp = y0 + h*func(x0, y0);
    yc = y0 + h*func(x0 + h, yp);
    y0 = (yp + yc)/2;
end
y = y0;
end