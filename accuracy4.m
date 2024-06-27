function EXP4 =  accuracy4(EXP3,per)
[~,c] = size(EXP3);
disp(c)
EXP4 = EXP3;
cc = c*(1-per);
disp(cc)
cc = int32(cc);
EXP5 = randi([1,7],[1,c]);
EXP4(:,1:cc) = EXP5(:,1:cc);
end
