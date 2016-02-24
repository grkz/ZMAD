clear all;
averages=20;
data = load('housing.data');
mediana = median(data(:,14));

for row = 1:size(data, 1)
    if mediana <= data(row, 14)
        data(row,15) = 1;            % 1 - powyżej mediany
    else
        data(row,15) = 0;            % 0 - poniżej mediany
    end
end


for level=0:7
    lvl_error = 0.0;
    for n = 1:averages
        data = data(randperm(size(data,1)), :);
        CT = ClassificationTree.fit(data(:, 1:13), data(:,15), 'Prune', 'off');
        if level ~= 0
            CT2 = prune(CT, 'level', level);
            crv = crossval(CT2);
            lvl_error = lvl_error+kfoldLoss(crv);
            
        
            if level==7 && n==1
                view(CT2, 'mode', 'graph');
            end
        else
            if level==0 && n==1
                view(CT, 'mode', 'graph');
            end
        end
    end
    lvl_error = lvl_error/averages;
    fprintf('error (level = %d averages = %d): %.2f\n', level, averages, lvl_error);
end
    