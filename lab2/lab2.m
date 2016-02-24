clear
clc
x=0:0.1:30;
subplot(2,1,1)
plot(x,g(x))
subplot(2,1,2)
plot(x,f(x))
hold on

[counts, centers] = hist(numbers_fdist(10000),200);

dx = diff(centers(1:2));
bar(centers, counts/sum(counts*dx))
for i=1000:1000:10000
    I(i);
end
%fprintf('mean: %.4f stdev: %.4f stdev_mean: %.4f\n', mean(data), std(data), std(data)/sqrt(3));