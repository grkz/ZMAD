clear all
clf
setosa = importdata('setosa.txt');
versicolor = importdata('versicolor.txt');
virginica = importdata('virginica.txt');

setosa = setosa(randperm(50), :);
versicolor = versicolor(randperm(50), :);
virginica = virginica(randperm(50), :);

setosa_tr = setosa(1:30,:);
versicolor_tr = versicolor(1:30,:);
virginica_tr = virginica(1:30,:);

setosa_test = setosa(31:50,:);
versicolor_test = versicolor(31:50,:);
virginica_test = virginica(31:50,:);

ysetosa(1:30,1) = 1;
yversicolor(1:30,1) = 2;
yvirginica(1:30,1) = 3;

trening = [
    setosa_tr, ysetosa;
    versicolor_tr, yversicolor;
    virginica_tr, yvirginica;
    ];

test = [
    setosa_test, ysetosa(1:20,1);
    versicolor_test, yversicolor(1:20,1);
    virginica_test, yvirginica(1:20,1);
    ]


mdl = ClassificationKNN.fit(trening(:,1:4),trening(:,5))

true_set=[];
false_set=[];
for n=[1:60]
    if (predict(mdl, test(n, 1:4)) == test(n,5))
        true_set = [true_set; test(n,:)];
    else
        false_set = [false_set; test(n,:)];
    end
end

% selected attributes:
y=1;
for v=[1:4]
    for x=[1:3]
        if (x ~= v)
            x_i = v;
            x_j = x;
% setosa -> black
% OK:

subplot(4,3,y)
scatter(setosa_tr(:, x_i), setosa_tr(:, x_j), 'b', 'o')
hold on
scatter(versicolor_tr(:, x_i), versicolor_tr(:, x_j), 'k', 'o')
scatter(virginica_tr(:, x_i), virginica_tr(:, x_j), 'r', 'o')

scatter(true_set(true_set(:,5)==1, x_i), true_set(true_set(:,5)==1, x_j), 'b', '.')
scatter(true_set(true_set(:,5)==2, x_i), true_set(true_set(:,5)==2, x_j), 'k', '.')
scatter(true_set(true_set(:,5)==3, x_i), true_set(true_set(:,5)==3, x_j), 'r', '.')


% False:
scatter(false_set(false_set(:,5)==1, x_i), false_set(false_set(:,5)==1, x_j), 'b', 'x')
scatter(false_set(false_set(:,5)==2, x_i), false_set(false_set(:,5)==2, x_j), 'k', 'x')
scatter(false_set(false_set(:,5)==3, x_i), false_set(false_set(:,5)==3, x_j), 'r', 'x')
        y = y+1;
        end
    end
end



