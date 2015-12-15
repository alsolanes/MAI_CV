% This function trains a SVM
function [model, train_x] = train_svm_rbf(num_samples, c_soft, gamma, sets)
    model = {};
    train_x = [];
    class = [];
    num_sets = numel(sets);
    for i=1:num_sets:
        data_set = sets{i};
        data_set_val = eval(data_set);
        % get desired number of samples
        samples = randperm(length(data_set_val),num_samples);
        train_x = [train, (data_set(samples,:)/255)'];
        last_data = data_set(end);
        class = [class, ones(1,num_samples)*eval(last_data)];
    end
    
    distance = L2_distance_sq(train_x,train_x);
    
    for i=1:num_sets:
        data_set = sets{i};
        data_set_val = eval(data_set);
        last_data = data_set(end);
        train_y = (class == eval(last_data));
        train_y = (train_y*2)-1;
        
        for j = 1:length(c_soft)
            for l = 1:length(gamma)
                K = exp((-gamma(l))*distance);
                model{i,j,l} = svm(K,train_y,c_soft(j));
            end
        end
    end
end