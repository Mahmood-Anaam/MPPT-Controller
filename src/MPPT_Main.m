% Simulation of a PV system with GWO-based MPPT algorithm

% System parameters
Vmp = 30;     % Voltage at maximum power point (example)
Imp = 8;      % Current at maximum power point (example)
Voc = 38;     % Open-circuit voltage (example)
Isc = 9;      % Short-circuit current (example)
L = 0.1;      % Inductor value (example)
C = 0.01;     % Capacitor value (example)
R = 10;       % Load resistance (example)
Ts = 0.001;   % Sampling period (example)
time = 0:Ts:1; % Simulation time span

% Initialize variables
Vpv = zeros(size(time));
Ipv = zeros(size(time));
Ppv = zeros(size(time));
D = zeros(size(time));
Vo = zeros(size(time));

% GWO parameters
nWolves = 4;  % Number of grey wolves

% Initialize GWO variables (inside the main loop for dynamic changes)

% Simulation loop
for i = 1:length(time)
    % 1. PV Panel Model (Simplified for demonstration)
    %  Replace this with a more accurate model if needed (e.g., single-diode model)
    Vpv(i) = Vmp; % Example: Constant voltage for now
    Ipv(i) = Imp; % Example: Constant current for now


    % 2. Apply GWO Algorithm
    D(i) = GWO_code(Vpv(i), Ipv(i));

    % 3. DC-DC Boost Converter Model (Simplified for demonstration)
    %  Replace this with a more accurate model that includes inductor and capacitor dynamics
     Vo(i) = Vpv(i) / (1 - D(i));  % Simplified model - might not be accurate

    % 4. Calculate Power
    Ppv(i) = Vpv(i) * Ipv(i);

end



% Plotting the results
figure;
subplot(2, 2, 1);
plot(time, Vpv);
xlabel('Time (s)');
ylabel('PV Voltage (V)');
title('PV Panel Voltage');
grid on;

subplot(2, 2, 2);
plot(time, Ipv);
xlabel('Time (s)');
ylabel('PV Current (A)');
title('PV Panel Current');
grid on;

subplot(2, 2, 3);
plot(time, Ppv);
xlabel('Time (s)');
ylabel('PV Power (W)');
title('PV Panel Power');
grid on;


subplot(2, 2, 4);
plot(time, D);
xlabel('Time (s)');
ylabel('Duty Cycle');
title('Duty Cycle');
grid on;
