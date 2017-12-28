function C_eg = Geography_axes(lamda,L)
% GEOGRAPHY_AXES 给出经纬度，求解地球坐标系到地理坐标系的坐标变换矩阵
% lamda 经度  !!要求均为弧度 Radian
% L 纬度
% C_eg 坐标变换阵

% 2017-12-27 徐长申 编(P198)

C_e1 = [cos(lamda) sin(lamda) 0; -sin(lamda) cos(lamda) 0; 0 0 1];
C_12 = [cos(pi/2-L) 0 -sin(pi/2-L); 0 1 0; sin(pi/2-L) 0 cos(pi/2-L)];
C_2g = [0 1 0; -1 0 0; 0 0 1];
C_eg = C_2g*C_12*C_e1;

