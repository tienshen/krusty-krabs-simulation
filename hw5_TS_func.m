% "I discussed this homework problem with Tim Gong. 
% I certify that the assignment I am submitting represents my own work. Tien Li Shen"
%Tien-Li Shen, 02/26/2018, HW5, ID:30930512
%This assignment simulates Krusty Krabs running from opening to closing of
%a day. so,

%             "Welcome To Krusty Krabs"
%          "May I take your order, please?"

function [rev, inv] = hw5_TS_func(P, R, B)
%Krusty Krab opens. Initialize Order, Customer revenue, and inventory
Orders = zeros(1,3);
CustRev = zeros(1,1);
inv = [P, R, B];
n=0;

%This while loop process all orders, transactions, and the inventory
while sum(inv(n+1,:)) > 0
    n=n+1;
    %the following code process order vector based on inventory
    %when all items are available, there is 1/3 chance of selling each
    %item
    if sum(inv(n,:) == 0) == 0
        Orders(n,:) = rand(1,3)>2/3;
    %when there is only 2 items available
    %the chance of selling each remaining item is 1/2
    elseif sum(inv(n,:) == 0) == 1 
        if inv(n,1) == 0 %when krabby Patties are sold out
            Orders(n,:) = rand(1,3)>1/2;
            Orders(n,1) = 0;
        elseif inv(n,2) == 0 %when Kelp Rings are sold out
            Orders(n,:) = rand(1,3)>1/2;
            Orders(n,2) = 0;
        elseif inv(n,3) == 0 %when Coral Bits are sold out
            Orders(n,:) = rand(1,3)>1/2;
            Orders(n,3) = 0;
        end
    %when there is only 1 item avalaible
    elseif sum(inv(n,:) == 0) == 2
        %when only Krabby Patties are available
        if inv(n,2) == 0 && inv(n,3) == 0 
            Orders(n,:) = rand(1,3)>1/4;
            Orders(n,2) = 0;
            Orders(n,3) = 0;
        %when only Kelp Rings are available
        elseif inv(n,1) ==0 && inv(n,3) == 0
            Orders(n,:) = rand(1,3)>1/4;
            Orders(n,1) = 0;
            Orders(n,3) = 0;
        %when only Coral Bits are available
        elseif inv(n,1) ==0 && inv(n,2) == 0
            Orders(n,:) = rand(1,3)>1/4;
            Orders(n,1) = 0;
            Orders(n,2) = 0;  
        end    
    end
    %The following code processes the bill vector
    inv(n+1,:) = inv(n,1:3) - Orders(n,:);
    %In the condition where you only order 1 item, Tax = 7%
    if sum(Orders(n,:)) == 1
        CustRev(n) = (Orders(n,1).*1.25 + Orders(n,2).*1.50 + Orders(n,3))*1.07;
    %In the condition where you only order 2 item, Tax = 11%
    elseif sum(Orders(n,:)) == 2
        CustRev(n) = (Orders(n,1).*1.25 + Orders(n,2).*1.50 + Orders(n,3))*1.1;
    %In the condition where you only order 3 item, Tax = 15%
    elseif sum(Orders(n,:)) == 3
        CustRev(n) = (Orders(n,1).*1.25 + Orders(n,2).*1.50 + Orders(n,3))*1.15;
    end
end
%At the end, the total revenue is stored as the output
rev = sum(CustRev);