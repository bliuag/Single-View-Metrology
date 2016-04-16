function updatePicture()
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
global picture;
global paraPointsx;
global paraPointsy;
global paraPointsz;
global dataType;
global origin;
global rpoints;
global hpoint;
global points;
pic=picture;
pictureHolder=findobj('Tag','pictureHolder');
axes(pictureHolder)
imshow(pic)
hold on
switch dataType
    case 1
        [n,~]=size(paraPointsx);
        for i=1:2:(n-1)
            p1=[paraPointsx(i,2),paraPointsx(i,1)];
            p2=[paraPointsx(i+1,2),paraPointsx(i+1,1)];
            plot([p1(2),p2(2)],[p1(1),p2(1)],'Color','r','LineWidth',2)
        end
        if mod(n,2)==1
            p=[paraPointsx(n,2),paraPointsx(n,1)];
            plot([p(2)-2,p(2)+2],[p(1)-2,p(1)+2],'Color','r','LineWidth',4)
        end
        
        [n,~]=size(paraPointsy);
        for i=1:2:(n-1)
            p1=[paraPointsy(i,2),paraPointsy(i,1)];
            p2=[paraPointsy(i+1,2),paraPointsy(i+1,1)];
            plot([p1(2),p2(2)],[p1(1),p2(1)],'Color','g','LineWidth',2)
        end
        if mod(n,2)==1
            p=[paraPointsy(n,2),paraPointsy(n,1)];
            plot([p(2)-2,p(2)+2],[p(1)-2,p(1)+2],'Color','g','LineWidth',4)
        end
        
        [n,~]=size(paraPointsz);
        for i=1:2:(n-1)
            p1=[paraPointsz(i,2),paraPointsz(i,1)];
            p2=[paraPointsz(i+1,2),paraPointsz(i+1,1)];
            plot([p1(2),p2(2)],[p1(1),p2(1)],'Color','b','LineWidth',2)
        end
        if mod(n,2)==1
            p=[paraPointsz(n,2),paraPointsz(n,1)];
            plot([p(2)-2,p(2)+2],[p(1)-2,p(1)+2],'Color','b','LineWidth',4)
        end
    case 2
        [n,~]=size(origin);
        if n~=0
            plot([origin(1)-2,origin(1)+2],[origin(2)-2,origin(2)+2],'Color','b','LineWidth',4)
        end
    case 3
        [n,~]=size(rpoints);
        for i=1:n
            plot([rpoints(i,1)-2,rpoints(i,1)+2],[rpoints(i,2)-2,rpoints(i,2)+2],'Color','b','LineWidth',4)
        end
    case 4
        [n,~]=size(hpoint);
        for i=1:n
            plot([hpoint(i,1)-2,hpoint(i,1)+2],[hpoint(i,2)-2,hpoint(i,2)+2],'Color','r','LineWidth',4)
        end
    case 5
        [n,~]=size(points);
        for i=1:n
            plot([points(i,1)-2,points(i,1)+2],[points(i,2)-2,points(i,2)+2],'Color','r','LineWidth',4)
        end
        if(n~=0)
%             position=points(:,1:2)-1;
%             value=1:n;
%             RGB=insertText(pic,position,value,'AnchorPoint','RightBottom');
%             imshow(RGB);
%             Add Comment C
            for i=1:n
                p=double(points(i,1)+10);
                q=double(points(i,2)+10);
                str=strcat('POINT',num2str(i));
                text(p,q,str);
            end
        end
end

axis off
axis image

end