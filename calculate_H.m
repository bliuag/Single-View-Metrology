function calculate_H()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
global rpoints;
global H;

A = rand(0,9);
if (size(rpoints,1)<4)
    warndlg('Not enough reference points!','Error')
else 
    for i=1:4
       B=rand(2,9);
       B(1,1)=rpoints(i,1);
       B(1,2)=rpoints(i,2);
       B(1,3)=1;
       B(1,4:6)=zeros(1,3);
       B(1,7)=-rpoints(i,3)*rpoints(i,1);
       B(1,8)=-rpoints(i,3)*rpoints(i,2);
       B(1,9)=-rpoints(i,3);
       B(2,1:3)=zeros(1,3);
       B(2,4:5)=rpoints(i,1:2);
       B(2,6)=1;
       B(2,7)=-rpoints(i,4)*rpoints(i,1);
       B(2,8)=-rpoints(i,4)*rpoints(i,2);
       B(2,9)=-rpoints(i,4);
       A=[A;B];
    end
    %disp(A);
    A=A'*A;
    %disp('***************');
    %disp(A);
    [V,D]=eig(A);
    %[U,S,V] = svd(A);
    %h=double(U(:,size(U,2)));
%     
    min=double(D(1,1)); minn=1;
     for i=2:size(D,1)
         if (D(i,i)<min)
             min=D(i,i); minn=i;
         end
     end
    h=V(:,minn);
    H=reshape(h,[3,3]);
    H=H';

     str='Matrix H is:\n';
     str=strcat(str,mat2str(H));
     str=strcat(str,'\nPoint on graph:\n');
     w=H*double([rpoints(4,1:2),1]');
     w=w./w(3);
     str=strcat(str,mat2str(w));
     str=sprintf(str);
     disp(str);
end
end

