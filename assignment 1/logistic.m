function [Theta, E] = logistic(X,Y,Theta,Alpha);
m=length(X);
k=1;
R=1;
while R==1
    Alpha=Alpha*1;
    h=sigmoid(X*Theta);
    Theta=Theta-(Alpha/m)*X'*(h-Y);
    k=k+1;
    E(k)=costFunction(X,Y,Theta);
    if E(k-1)-E(k)<0
        break
    end
    q=(E(k-1)-E(k))./E(k-1);
    if q <.000001;
        R=0;
    end
end
end

