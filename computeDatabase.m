function DATAH = computeDatabase(PATH,POINT_SEL)
    FILES = dir([PATH,'**\*.txt']);
    h = waitbar(0,'Please wait computing Signatures ...');
    HOG = cell(length(FILES),1);

    for i = 1:length(FILES)
        disp(i)

        name = FILES(i).name;    
        endpath = strrep(name(1:8),'_','\');
        fullpath = strrep([PATH,endpath,'\'],'Emotion',...
                          'Landmarks');

        files = dir([fullpath,'*.txt']);

        name = files(end).name;
        folder = files(end).folder;
        foldername = [folder,'\',name];

        pts = dlmread(foldername);
        
        
        pts2 = pts(POINT_SEL,:);
        HOG{i} = triangle_image(pts2);
        
        waitbar(i / length(FILES))
    end
    close(h)
    DATAH = cell2mat(HOG);
    DATAH(isnan(DATAH)) = 0;
end

        
        