function [NET,TR,ACC] = train_for_accuracy(DATASET,EXP)
    NET = cell(1,7);
    TR = cell(1,7);
    ACC = cell(1,7);
    for i = 1:7
        fprintf('Expression ID: %d',i);
        DATAI = cell2mat(DATASET(:,i)')';
        EXPI = double(EXP==i);
%         size(DATAI)
%         size(EXPI)
        [NET{i},TR{i},ACC{i}] = train7(DATAI',EXPI');
    end
end