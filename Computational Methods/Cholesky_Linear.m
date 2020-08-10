% Author: Bao Wenjie
% Date  : 2020-8-9
% Copyright Bao Wenjie
% Email : bwj_678@qq,com
% Introduction ƽ������������:AΪ�Գ���������
% param: A(n, n) ����Ax=b
% param: b(n, 1)

function X=Cholesky_Linear(A, b)
% ����Cholesky�ֽ�
G = Cholesky(A);
% �Ƿ��н�
if G == inf
    X = inf;
    return;
end
% ��ȡ������״
n = size(A);
n = n(1);
% Ly = b
y = zeros(n, 1);
for i=1:1:n
    y(i) = (b(i) - G(i, 1:i-1)*y(1:i-1))/G(i, i);
end
% L^TX = y
X = zeros(n, 1);
for i = n:-1:1
    X(i) = (y(i) - X(i+1:n)'* G(i+1:n, i))/G(i, i);
end
end