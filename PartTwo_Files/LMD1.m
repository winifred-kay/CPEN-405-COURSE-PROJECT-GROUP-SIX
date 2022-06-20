function L = LMD1(Y)
    % Returns the status quo of M/M/S queue
    hat = Y(1);
    miu = Y(2);
    rho = hat/miu;
    L = (rho*(2-rho))/(2*(1-rho));
end