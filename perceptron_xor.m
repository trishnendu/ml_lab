X = [0,0,1,1;0,1,0,1];
Y = [0,1,1,0];
net_type = perceptron;
net = train(net_type, X, Y);
%view(net);
getwb(net)
plotpv(X,Y)
hold on;
plotpc(net.IW{1},net.b{1})
%y = net([2,1;2,0])
%perform(net,[0,1],y)