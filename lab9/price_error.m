function sigma = price_error(tree, data, real_price)
    prediction = predict(tree, data);
    sigma = std(prediction - real_price);
end