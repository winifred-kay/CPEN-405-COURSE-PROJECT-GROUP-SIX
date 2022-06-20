hat_mms = 7;
miu_mms = 1;
s = 10;
hat_md1 = 7;
miu_md1 = 8;
number_machines = 10;
price_inventory = 8;
price_machine = 7;
price_inspector = 17;
X = [hat_mms, miu_mms, s, hat_md1, miu_md1, number_machines, price_inventory, price_machine, price_inspector];
Z = objectiveFunction(X);
disp('Status quo given initial conditions: '), disp(Z);

hat_mms = 7;
miu_mms = 1.25;
s = 10;
hat_md1 = 7;
miu_md1 = 8;
number_machines = 10;
price_inventory = 8;
price_machine = 7.50;
price_inspector = 17;
X = [hat_mms, miu_mms, s, hat_md1, miu_md1, number_machines, price_inventory, price_machine, price_inspector];
Z = objectiveFunction(X);
disp('Cost after increasing presses power: '), disp(Z);

nvars = 9;
lb = [7 1 10 7 8 10 8 7 17];
ub = [7 2 10 7 8 10 8 8 20];
PopulationSize_Data = 200;
MaxGenerations_Data = 100;
MaxStallGenerations_Data = 100;
figure(1)
[x,fval,exitflag,output,population,score] = geneticAlgorithmOptimization(nvars,lb,ub,PopulationSize_Data,MaxGenerations_Data,MaxStallGenerations_Data);
disp('Optimal solution parameters (GA): '), disp(x);
disp('Optimized cost(GA): '), disp(fval);

x0 = [7 1 10 7 8 10 8 7 17];
MaxIterations_Data = 250;
figure(2)
[x,fval,exitflag,output] = simulatedAnnealingOptimization(x0,lb,ub,MaxIterations_Data);
disp('Optimal solution parameters (SA): '), disp(x);
disp('Optimized cost(SA): '), disp(fval);