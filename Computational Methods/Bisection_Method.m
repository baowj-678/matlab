% Author: Bao Wenjie
% Date  : 2020-8-12
% Copyright Bao Wenjie
% Email : bwj_678@qq,com
% Introduction ���ַ��󷽳̵Ľ�
% param func: ����
% param l: ��˵�ֵ
% param r: �Ҷ˵�ֵ
% param e: ��ȷ��


function [x, n] = Bisection_Method(func, l, r, e)
l_ = func(l);
r_ = func(r);
if l_ * r_ > 0
    x = inf;
    return;
end

x = (r + l)/2;
mid_ = func(x);
n = 1;
while r - l > e
    if mid_*l_ < 0
        r = x;
    elseif mid_*r_ < 0
        l = x;
    else
        break
    end
    n = n + 1;
    x = (r + l)/2;
    mid_ = func(x);
end
end
