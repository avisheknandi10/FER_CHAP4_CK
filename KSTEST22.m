function [h,p] = KSTEST22(EXP,per1,per2)
    EXP = EXP';
    [~,c] = size(EXP);
    disp(c)
    EXP2 = EXP;
    EXP4 = EXP;
    cc = c*(1-per1);
    cc2 = c*(1-per2);
    disp(cc)
    disp(cc2)
    cc = int32(cc);
    cc2 = int32(cc2);
    EXP3 = randi([1,7],[1,c]);
    EXP2(:,1:cc) = EXP3(:,1:cc);
    EXP4(:,1:cc2) = EXP3(:,1:cc2);
    [h,p,~] = kstest2(EXP4,EXP2,'Tail','larger');