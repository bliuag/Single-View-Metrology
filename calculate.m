function calculate()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
global P;
global H;
global a_x;
global a_y;
global a_z;
global vz;
global vx;
global vy;
global origin;
%global vl;

disp('alpha:\n');
disp(a_x);
disp(a_y);
disp(a_z);

P=[a_x*vx, a_y*vy, a_z*vz, [origin,1]'];
disp('P:\n');
disp(P);
H=inv([P(:,1) P(:,2) P(:,4)]);

