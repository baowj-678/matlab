% @Title: ģ���˻��㷨���TSP����
% @Author: Bao Wenjie
% @Email: bwj_678@qq.com
% @Date: 2020/9/3

function distance = SA_TSP(X, q)
%% 1.����������
D = Distance(X); % ����������
N = size(D,1);   % ���еĸ���

%% 2.��ʼ������
T0 = 1e10;     % ��ʼ�¶�
Tend = 1e-30;  % ��ֹ�¶�
L = 2;         % ���¶��µĵ�������
% q = 0.9;       % ��������
               % ��������Ĵ���
Time = ceil(double(solve([num2str(T0), '*', num2str(q), '^x =', num2str(Tend)])));
count = 0;              %��������
Obj = zeros(Time,1);    %Ŀ��ֵ�����ʼ��
track = zeros(Time,N);  %ÿ��������·�߾����ʼ��


%% 3.�������һ����ʼ·��
S1 = randperm(N);
DrawPath(S1,X)
disp('��ʼ��Ⱥ�е�һ�����ֵ:')
OutputPath(S1);
Rlength = PathLength(D,S1);
disp(['�ܾ��룺',num2str(Rlength)]);

%% 4.�����Ż�
 
while T0 > Tend
    count = count + 1;  %���µ�������
	% 1. �����½�
    S2 = NewAnswer(S1);
    % 2.Metropolis�����ж��Ƿ�����½�
    [S1,R] = Metropolis(S1,S2,D,T0); % Metropolis �����㷨
    % 3.��¼ÿ�ε������̵�����·��
    if count == 1 || R < Obj(count - 1)
        Obj(count) = R; % �����ǰ�¶�������·��С����һ·�����¼��ǰ·��
    else
        Obj(count) = Obj(count - 1);%�����ǰ�¶�������·�̴�����һ·�����¼��һ·��
    end
    track(count, :) = S1;
    T0 = q * T0; %����
 
end
 
%% 5.�Ż����̵���ͼ
figure
plot(1:count,Obj)
xlabel('��������')
ylabel('����')
title('�Ż�����')

%% 6.��������·��ͼ
DrawPath(track(end,:), X)

%% 7.������Ž��·�ߺ��ܾ���
disp('���Ž�:')
S = track(end,:);
p = OutputPath(S);
disp(['�ܾ��룺',num2str(PathLength(D,S))]);

distance = p;
end

%%%%%%%%%%%%%%%%%%% Distance����%%%%%%%%%%%%%%%%%%%%
function D = Distance(citys)
%% ������������֮��ľ���
% ���� citys? �����е�λ������
% ��� D?��������֮��ľ���
n = size(citys,1);
D = zeros(n,n);
for i = 1:n
    for j =i+1:n
        D(i, j) = sqrt(sum((citys(i,:) - citys(j,:)).^2));
        D(j, i) = D(i,j);
    end
end
end

%%%%%%%%%%%%%%%%%%% DrawPath����%%%%%%%%%%%%%%%%%%%%
function DrawPath(Route,citys)
%% ��·������
%����
% Route? ����·��??
% citys? ����������λ��
figure
plot([citys(Route,1);citys(Route(1),1)],...
[citys(Route,2);citys(Route(1),2)],'o-');
grid on
for i = 1:size(citys,1)
    text(citys(i,1),citys(i,2),['    ', num2str(i)]);
end
text(citys(Route(1),1),citys(Route(1),2),'       ���');
text(citys(Route(end),1),citys(Route(end),2), '       �յ�');
end


%%%%%%%%%%%%%%%%%%% Metropolis����%%%%%%%%%%%%%%%%%%%%
function [S,R] = Metropolis(S1,S2,D,T)
%% ����
% S1��?��ǰ��
% S2:   �½�
% D:??��������������е�֮��ľ��룩
% T:??��ǰ�¶�
%% ���
% S��??��һ����ǰ��
% R��??��һ����ǰ���·�߾���

R1 = PathLength(D,S1); %���㵱ǰ·�߳���
N = length(S1); %�õ����еĸ���
R2 = PathLength(D,S2); %�����½�·�߳���
dC = R2 - R1; %��������֮��
if dC < 0  %����������� ������·��
    S = S2;
    R = R2;
elseif exp(-dC/T) >= rand % ��exp(-dC/T)���ʽ�����·��
    S = S2;
    R = R2;
else % ��������·��
    S = S1;
    R = R1;
end
end

%%%%%%%%%%%%%%%%%%% NewAnswer����%%%%%%%%%%%%%%%%%%%%
function S2 = NewAnswer(S1)
%% ����
% S1:��ǰ��
%% ���
% S2���½�
N = length(S1);
S2 = S1;
a = round(rand(1,2)*(N-1)+1); %�����������λ�� ��������
W = S2(a(1));
S2(a(1)) = S2(a(2));
S2(a(2)) = W; %�õ�һ����·��
end


%%%%%%%%%%%%%%%%%%% OutputPath����%%%%%%%%%%%%%%%%%%%%
function p = OutputPath(R)
%% ���·������ 
% ���룺R ·��
R = [R,R(1)];
N = length(R);
p = num2str(R(1));
for i = 2:N
    p = [p,'��>',num2str(R(i))];
end
disp(p)
end
 
 
%%%%%%%%%%%%%%%%%%% PathLength����%%%%%%%%%%%%%%%%%%%%
function Length = PathLength(D,Route)
%% ����������·������
% ���룺
% D?��������֮��ľ���
% Route ����Ĺ켣
 
Length = 0; 
n = size(Route, 2);
for i = 1:(n - 1)
        Length = Length + D(Route(i), Route(i + 1));
end
Length = Length + D(Route(n), Route(1));
end