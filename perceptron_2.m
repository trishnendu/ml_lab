X = [1,1,-1,-1;1,-1,1,-1];
Y = [1,1,1,0];
net_type = perceptron;
%net = train(net_type, X, Y);
net = train(net_type, X, Y)
plotpv(X,Y)
hold on;
plotpc(net.IW{1},net.b{1})
%view(net);
%y = net([-1,1;-1,1])
%view(y);