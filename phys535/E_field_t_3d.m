% Wave parameters
E0 = 1;         % Electric field amplitude
lambda = 1;    % Wavelength
f = 1;         % Frequency
omega = 2*pi*f;
k = 2*pi/lambda;
c = lambda * f; % Speed of light in the medium

% Polarization and direction
delta = pi/2; % -(phi_x-phi_y)
E0_x = 1;     % Electric field amplitude in x 
E0_y = 1;     % Electric field amplitude in y 
dir = 1; % Direction of wave: 1 is +z ; -1 is -z
phi_m = 0; % additional phase shift, in radians 

% Discretize the z-axis
z = linspace(0, 5*lambda, 1000);
z_phasor = 5*lambda; % Position to display the phasor

% Time settings
dt = 1/(10*f);   % Time step
t_end = 10/f;     % Duration of the animation

% Create figure
figure;
hold on;

% Initial electric field components
Ex = E0_x*exp(dir*i*k*z + i*phi_m);
Ey = E0_y*exp(dir*i*k*z + i*delta + i*phi_m);

% Plot the components and the resultant
h_wave_x = plot3(z, real(Ex), zeros(size(z)), 'LineWidth', 2, 'Color', [1, 0, 0], 'DisplayName', 'E_x'); % E_x component
h_wave_y = plot3(z, zeros(size(z)), real(Ey), 'LineWidth', 2, 'Color', [0, 1, 0], 'DisplayName', 'E_y'); % E_y component
h_circular = plot3(z, real(Ex), real(Ey), 'LineWidth', 2, 'Color', [0, 0, 1], 'DisplayName', 'Total');      % Resultant

% Phasor representation (initialized at t=0)
h_phasor = quiver3(z_phasor, 0, 0, 0, E0, 0, 'LineWidth', 2, 'Color', [0.5, 0, 0.5], 'DisplayName', 'Phasor', 'MaxHeadSize', 0.5);

% Set up the view and limits
axis([0, 5*lambda, -1.2*max([E0_x,E0_y]), 1.2*max([E0_x,E0_y]), -1.2*max([E0_x,E0_y]), 1.2*max([E0_x,E0_y])]);
xlabel('z');
ylabel('E_x(z, t)');
zlabel('E_y(z, t)');
%title('Propagation of Right-Handed Circularly Polarized Light');
legend('Location', 'northeast');
grid on;
view(20, 20); % Adjust for a better 3D view
%pbaspect([5 1 1])

% Animation loop
for t = 0:dt:t_end
    % Update the waveforms to simulate propagation
    Ex = E0_x*exp(i*dir*k*z - i*k*c*t + i*phi_m);
    Ey = E0_y*exp(i*dir*k*z - i*k*c*t + i*delta + i*phi_m);
    
    h_wave_x.YData = real(Ex);
    h_wave_y.ZData = real(Ey);
    
    % Update the resultant for circular polarization
    h_circular.YData = real(Ex);
    h_circular.ZData = real(Ey);
    
    % Update the phasor representation
    Ex_phasor = real(E0_x*exp(i*dir*k*z_phasor - i*k*c*t + i*phi_m));
    Ey_phasor = real(E0_y*exp(i*dir*k*z_phasor - i*k*c*t + i*delta +i*phi_m));
    delete(h_phasor); % Delete the previous phasor
    h_phasor = quiver3(z_phasor, 0, 0, 0, Ex_phasor, Ey_phasor, 'LineWidth', 2, 'Color', [0.5, 0, 0.5], 'DisplayName', 'Phasor', 'MaxHeadSize', 0.5);
   
    pause(dt);
end

hold off;

