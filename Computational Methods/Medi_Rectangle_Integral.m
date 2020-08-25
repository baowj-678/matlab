% Author: Bao Wenjie
% Date  : 2020-8-12
% Copyright Bao Wenjie
% Email : bwj_678@qq,com
% Introduction ���ι�ʽ�����
% param func: x=f(x)�ĺ���
% param a: ��������
% param b: ��������
% param h: �����С

function y = Medi_Rectangle_Integral(func, a, b, h)
x = a+h/2:h:b;
y = sum(func(x(1:end-1))*h);
end