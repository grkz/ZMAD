clear all
n = 10;
data = load('housing.data');
stop_training = 450;

mediana = median(data(:,14));

for row = 1:size(data, 1)
    if mediana <= data(row, 14)
        data(row,15) = 1;            % 1 - powyżej mediany
    else
        data(row,15) = 0;            % 0 - poniżej mediany
    end
end

%%% for
total = 0.0;
for i=1:n

data = data(randperm(size(data, 1)),:);

CT = ClassificationTree.fit(data(1:stop_training,1:13), data(1:stop_training,15));

if i==1
    view(CT, 'mode', 'graph');
end

prediction = predict(CT, data((stop_training+1):end,1:13));
predicted_GOOD = 0;
predicted_BAD = 0;

for row = 1:size(data,1) - stop_training
    if prediction(row) == data(stop_training + row, 15)
        predicted_GOOD = predicted_GOOD + 1;
    else
        predicted_BAD = predicted_BAD + 1;
    end
end

predicted_OK = predicted_GOOD/size(prediction, 1);
total = total + predicted_OK;
fprintf('%d -> percent of well predicted: %.2f\n', i, predicted_OK*100)
%end - for
end
fprintf('\nTotal: average percent of well predicted: %.2f\n', total/i*100)
