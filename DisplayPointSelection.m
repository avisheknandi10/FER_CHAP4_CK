function DisplayPointSelection(POINT_SEL,path_to_images)
    TAG = {'AN','CO','DI','FE','HA','SA','SU'};
    for i = 1:length(POINT_SEL)
        I = imread([path_to_images,TAG{i},'.png']);
        pts = dlmread([path_to_images,TAG{i},'.pts']);
        sel_pts = pts(POINT_SEL{i},:);
        I2 = insertText(I,sel_pts,POINT_SEL{i});
        subplot(2,4,i)
        imshow(I2)
    end
end
