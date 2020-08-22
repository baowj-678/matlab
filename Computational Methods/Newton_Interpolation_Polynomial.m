% Author: Bao Wenjie
% Date  : 2020-8-22
% Copyright Bao Wenjie
% Email : bwj_678@qq,com
% Introduction ţ�ٲ�ֵ����ʽ
% param:
%       x: (n, 1) �Ա���
%       y: (n, 1) �����
%       Y_last: n_last����Y��ֵ
%       X: ��ֵ��(n, 1)
%       X_last: (x-x1)(x-x1)...(x-xlast)
%       n_last: �����̵Ľ���,(0)�����ͷ��ʼ
%       n: Ŀ���ֵ����
% return:
%        Y: ���
%        y_next: n�ײ��̵�ֵ
%        X_next: (x-x1)(x-x2)...(x-xn)

function [Y, y_next, X_next] = Newton_Interpolation_Polynomial(x, y, Y_last, X, X_last, n_last, n)
% ��ͷ��ʼ
if n_last == 0
    Y_last = ones(size(X)).*y(1);
    X_last = ones(size(X));
end
for i = n_last + 1:n
    % ����i�ײ���
    y = (y(2:end) - y(1:end-1))./(x(1+i:end) - x(1:end-i));
    % ����(x-x1)(x-x2)...(x-xi)
    X_last = X_last.*(X - x(i));
    % ����Y��
    Y = Y_last + y(1).*X_last;
end
y_next = y;
X_next = X_last;
end