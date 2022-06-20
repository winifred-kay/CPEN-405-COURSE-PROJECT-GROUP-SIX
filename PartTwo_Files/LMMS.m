function L = LMMS(Z)
    % Returns the status quo of M/M/S queue
    hat = Z(1);
    miu = Z(2);
    s = Z(3);
    gamma = hat/miu;
    rho = gamma/s;
    syms n
    R = symsum((gamma^n)/factorial(n), n, 0, s-2);
    Rs = ((factorial(s-1))/(gamma^(s-1)))*R;
    Ps_1 = (1)/((1/(1-rho)) + Rs);
    Lq = double(((rho^2)/(1-rho)^2)*Ps_1);
    L = Lq + gamma;
end
    
    
