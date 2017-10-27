function W = plot_lreg_matrix(data)
    x = data(:,2);
    y = data(:,3);
    N = length(x);
    X = ones(2,2);
    Y = ones(2,1);
    X(1,2) = sum(x)/N;
    X(2,1) = sum(x)/N;
    X(2,2) = sum(x.^2)/N;
    Y(1) = sum(y)/N;
    Y(2) = sum(x' * y)/N;
    %disp(size(X))
    %disp(size(Y))
    W = X\Y;
    scatter(x, y, 'filled', 'g');
    hold on;
    xe = linspace(min(x), max(x), N);
    ye = W(1) + W(2)*xe;
    plot(xe, ye, 'r');
end