function [bnet,btr,acc] = train7(INPUT,OUTPUT)
    % size of the the hidden layer
    netSize = 10;
    % create patterent recognition network
    net = patternnet(netSize);
    N = size(INPUT,2);
    %disp(size(OUTPUT))
    %disp(N)
    % Divide input and output data
    indx = randperm(N);
    training_index = indx(1:round(0.7*N));
    validation_index = indx(round(0.7*N)+1:end);
    % traing input and output data for i'th fold
    train_input =   INPUT(:,training_index);
    train_output = OUTPUT(training_index);
    % validation input and output data for i'th fold
    validation_input =   INPUT(:,validation_index);
    validation_output = OUTPUT(validation_index);
    % Combine reordered data
    INPUT2 =  [train_input,validation_input];
    OUTPUT2 = [train_output,validation_output];
    
    minperf = 1;
    counter = 0;
    
    while (counter<2)
            % train netwok with training data
            net = init(net);
            net.divideFcn = 'divideblock';
            net.divideParam.trainRatio = 0.9;
            net.divideParam.valRatio = 0.1;
            net.divideParam.testRatio = 0;
            [net,tr] = train(net,INPUT2,OUTPUT2);        
            % simulate netwok for validation_data
            y = sim(net,validation_input);
            
            % Compute perfomance
            tperf = perform(net,validation_output,y);

            if  tperf < minperf
                minperf = tperf;
                bnet = net;
                btr = tr;
                counter = 0;
            else
                counter = counter + 1;
            end
            disp(tperf)
    end
    acc = minperf;
end