function initialize()
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
global picture;
picture=imread('image.jpg');
global dataType;
dataType=1;
global paraLinesx;
global paraLinesy;
global paraLinesz;
paraLinesx=int64(rand(0,2));
paraLinesy=int64(rand(0,2));
paraLinesz=int64(rand(0,2));
global direction;
direction='x';
global origin;
origin=int64(rand(0,2));

end

