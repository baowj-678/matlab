% Author: Bao Wenjie
% Date  : 2020-8-10
% Copyright Bao Wenjie
% Email : bwj_678@qq,com
% Introduction LU�ֽ�������Է�����
% param: A(n, m) ����Ax=b
% param: b(n, 1) ����Ax=b

function [X] = LU_Factorization_Linear(A, b)
% LU�ֽ�
[L, U] = LU_Factorization(A);
% ����޷�����LU�ֽ�
if L == inf
    X = inf;
    return;
end
% �õ�������״
n = size(A);
m = n(2);
n = n(1);

% ���Ly = b
y = zeros(n, 1);
y(1) = b(1);
for i = 2:1:n
    y(i) = b(i) - L(i, 1:i-1) * y(1:i-1);
end
% ��� Ux = y
X = zeros(n, 1);
X(n) = y(n) / U(n, n);
for i = n-1:-1:1
    X(i) = (y(i) - U(i, i+1:n)*X(i+1:n)) / U(i, i);
end
end