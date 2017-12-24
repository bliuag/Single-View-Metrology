function extractTexture()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
global transformH;
global setPlanes;
global points;
global picture;

global basex;
global basey;
global basez;
global textureOrigins;

[n,~]=size(setPlanes);

basex=max(max(points(setPlanes(:,:),3)));
basey=max(max(points(setPlanes(:,:),4)));
basez=max(max(points(setPlanes(:,:),5)));

transformH=rand(0,9);
textureOrigins=rand(0,2);

for t=1:n%%%%
    
    tempp=points(setPlanes(t,:),:);
    p=double(rand(4,4));
    p(:,1:2)=double(tempp(:,1:2));
    rp=double(tempp(:,3:5));
    p(1,3:4)=0;
    p(2,3)=norm(rp(2,:)-rp(1,:));
    p(2,4)=0;
    
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

    C=A'*A;
    
    [V,D]=eig(C);

    mi=double(D(1,1)); minn=1;
    for i=2:size(D,1)
        if (D(i,i)<mi)
            mi=D(i,i); minn=i;
        end
    end
    h=V(:,minn);
%     disp('h:');
%     disp(h);
%     
%     disp('A*h\n');
%     disp(A*h);
%     
    HH=reshape(h,[3,3]);
    HH=HH./HH(3,3);
    disp(HH);
    left=int64(min(p(:,1)));
    right=int64(max(p(:,1)));
    bottom=int64(min(p(:,2)));
    top=int64(max(p(:,2)));
    
    disp('left right bottom top:');
    disp([left,right,bottom,top]);
    
    
    q1=double([left,bottom,1.0])*HH;
    q1=q1./q1(3);
    q2=double([left,top,1.0])*HH;
    q2=q2./q2(3);
    q3=double([right,bottom,1.0])*HH;
    q3=q3./q3(3);
    q4=double([right,top,1.0])*HH;
    q4=q4./q4(3);
    
%     for i=(int64(right)-10):(int64(right)+10)
%         for j=(int64(bottom)-10):(int64(bottom)+10)
%             picture(j,i,:)=[255,0,0];
%         end
%     end
%     
%     
%     for i=(int64(right)-10):(int64(right)+10)
%         for j=(int64(top)-10):(int64(top)+10)
%             picture(j,i,:)=[0,255,0];
%         end
%     end
    disp('q1 q2 q3 q4:');
    disp([q1; q2; q3; q4]);
    
%     p1=[p(1,1),p(1,2),1]*HH;
%     disp(p1./p1(3));
%     p2=[p(2,1),p(2,2),1]*HH;
%     disp(p2./p2(3));
%     p3=[p(3,1),p(3,2),1]*HH;
%     disp(p3./p3(3));
%     p4=[p(4,1),p(4,2),1]*HH;
%     disp(p4./p4(3));
    
    %disp(q2);
    
    
   ori=picture(bottom:top,left:right,:);
%     
%      tran=projective2d(HH);
%      [tx,ty]=transformPointsForward(tran,double(left),double(top));
%      disp([tx,ty]);
%      [tx,ty]=transformPointsForward(tran,double(left),double(bottom));
%      disp([tx,ty]);
%      [tx,ty]=transformPointsForward(tran,double(right),double(top));
%      disp([tx,ty]);
%      [tx,ty]=transformPointsForward(tran,double(right),double(bottom));
%      disp([tx,ty]);
     
%       HH(1:2,3)=0;
%       tran=affine2d(HH);
  %  tran=projective2d(HH); 
    
%     orir=ori(:,:,1);
%     orig=ori(:,:,2);
%     orib=ori(:,:,3);
%     tImager=imwarp(orir,tran);
%     tImageg=imwarp(orig,tran);
%     tImageb=imwarp(orib,tran);
%     [sx,sy,~]=size(tImager);
%     tImage=uint8(zeros(sx,sy,3));
%     tImage(:,:,1)=tImager(:,:,1);
%     tImage(:,:,2)=tImageg(:,:,1);
%     tImage(:,:,3)=tImageb(:,:,1);

    
    nright=int64(max([q1(1),q2(1),q3(1),q4(1)]));
    nleft=int64(min([q1(1),q2(1),q3(1),q4(1)]));
    nbottom=int64(min([q1(2),q2(2),q3(2),q4(2)]));
    ntop=int64(max([q1(2),q2(2),q3(2),q4(2)]));
    disp([nbottom,nleft]);
    tImage=uint8(zeros(ntop-nbottom+5,nright-nleft+5,3));
    for row=bottom:top
        for col=left:right
            ncr=double([col,row,1])*HH;
            ncrn=int64(ncr./ncr(3));
            %disp([col,row,ncrn]);
            tImage(ncrn(2)-nbottom+1,ncrn(1)-nleft+1,:)=...
                picture(row,col,:);
        end
    end
    
    [nr,nc,~]=size(tImage);
    ftImage=tImage;
    for row=1:nr
        for col=1:nc
            if tImage(row,col,1)==0 && tImage(row,col,2)==0 && tImage(row,col,3)==0
                n=0;
                sum=[0,0,0];
                for i=-2:2
                    for j=-2:2
                        if row+i<=nr && row+i>0 && col+j<=nc && col+j>0
                            if tImage(row+i,col+j,1)~=0 || tImage(row+i,col+j,2)~=0 || tImage(row+i,col+j,3)~=0
                                n=n+1;
                                sum(1)=double(sum(1)) + double(tImage(row+i,col+j,1));
                                sum(2)=double(sum(2)) + double(tImage(row+i,col+j,2));
                                sum(3)=double(sum(3)) + double(tImage(row+i,col+j,3));
                            end
                        end
                    end
                end
            ftImage(row,col,:)=sum./n;
            end
        end
    end
%     
%     tImage=imwarp(ori,tran);
    ox=min([q1(1),q2(1),q3(1),q4(1)]);
    oy=max([q1(2),q2(2),q3(2),q4(2)]);
%     disp([ox,oy]);
    textureOrigins=[textureOrigins;[ox,oy]];
    transformH=[transformH;reshape(HH,[1,9])];
    imwrite(ftImage,strcat(num2str(t),'.jpg'));
    
end
%disp(textureOrigins);
end

