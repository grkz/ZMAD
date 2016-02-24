function plot_price(tree, data, real_price)
    prediction = predict(tree, data);
    plot(prediction-real_price);
end