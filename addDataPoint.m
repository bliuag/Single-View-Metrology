function addDataPoint( x,y )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
global dataType;
global paraPointsx;
global paraPointsy;
global paraPointsz;
global paraLinesx;
global paraLinesy;
global paraLinesz;
global direction;
global origin;
global rpoints;
global hpoint;
global points;
global afa;
global vz;
global H;
global vx;
global vy;
global vl;
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
        prompt = {'Enter X:','Enter Y:','Enter Z'};
        dlg_title = 'Input';
        num_lines = 1;
        defaultans = {'0','0','0'};
        answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
        
        rpoints=[rpoints;x y str2num(answer{1}) str2num(answer{2}) str2num(answer{3})];
        updateInfo();
    case 4
        if size(hpoint,1)==0
            prompt = {'Enter X:','Enter Y:','Enter Z'};
            dlg_title = 'Input';
            num_lines = 1;
            defaultans = {'0','0','0'};
            answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
        
            hpoint=[hpoint;x y str2num(answer{1}) str2num(answer{2}) str2num(answer{3})];
            o=double([origin,1]);
            t=double([hpoint(1),hpoint(2),1]);
            afa=-norm(cross(o',t'))/norm(cross(vz',t'))/hpoint(5);
            updateInfo();
        end
    case 5
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
            t1=cross(bm,o);
            t1=t1./t1(3);
            t2=cross(t1,vl);
            t2=t2./t2(3);
            t=double([x,y,1]);
            t3=cross(t2,t);
            t3=t3./t3(3);
            r=double([hpoint(1),hpoint(2),1]);
            z=cross(o,r);
            z=z./z(3);
            t4=cross(z,t3);
            t4=t4./t4(3);
            
            c=double(hpoint(5))*norm(cross(t4,o))*norm(cross(vz,r))/(norm(cross(r,o))*norm(cross(vz,t4)));
            %c=-dot(o',vl')*norm(cross(bm',t'))/dot(bm',vl')/norm(cross(vz',t'))/afa;
        end
%     a=0;
%     b=0;
%     c=0;
        points=[points;x,y,a,b,c];
        updateInfo();
end
updatePicture();
end

