housing = load('housing.data');

RT = RegressionTree.fit(housing(:, 1:13), housing(:, 14));

RT10 = prune(RT, 'level', 10);
RT20 = prune(RT, 'level', 20);
RT30 = prune(RT, 'level', 30);


subplot(2,2,1)
fprintf('prune lvl=10: %.3f\n', price_error(RT10, housing(:,1:13), housing(:,14)));
plot_price(RT10, housing(:,1:13), housing(:,14));
subplot(2,2,2)
fprintf('prune lvl=20: %.3f\n', price_error(RT20, housing(:,1:13), housing(:,14)));
plot_price(RT20, housing(:,1:13), housing(:,14));

subplot(2,2,3)
fprintf('prune lvl=30: %.3f\n', price_error(RT30, housing(:,1:13), housing(:,14)));
plot_price(RT30, housing(:,1:13), housing(:,14));