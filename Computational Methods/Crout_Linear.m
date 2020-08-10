% Author: Bao Wenjie
% Date  : 2020-8-10
% Copyright Bao Wenjie
% Email : bwj_678@qq,com
% Introduction ׷�Ϸ�
% param: A(1, n-1) �¶Խ�
% param: B(1, n) �Խ�
% param: C(1, n-1) �϶Խ�

function X = Crout_Linear(A, B, C, b)
% ��ȡ������״
n = size(B);
n = n(2);
% Crout�ֽ�
[alpha, beta, gamma] = Crout(A, B, C);
if alpha == inf
    X = inf;
    return
end
% Ly = b
y = zeros(n, 1);
y(1) = b(1) / alpha(1);
for i = 2:1:n
    y(i) = (b(i) - gamma(i-1)*y(i-1))/alpha(i);
end
alpha
y
% Ux = y
X = zeros(n, 1);
X(n) = y(n);
for i = n-1:-1:1
    X(i) = y(i) - beta(i)*X(i+1);
end
end
