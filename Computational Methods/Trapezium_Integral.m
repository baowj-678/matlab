% Author: Bao Wenjie
% Date  : 2020-8-24
% Copyright Bao Wenjie
% Email : bwj_678@qq,com
% Introduction ���ι�ʽ�����
% param func: x=f(x)�ĺ���
% param a: ��������
% param b: ��������
% param h: �����С

function y = Trapezium_Integral(func, a, b, h)
x = a:h:b;
y = sum((func(x(1:end-1)) + func(x(2:end)))*h/2);
end