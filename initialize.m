function initialize()
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
global cursor;
cursor=rand(1,2);
global picture;
picture=imread('image.jpg');
global dataType;
dataType=1;
global paraPointsx;
global paraPointsy;
global paraPointsz;
global paraLinesx;
global paraLinesy;
global paraLinesz;
paraPointsx=int64(rand(0,2));
paraPointsy=int64(rand(0,2));
paraPointsz=int64(rand(0,2));
paraLinesx=rand(0,3);
paraLinesy=rand(0,3);
paraLinesz=rand(0,3);
global direction;
direction='x';
global origin;
origin=int64(rand(0,2));
global vx;
global vy;
global vz;
global vl;
vx=double([0 0 0]);
vy=double([0 0 0]);
vz=double([0 0 0]);
vl=double([0 0 0]);
global afa;
afa=0;
global rpoints;
rpoints=rand(3,5);
global hpoint;
hpoint=rand(0,5);
global H;
H=double(rand(3,3));
global points;
points=double(rand(0,5));
global setPlanes;
setPlanes=rand(0,4);
global transformH;
transformH=rand(0,9);
global textureOrigins;
textureOrigins=rand(0,2);
end

