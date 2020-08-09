% Author: Bao Wenjie
% Date  : 2020-8-9
% Copyright Bao Wenjie
% Email : bwj_678@qq,com
% Introduction ˳���˹��ȥ��
% param: A(n, m) ����Ax=b
% param: b(n, 1) ����Ax=b


function x = Sequential_Gaussian_Elimination(A, b)
size_ = size(A);
% n: ����
n = size_(1);
% m: ����
m = size_(2);
% ans
x = 0;

% �޽�
if(n < m)
    x = inf;
    return;
end
% ��Ԫ����
for i = 1:1:n-1
    % m: ������
    if(A(i, i) == 0)
        x = inf;
        break;
    end
    m_ = A(i + 1:n, i)/A(i, i);
    A(i + 1:n, i:m) = A(i + 1:n, i:m) - m_ .* A(i, i:m);
    b(i + 1:n) = b(i + 1:n) - m_ .* b(i);
end
% �ش�����
if x ~= inf
    x = zeros(1, m);
    x(m) = b(m) / A(m, m);
    for i = m-1:-1:1
        x(i) = (b(i) - sum(A(i, i+1:m).*x(i+1:m)))/A(i, i);
    end
end
end