function saveVanishing()
global vx;
global vy;
global vz;
global vl;
fid = fopen('vanishing.txt','w');
fprintf(fid,'%9.5f %9.5f %9.5f\n',vx(1),vx(2),vx(3));
fprintf(fid,'%9.5f %9.5f %9.5f\n',vy(1),vy(2),vy(3));
fprintf(fid,'%9.5f %9.5f %9.5f\n',vz(1),vz(2),vz(3));
fprintf(fid,'%9.8f %9.8f %9.8f\n',vl(1),vl(2),vl(3));
%fprintf(fid, 'vx: %9.5f \nvy: %9.5f \nvz: %9.5f \nvl: %9.5f \n', vx,vy,vz,vl);
fclose(fid);