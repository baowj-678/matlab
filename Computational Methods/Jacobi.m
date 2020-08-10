% Author: Bao Wenjie
% Date  : 2020-8-10
% Copyright Bao Wenjie
% Email : bwj_678@qq,com
% Introduction �ſɱȵ�����������Է�����
% param: A(n, n) ����Ax=b
% param: b(n, 1)


function X = Jacobi(A, b)
% ��ȡ������״
n = size(A);
n = n(1);
% ����B����
D = zeros(n);
D_ = zeros(n);
for i = 1:1:n
    if A(i, i) == 0
        X = inf;
        return;
    end
    D_(i, i) = 1/A(i, i);
    D(i, i) = A(i, i);
end
B = D_*(D - A);
% �����װ뾶���ж��Ƿ�����
if max(abs(eig(B))) >= 1
    X = inf;
    return;
end
% ����f����
f = D_*b;

% ��������
X = zeros(n, 1);
for i = 1:1:100
    X = B*X + f;
end
end