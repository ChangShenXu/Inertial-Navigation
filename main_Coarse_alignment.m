
% main()函数，用来处理分割数据，调用对准函数
% 注意：十个IMU_real数据文件 保存了十次测量结果，每一次测量时长均为300s
% 因此对准仿真时刻t 在300s以内
%误差在0.03°以内。

long = 40000;
t = 300;
n = long*10;
Wibb0 = ones(3,n);
Fibb0 = ones(3,n);
for ii= 1:10
    A = load (strcat('IMU_real',num2str(ii),'.mat'));
    Wibb0(:,long*(ii-1)+1:long*ii) = A.Wibb0(:,2:end);
    Fibb0(:,long*(ii-1)+1:long*ii) = A.Fibb0(:,2:end);
end
Sample = long/300*t;
Sample_Wibb0 = ones(3,Sample);
Sample_Fibb0 = ones(3,Sample);
count = long*10/Sample;
Psi = zeros(1,count);
Theta = zeros(1,count);
Gamma = zeros(1,count);
for jj = 1:count
    Sample_Wibb0 = Wibb0(:,Sample*(jj-1)+1:Sample*jj);
    Sample_Fibb0 = Fibb0(:,Sample*(jj-1)+1:Sample*jj);
    [Psi(jj),Theta(jj),Gamma(jj)] = Coarse_alignment(Sample_Wibb0,Sample_Fibb0,t);
end

subplot(3,1,1);
plot(Psi);
title('Psi(n),航向角');
subplot(3,1,2);
plot(Theta);
title('Theta(n)，俯仰角');
subplot(3,1,3);
plot(Gamma);
title('Gamma(n)，横滚角');

