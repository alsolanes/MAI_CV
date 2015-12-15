function [ X ] = getXTrain( numInstances,train0,train1,train2,train3,train4,train5,train6,train7,train8,train9 )
    itrain0 = randi(length(train0),1,numInstances);
    itrain1 = randi(length(train1),1,numInstances);
    itrain2 = randi(length(train2),1,numInstances);
    itrain3 = randi(length(train3),1,numInstances);
    itrain4 = randi(length(train4),1,numInstances);
    itrain5 = randi(length(train5),1,numInstances);
    itrain6 = randi(length(train6),1,numInstances);
    itrain7 = randi(length(train7),1,numInstances);
    itrain8 = randi(length(train8),1,numInstances);
    itrain9 = randi(length(train9),1,numInstances);

    X0 = train0(itrain0,:);
    X1 = train1(itrain1,:);
    X2 = train2(itrain2,:);
    X3 = train3(itrain3,:);
    X4 = train4(itrain4,:);
    X5 = train5(itrain5,:);
    X6 = train6(itrain6,:);
    X7 = train7(itrain7,:);
    X8 = train8(itrain8,:);
    X9 = train9(itrain9,:);

    X = [X0;X1;X2;X3;X4;X5;X6;X7;X8;X9];
    X = double(X);
end

