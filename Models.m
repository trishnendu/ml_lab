classdef Models
    
    methods(Static)
        function yfit = non_linear_model_pred(x, y, xtest, n)
            N = length(x);
            n = n + 1;
            X = ones(n);
            Y = ones(n, 1);
            t1 = 1;
            for i = 1:n
                t2 = ones(size(x));
                for j = 1:n
                     X(i,j) = sum(t1 .* t2)/N;
                     t2 = t2 .* x;
                end
            t1 = t1 .* x;
            end
            t3 = y;
            for i = 1:n
                Y(i,1) = sum(t3)/N;
                t3 = t3 .* x;
            end
            W = X\Y;
            t = 1;
            yfit = 0;
            for i = 1:n
                yfit = yfit + W(i)*t;
                t = t .* xtest;
            end
        end
    end
end