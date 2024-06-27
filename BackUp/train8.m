function [c1,cm] = train8(INPUT,OUTPUT,netSize,noTrain)
    minc1 = 1;
    minc2 = 1;
    net = patternnet(netSize);
    
    for i = 1:noTrain
        net = init(net);
        [net,~] = train(net,INPUT,OUTPUT);
        y = net(INPUT);

        c1 = perform(net,OUTPUT,round(y));
        [c2] = confusion(OUTPUT,round(y));

        if c1 < minc1
            minc1 = c1;
%             Net1 = net;
%             tr1 = tr;
        end
        if c2 < minc2
            minc2 = c2;
%             Net2 = net;
%             tr2 = tr;
        end

    end
    y = Net2(INPUT);
    [~,cm] = confusion(OUTPUT,round(y));
    %fprintf('CrossEntropy Performance = %d',c1,c2);
end
    %save('TrainingResults.mat','Net1','Net2','tr1','tr2','c1','c2','cm')