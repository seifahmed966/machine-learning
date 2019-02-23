clear all
ds = datastore('heart_DD.csv','TreatAsMissing','NA',.....
    'MissingValue',0,'ReadSize',250);
T = read(ds);

size(T);
Alpha=0.01;

m=length(T{:,1});
U1=T{:,1:13};


X1=[ones(m,1) U1 ];

n1=length(X1(1,:));
for w=2:n1
    if max(abs(X1(:,w)))~=0
        X1(:,w)=(X1(:,w)-mean((X1(:,w))))./std(X1(:,w));
    end
end

Y=T{:,14};
Theta1=zeros(n1,1);

[theta1, cost1]=logistic(X1,Y,Theta1,Alpha);



%%%%%%%%%
U2=T{:,1:13};
X2=[ones(m,1) U2 U2.^2 U2.^3 ];

n2=length(X2(1,:));
for w=2:n2
    if max(abs(X2(:,w)))~=0
        X2(:,w)=(X2(:,w)-mean((X2(:,w))))./std(X2(:,w));
    end
end

Y=T{:,14}/mean(T{:,14});
Theta2=zeros(n2,1);

[theta2, cost2]=logistic(X2,Y,Theta2,Alpha);

%%%%%
U3=T{:,1:13};
X3=[ones(m,1) U3 U3.^2  ];

n3=length(X3(1,:));
for w=2:n3
    if max(abs(X3(:,w)))~=0
        X3(:,w)=(X3(:,w)-mean((X3(:,w))))./std(X3(:,w));
    end
end

Y=T{:,14}/mean(T{:,14});
Theta3=zeros(n3,1);

[theta3, cost3]=logistic(X3,Y,Theta3,Alpha);


%%%%%%%%%%%

U4=T{:,3:10};
X4=[ones(m,1) U4 U4.^2 U4.^3 ];

n4=length(X4(1,:));
for w=2:n4
    if max(abs(X4(:,w)))~=0
        X4(:,w)=(X4(:,w)-mean((X4(:,w))))./std(X4(:,w));
    end
end

Y=T{:,14}/mean(T{:,14});
Theta4=zeros(n4,1);

[theta4, cost4]=logistic(X4,Y,Theta4,Alpha);


plot(cost1);
hold on 
plot(cost2);
hold on
plot(cost3);
hold on
plot(cost4);

