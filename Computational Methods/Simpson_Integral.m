% Author: Bao Wenjie
% Date  : 2020-8-24
% Copyright Bao Wenjie
% Email : bwj_678@qq,com
% Introduction ��������ɭ��ʽ�����
% param func: x=f(x)�ĺ���
% param a: ��������
% param b: ��������
% param n: �ȷ��������

function y = Simpson_Integral(func, a, b, n)
h = (b - a)/n;
x1 = a + h/2:h:b;
x2 = a + h:h:b - h/2;
y = h/6*(func(a) + 4*sum(func(x1)) + 2*sum(func(x2)) + f(b));
end