function addDataPoint( x,y )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
x=double(x);
y=double(y);
global dataType;
global paraPointsx;
global paraPointsy;
global paraPointsz;
global paraLinesx;
global paraLinesy;
global paraLinesz;
global direction;
global origin;
global hpoint;
global points;
global a_x;
global a_y;
global a_z;
global vz;
global H;
global vx;
global vy;
global vl;
global rpoints;


switch dataType
    case 1    
        switch(direction)
            case 'x'
                paraPointsx=[paraPointsx;[x,y]];
                n=size(paraPointsx,1);
                if mod(n,2)==0
                    p1=double([paraPointsx(n,:),1]);
                    p2=double([paraPointsx(n-1,:),1]);
                    l=cross(p1,p2);
                    l=l./l(3);
                    paraLinesx=[paraLinesx;l];
                end
            case 'y'
                paraPointsy=[paraPointsy;[x,y]]; 
                n=size(paraPointsy,1);
                if mod(n,2)==0
                    p1=double([paraPointsy(n,:),1]);
                    p2=double([paraPointsy(n-1,:),1]);
                    l=cross(p1,p2);
                    l=l./l(3);
                    paraLinesy=[paraLinesy;l];
                end
            case 'z'
                paraPointsz=[paraPointsz;[x,y]];
                n=size(paraPointsz,1);
                if mod(n,2)==0
                    p1=double([paraPointsz(n,:),1]);
                    p2=double([paraPointsz(n-1,:),1]);
                    l=cross(p1,p2);
                    l=l./l(3);
                    paraLinesz=[paraLinesz;l];
                end
        end    
        
    case 2
        [n,~]=size(origin);
        if(n==0)
            origin=[x,y];
        end
        updateInfo();
    case 3
        prompt = {'Length'};
        dlg_title = 'Input';
        num_lines = 1;
        defaultans = {'0'};
        answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
        answ=str2double(answer{1});
        %disp(vx);
        switch(direction)
            case 'x'
                a_x = (sum(vx - [x;y;1.0]) \ sum([x,y,1.0] - double([origin,1]))) /double(answ);
                rpoints(1,:)=[x,y,double(answ),0,0];
            case 'y'
                a_y = (sum(vy - [x;y;1.0]) \ sum([x,y,1.0] - double([origin,1]))) /double(answ);
                rpoints(2,:)=[x,y,0,double(answ),0];
            case 'z'
                a_z = (sum(vz - [x;y;1.0]) \ sum([x,y,1.0] - double([origin,1]))) /double(answ);
                rpoints(3,:)=[x,y,0,0,answ];
                hpoint = [x,y,0,0,double(answ)];
        end
        updateInfo();
    
    case 5
        %points=rand(0,5);
        if mod(size(points,1),2)==0;
            an=double(H)*double([x;y;1.0]);
            an=an./an(3);
            a=an(1);
            b=an(2);
            c=0;
        else
            n=size(points,1);
            a=points(n,3);
            b=points(n,4);
            bm=double([points(n,1),points(n,2),1]);
            o=double([origin,1]);
%             t1=cross(bm,o);
%             t1=t1./t1(3);
%             t2=cross(t1,vl);
%             t2=t2./t2(3);
%             t=double([x,y,1]);
%             t3=cross(t2,t);
%             t3=t3./t3(3);
%             r=double([hpoint(1),hpoint(2),1]);
%             z=cross(o,r);
%             z=z./z(3);
%             t4=cross(z,t3);
%             t4=t4./t4(3);
%             
%             c=double(hpoint(5))*norm(cross(t4,o))*norm(cross(vz,r))/(norm(cross(r,o))*norm(cross(vz,t4)));
            t=[x,y,1];
            c=-dot(o',vl')*norm(cross(bm',t'))/dot(bm',vl')/norm(cross(vz',t'))/a_z;
        end

        points=[points;x,y,a,b,c];
        updateInfo();
end
updatePicture();
end

