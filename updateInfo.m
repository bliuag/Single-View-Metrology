function updateInfo()
%UPDATEINFO Summary of this function goes here
%   Detailed explanation goes here
global dataType;
global paraLinesx;
global paraLinesy;
global paraLinesz;
global vx;
global vy;
global vz;
global vl;
global origin;
global rpoints;
global hpoint;
text=findobj('Tag','info');
switch dataType
    case 1
        [n,~]=size(paraLinesx);
        if(n<2)
            sx='undefined';
        else
            sx=mat2str(int64(vx));
        end
        
        [n,~]=size(paraLinesy);
        if(n<2)
            sy='undefined';
        else
            sy=mat2str(int64(vy));
        end
        
        [n,~]=size(paraLinesz);
        if(n<2)
            sz='undefined';
        else
            sz=mat2str(int64(vz));
        end
        
        if ~strcmp(sx,'undefined')&&~strcmp(sy,'undefined')
            sl=mat2str(vl);
        else
            sl='undefined';
        end

        str=sprintf(strcat('\nx:',sx,'\ny:',sy,'\nz:',sz,'\nvanishing line:',sl));
        set(text,'String',str);
    case 2
        if(size(origin,1)==0)
            str=sprintf('\norigin: undefined');
        else
            str=sprintf(strcat('\norigin: ',mat2str(origin)));
        end
        set(text,'String',str);
    case 3
        str='Reference Plane Points:\n';
        for i=1:size(rpoints,1)
            str=strcat(str,'#',num2str(i),':',mat2str(rpoints(i,1:2)),'->',mat2str(rpoints(i,3:5)),'\n');
        end
        str=sprintf(str);
        set(text,'String',str);
    case 4
        str='Reference Height Points:\n';
        for i=1:size(hpoint,1)
            str=strcat(str,'#',num2str(i),':',mat2str(hpoint(i,1:2)),'->',mat2str(hpoint(i,3:5)),'\n');
        end
        str=sprintf(str);
        set(text,'String',str);
end
end

