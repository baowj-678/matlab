% Author: Bao Wenjie
% Date  : 2020-8-12
% Copyright Bao Wenjie
% Email : bwj_678@qq,com
% Introduction ���ɳڵ�����������B�����װ뾶С��1
% param: A(n, n) ����Ax=b
% param: b(n, 1)
% param: w ϵ��

function X = SOR(A, b, w)
% ��ȡ������״
n = size(A);
n = n(1);
% ����B����
D = zeros(n);
for i = 1:1:n
    D(i, i) = A(i, i);
end
U = triu(A, 1);
L = tril(A, -1);
A = (D + w.*L)^(-1);
A_ = ((1 - w)*D - w*U);
B = A*A_;
% ����f����
f = w*A*b;
% �����װ뾶���ж��Ƿ�����
if max(abs(eig(B))) >= 1
    X = inf;
    return;
end


% ��������
X = zeros(n, 1);
for i = 1:1:100
    X = B*X + f;
end
end