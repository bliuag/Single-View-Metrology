function calculate_vlines()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
global dataType;
global paraLinesx;
global paraLinesy;
global paraLinesz;
global vx;
global vy;
global vz;
global vl;
[n,~]=size(paraLinesx);
if n>1
    m=double(zeros(3,3));
    for i=1:n
        for p=1:3
            for q=1:3
                m(p,q)=m(p,q)+paraLinesx(i,p)*paraLinesx(i,q);
            end
        end 
    end
    [V,D]=eig(m);
    min=D(1,1);
    minn=1;
    for i=1:size(D,1)
        if D(i,i)<min
            min=D(i,i);
            minn=i;
        end
    end
    vx=V(:,minn);
    vx=vx./vx(3);
end

[n,~]=size(paraLinesy);
if n>1
    m=double(zeros(3,3));
    for i=1:n
        for p=1:3
            for q=1:3
                m(p,q)=m(p,q)+paraLinesy(i,p)*paraLinesy(i,q);
            end
        end 
    end
    [V,D]=eig(m);
    min=D(1,1);
    minn=1;
    for i=1:size(D,1)
        if D(i,i)<min
            min=D(i,i);
            minn=i;
        end
    end
    vy=V(:,minn);
    vy=vy./vy(3);
end

[n,~]=size(paraLinesz);
if n>1
    m=double(zeros(3,3));
    for i=1:n
        for p=1:3
            for q=1:3
                m(p,q)=m(p,q)+paraLinesz(i,p)*paraLinesz(i,q);
            end
        end 
    end
    [V,D]=eig(m);
    min=D(1,1);
    minn=1;
    for i=1:size(D,1)
        if D(i,i)<min
            min=D(i,i);
            minn=i;
        end
    end
    vz=V(:,minn);
    vz=vz./vz(3);
end


if size(paraLinesx,1)>1&&size(paraLinesy,1)>1
    vl=cross(vx,vy);
    vl=vl./vl(3);
end

updateInfo();
end

