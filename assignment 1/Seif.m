clear all
close all 
clc

dataset = importdata('house_prices_data_training_data.csv');

prices=dataset.data(:,1);
bedrooms=dataset.data(:,2);
grade=dataset.data(:,10);
m=length(prices);

x = [ones(m, 1), bedrooms, grade];


theta=zeros(3,1);

%Gradient 
index=150; %hnst5dmha fl method eltanya
learningRate  = 0.001;

[theta, Cpi] = gradientMethod(x, prices, theta, learningRate, index);


figure;
plot(Cpi);
xlabel('noOfIterations');
ylabel('Cost');

%normal equation
theta2=pinv((x'*x))*x'*prices


%display(x)







