function updatePicture()
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
global picture;
pictureHolder=findobj('Tag','pictureHolder');
axes(pictureHolder)
imshow(picture)
axis off
axis image

end