% "I discussed this homework problem with Tim Gong. 
% I certify that the assignment I am submitting represents my own work. Tien Li Shen"
%Tien-Li Shen, 02/26/2018, HW5, ID:30930512
%initialize revWeek
RevWeek = zeros(1,7);
figure
%The following for loop simulates a weekly opening at Krusty Krabs
%The default inventory is 300 Krabby Patties, 300 Kelp Rings, and 300 Coral
%Bits
for w = 1:length(RevWeek)
    [rev, inv] = hw5_TS_func(300, 300, 300); 
    RevWeek(w) = rev; %Storing the revenue into RevWeek vector
    subplot(3,1,1);%Krabby Patty plot
    plot(inv(:,1));
    title("Krabby Patty");
    xlabel("customer count");
    ylabel("items count");
    hold on %with every "hold on," new lines can be added to this graph
    subplot(3,1,2);%Kelp Rings plot
    plot(inv(:,2));
    title("Kelp Rings");
    xlabel("customer count");
    ylabel("items count");
    hold on
    subplot(3,1,3);%Coral Bits plot
    plot(inv(:,3));
    title("Coral Bits");
    xlabel("customer count");
    ylabel("items count");
    hold on
end

%The following for loop simulates a weekly opening at Krusty Krabs
%The default inventory is 300 Krabby Patties, 150 Kelp Rings, and 150 Coral
%Bits
figure
RevMonth = zeros(1,30);
Customers = zeros(1,30);
for m = 1:length(RevMonth)
    [rev, inv] = hw5_TS_func(300, 150, 150);
    RevMonth(m) = rev; %Storing the revenue into RevMonth vector
    Customers(m) = length(inv(:,1))-1;
    subplot(3,1,1); %Krabby Patty plot
    plot(inv(:,1));
    title("Krabby Patty");
    xlabel("customer count");
    ylabel("items count");
    hold on
    subplot(3,1,2); %Kelp Rings plot
    plot(inv(:,2));
    title("Kelp Rings");
    xlabel("customer count");
    ylabel("items count");
    hold on
    subplot(3,1,3); %Coral Bits plot
    plot(inv(:,3));
    title("Coral Bits");
    xlabel("customer count");
    ylabel("items count");
    hold on
end
%Question?
%in the scenario where (300, 150, 150), the graph shows that they Kelp Rings and Coral Bits
%start out lower than krabby patty, yet decreases at the same rate, but
%runs out before krabby patty. After Kelp Rings and Coral Bits are sold
%out. The probability of selling Krabby Patty goes up. Therefore it
%decreases linearly at a rate higher than previously and keeps decreasing
%until it is sold out.

%Histograms
figure
subplot(1,2,1);
hist(RevMonth);
title("RevMonth");
subplot(1,2,2);
hist(Customers);
title("Customers");