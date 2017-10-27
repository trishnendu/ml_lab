X1 = [0,0,1,1];
X2 = [0,1,0,1];
Y = [0,0,1,0];
W = [1,1];
theta = 0;
response = zeros(1,4);
while 1
    y = X1*W(1) + X2*W(2);
    for i=1:length(Y)
        if y(i) >= theta
            response(i) = 1;
        else
            response(i) = 0;
        end
    end
    if response == Y
        fprintf('\ntraining complete, W1 = %i, W2 = %i, theta = %.2f\n', W(1), W(2), theta); 
        break
    else
         cnt = 0;
         for i=1:length(Y)
             if Y(i) == response(i)
                 cnt = cnt + 1;
             end
         end
         fprintf('W1 = %i, W2 = %i, theta = %.2f, the accuracy is %.2f\n', W(1), W(2), theta, cnt/length(Y));
         disp(response)
         W(1) = input('W1 = ');
         W(2) = input('W2 = ');
         theta = input('theta = ');
    end
end
    