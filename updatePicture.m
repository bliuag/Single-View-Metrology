function updatePicture()
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
global picture;
global paraLinesx;
global paraLinesy;
global paraLinesz;
global dataType;
global origin;
pic=picture;
pictureHolder=findobj('Tag','pictureHolder');
axes(pictureHolder)
imshow(pic)
hold on
switch dataType
    case 1
        [n,~]=size(paraLinesx);
        for i=1:2:(n-1)
            p1=[paraLinesx(i,2),paraLinesx(i,1)];
            p2=[paraLinesx(i+1,2),paraLinesx(i+1,1)];
            plot([p1(2),p2(2)],[p1(1),p2(1)],'Color','r','LineWidth',2)
        end
        if mod(n,2)==1
            p=[paraLinesx(n,2),paraLinesx(n,1)];
            plot([p(2)-2,p(2)+2],[p(1)-2,p(1)+2],'Color','r','LineWidth',4)
        end
        
        [n,~]=size(paraLinesy);
        for i=1:2:(n-1)
            p1=[paraLinesy(i,2),paraLinesy(i,1)];
            p2=[paraLinesy(i+1,2),paraLinesy(i+1,1)];
            plot([p1(2),p2(2)],[p1(1),p2(1)],'Color','g','LineWidth',2)
        end
        if mod(n,2)==1
            p=[paraLinesy(n,2),paraLinesy(n,1)];
            plot([p(2)-2,p(2)+2],[p(1)-2,p(1)+2],'Color','g','LineWidth',4)
        end
        
        [n,~]=size(paraLinesz);
        for i=1:2:(n-1)
            p1=[paraLinesz(i,2),paraLinesz(i,1)];
            p2=[paraLinesz(i+1,2),paraLinesz(i+1,1)];
            plot([p1(2),p2(2)],[p1(1),p2(1)],'Color','b','LineWidth',2)
        end
        if mod(n,2)==1
            p=[paraLinesz(n,2),paraLinesz(n,1)];
            plot([p(2)-2,p(2)+2],[p(1)-2,p(1)+2],'Color','b','LineWidth',4)
        end
    case 2
        [n,~]=size(origin);
        if n~=0
            plot([origin(1)-2,origin(1)+2],[origin(2)-2,origin(2)+2],'Color','b','LineWidth',4)
        end
            
end

axis off
axis image

end