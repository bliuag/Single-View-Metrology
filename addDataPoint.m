function addDataPoint( x,y )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
global dataType;
global paraLinesx;
global paraLinesy;
global paraLinesz;
global direction;
global origin;
switch dataType
    case 1    
        switch(direction)
            case 'x'
                paraLinesx=[paraLinesx;[x,y]];
            case 'y'
                paraLinesy=[paraLinesy;[x,y]];  
            case 'z'
                paraLinesz=[paraLinesz;[x,y]];
        end    
    case 2
        [n,~]=size(origin);
        if(n==0)
            origin=[x,y];
        end
end
updatePicture();
end

