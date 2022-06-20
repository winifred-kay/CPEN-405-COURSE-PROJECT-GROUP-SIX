function Z = objectiveFunction(X)
    
    %Returns the total cost
    Z = [X(1), X(2), X(3)];
    Y = [X(4), X(5)];
    number_machines = X(6);
    price_inventory = X(7);
    price_machine = X(8);
    price_inspector = X(9);
    
    Lmms = LMMS(Z);
    Lmd1 = LMD1(Y);
    cost_inventory = (Lmms + Lmd1)*(price_inventory);
    cost_machine = number_machines*price_machine;
    cost_inspector = price_inspector;
 
    Z = cost_inventory + cost_machine + cost_inspector;

end