function savefile()

fileID = fopen('model.wrl','w');

fprintf(fileID,'#VRML V2.0 utf8\n\nCollision {\n\tcollide FALSE\n\tchildren [\n');
fprintf(fileID,'Shape {');
fprintf(fileID,'    appearance Appearance {');
fprintf(fileID,'        texture ImageTexture {');
fprintf(fileID,'');
fprintf(fileID,'');
fprintf(fileID,'');


fclose(fileID);

end

