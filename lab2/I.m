function data = I(n)
        a = [];
        for i=1:n
        	a(i) = cos(exprnd(3));
        end
        fprintf('N=%10d\tcos(x)=%.4f +/- %.5f\tI=%.2f error: %.2f%%\n', n, mean(a), std(a)/sqrt(n),3*mean(a), 100*std(a)/(mean(a)*sqrt(n)))

end
