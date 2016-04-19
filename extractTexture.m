function extractTexture()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
global setPlanes;
global points;
global picture;
[n,~]=size(setPlanes);
global basex;
global basey;
global basez;
global textureOrigins;
textureOrigins=rand(0,2);
basex=max(max(points(setPlanes(:,:),3)));
basey=max(max(points(setPlanes(:,:),4)));
basez=max(max(points(setPlanes(:,:),5)));
for t=1:n
    
    tempp=points(setPlanes(t,:),:);
    p=double(rand(4,4));
    p(:,1:2)=double(tempp(:,1:2));
    rp=double(tempp(:,3:5));
    p(1,3:4)=0;
    p(2,3)=norm(rp(2,:)-rp(1,:));
    p(2,4)=0;
    disp('p(2,:)');
    disp(p(2,:));
    
    p(3,3)=dot(rp(3,:)-rp(1,:),rp(2,:)-rp(1,:))./norm(rp(2,:)-rp(1,:));
    p(3,4)=sqrt( (norm(rp(3,:)-rp(1,:)))^2 - (p(3,3))^2 );
    p(4,3)=dot(rp(4,:)-rp(1,:),rp(2,:)-rp(1,:))./norm(rp(2,:)-rp(1,:));
    p(4,4)=sqrt( (norm(rp(4,:)-rp(1,:)))^2 - (p(4,3))^2 );
    A = rand(0,9);
    for i=1:4
       B=rand(2,9);
       B(1,1)=p(i,1);
       B(1,2)=p(i,2);
       B(1,3)=1;
       B(1,4:6)=zeros(1,3);
       B(1,7)=-p(i,3)*p(i,1);
       B(1,8)=-p(i,3)*p(i,2);
       B(1,9)=-p(i,3);
       B(2,1:3)=zeros(1,3);
       B(2,4:5)=p(i,1:2);
       B(2,6)=1;
       B(2,7)=-p(i,4)*p(i,1);
       B(2,8)=-p(i,4)*p(i,2);
       B(2,9)=-p(i,4);
       A=[A;B];
    end
    disp('A=');
    disp(A);
    C=A'*A;
    
    [V,D]=eig(C);
 
    mi=double(D(1,1)); minn=1;
    for i=2:size(D,1)
        if (D(i,i)<mi)
            mi=D(i,i); minn=i;
        end
    end
    h=V(:,minn);
    equ2=[p(2,1),p(2,2),1,0,0,]
    disp(A*h);
    HH=reshape(h,[3,3]);
    HH(1:2,3)=0;
    HH=HH./HH(3,3);
    disp('HH*p(3,:): ')
    disp([p(2,1),p(2,2),1]*HH);
    
    left=min(p(:,1));
    right=max(p(:,1));
    bottom=min(p(:,2));
    top=max(p(:,2));
    disp([left;right;bottom;top]);
    
    q1=[left,bottom,1.0]*HH;
    q2=[left,top,1.0]*HH;
    q3=[right,bottom,1.0]*HH;
    disp('q3:');
    disp([right,bottom]);
    disp(q3);
    q4=[right,top,1.0]*HH;
    
    disp(HH);
    disp([q1;q2;q3;q4]);
    
    ori=picture(bottom:top,left:right,:);
    
    
    tran=affine2d(HH);
    %imshow(ori);
%     [orix,oriy,~]=size(ori);
%     ori(1,1,:)=[255,0,0];
%     ori(1,oriy,:)=[255,0,0];
%     ori(orix,1,:)=[255,0,0];
%     ori(orix,oriy,:)=[255,0,0];
    figure,imshow(ori);

    orir=ori(:,:,1);
    orig=ori(:,:,2);
    orib=ori(:,:,3);
    tImager=imwarp(orir,tran);
    tImageg=imwarp(orig,tran);
    tImageb=imwarp(orib,tran);
    [sx,sy,~]=size(tImager);
    tImage=uint8(zeros(sx,sy,3));
    tImage(:,:,1)=tImager(:,:,1);
    tImage(:,:,2)=tImageg(:,:,1);
    tImage(:,:,3)=tImageb(:,:,1);
    %figure,imshow(tImage);
    %tImage=imwarp(ori,tran);
    %figure,[IM,~]=imcrop(tImage);
%     tImage(q1(1),q1(2),:)=[255,0,0];
%     tImage(q2(1),q2(2),:)=[255,0,0];
%     tImage(q3(1),q3(2),:)=[255,0,0];
%     tImage(q4(1),q4(2),:)=[255,0,0];
    ox=max([q1(1),q2(1),q3(1),q4(1)]);
    oy=max([q1(2),q2(2),q3(2),q4(2)]);
    textureOrigins=[textureOrigins;[ox,oy]];
    imwrite(tImage,strcat(num2str(t),'.jpg'));
end
disp(textureOrigins);
end

