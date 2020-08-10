% Author: Bao Wenjie
% Date  : 2020-8-9
% Copyright Bao Wenjie
% Email : bwj_678@qq,com
% Introduction Cholesky�ֽ�
% param: A(n, n) ����Ax=b
% param: b(n, 1)

function G=Cholesky(A)
% �õ�������״
n = size(A);
n = n(1);
% ��ʼ��
G = zeros(n, n);
% ����
for j = 1:1:n
    G(j, j) = (A(j, j) - sum(G(j, 1:j-1).^2))^0.5;
    if G(j, j) == 0
        G = inf;
        return;
    end
    G(j+1:n, j) = (A(j+1:n, j) - G(j+1:n, 1:j-1)*G(j, 1:j-1)') / G(j, j);
end
end
