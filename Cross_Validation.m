classdef Cross_Validation
   
    methods(Static)
        function [kfold_val, holdout_val, leaveout_val] = cross_val(data, n)
            x = data(:, 2);
            y = data(:, 3);
            N = length(x);
            itr = 1000
            predfun = @(XTRAIN, ytrain, XTEST)(Models.non_linear_model_pred(XTRAIN, ytrain, XTEST, n));
            %kfold_cases = zeros(N, 1)
            %for i = 1:1000
            %    holdout_cases(i) = crossval('mse', x, y, 'Predfun', predfun, 'holdout', 0.25);
            %end
            %kfold_val = mean(kfold_cases)
            
            kfold_val = crossval('mse', x, y, 'Predfun', predfun, 'kfold', 5)
            
            holdout_cases = zeros(itr, 1);
            holdout_mean = zeros(itr, 1);
            for i = 1:itr
                holdout_cases(i) = crossval('mse', x, y, 'Predfun', predfun, 'holdout', 0.25);
                if i == 1
                    holdout_mean(1) = holdout_cases(i);
                else
                    holdout_mean(i) = (holdout_mean(i-1)*(i-1) + holdout_cases(i))/i;
                end
            end
            plot(linspace(1,itr,itr), holdout_mean)
            hold on;
            holdout_val = mean(holdout_cases)
            
            leaveout_cases = zeros(itr, 1);
            leaveout_mean = zeros(itr, 1);
            for i = 1:1000
                leaveout_cases(i) = crossval('mse', x, y, 'Predfun', predfun, 'leaveout', 1);
                if i == 1
                    leaveout_mean(1) = leaveout_cases(1);
                else
                    leaveout_mean(i) = (leaveout_mean(i-1)*(i-1) + leaveout_cases(i))/i;
                end
            end
            plot(linspace(1,itr,itr), leaveout_mean, 'r')
            leaveout_val = mean(leaveout_cases)
        end
        
    end
    
end