% Author: Bao Wenjie
% Date  : 2020-8-17
% Copyright Bao Wenjie
% Email : bwj_678@qq,com
% Introduction �ҽط�
% param: func: f(x)
% param: n: ����n��
% param x0: ��ֵ
% param x1: ��ֵ

function X = Chord_Section_Method(func, n, x0, x1)
for i = 1:n
    df = func(x1) - func(x0);
    if df == 0
        return;
    end
    X = x1 - func(x1)*(x1 - x0)/df;
    x0 = x1;
    x1 = X;
end
end

