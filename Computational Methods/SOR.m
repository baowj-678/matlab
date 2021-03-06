% Author: Bao Wenjie
% Date  : 2020-8-12
% Copyright Bao Wenjie
% Email : bwj_678@qq,com
% Introduction 超松弛迭代法，条件B矩阵谱半径小于1
% param: A(n, n) 满足Ax=b
% param: b(n, 1)
% param: w 系数

function X = SOR(A, b, w)
% 获取矩阵形状
n = size(A);
n = n(1);
% 构造B矩阵
D = zeros(n);
for i = 1:1:n
    D(i, i) = A(i, i);
end
U = triu(A, 1);
L = tril(A, -1);
A = (D + w.*L)^(-1);
A_ = ((1 - w)*D - w*U);
B = A*A_;
% 构造f向量
f = w*A*b;
% 计算谱半径，判断是否收敛
if max(abs(eig(B))) >= 1
    X = inf;
    return;
end


% 迭代计算
X = zeros(n, 1);
for i = 1:1:100
    X = B*X + f;
end
end