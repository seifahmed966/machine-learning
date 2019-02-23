clear all
ds = datastore('heart_DD.csv','TreatAsMissing','NA',.....
    'MissingValue',0,'ReadSize',250);
T = read(ds);

size(T);
Alpha=.01;

m=length(T{:,1});
U=T{:,1:13};
X=[ones(m,1) U U.^2 U.^3];

n=length(X(1,:));
for w=2:n
    if max(abs(X(:,w)))~=0
        X(:,w)=(X(:,w)-mean((X(:,w))))./std(X(:,w));
    end
end

Y=T{:,14}/mean(T{:,14});
Theta=zeros(n,1);

[theta, cost]=logistic(X,Y,Theta,Alpha);