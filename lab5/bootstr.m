file = load('corrdata.txt');
r = corrcoef(file);
r = r(1,2)
b = bootstrp(10000, @corrcoef, file)
std(b(:,2))
[counts, centers] = hist(b(:,2),20);
dx = diff(centers(1:2));
bar(centers, counts/sum(counts*dx), 'r')