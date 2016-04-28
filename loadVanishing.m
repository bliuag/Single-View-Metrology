function [ output_args ] = loadVanishing( input_args )
%LOADVANISHINGPOINTS Summary of this function goes here
%   Detailed explanation goes here



FilterSpec='.txt';
[FileName,PathName,FilterIndex] = uigetfile(FilterSpec);
file=fullfile(PathName,FileName);
fid = fopen(file,'r');



global vx;
global vy;
global vz;
global vl;
formatSpec='%f';
A = fscanf(fid,formatSpec);
disp(size(A));
vx=A(1:3);
vy=A(4:6);
vz=A(7:9);
vl=A(10:12);
disp(vx);
disp(vy);
disp(vz);
disp(vl);
fclose(fid);
end

