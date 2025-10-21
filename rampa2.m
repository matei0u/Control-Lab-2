% === GRAFICA DE PUNTOS CLAVE DE SUBIDA Y BAJADA ===

filename = '5min.txt';
data = readmatrix(filename);

% Extraer columnas
duty = data(:, 2);        % segunda columna → duty cycle
temp = data(:, 3);        % tercera columna → temperatura

% Índices de interés
idx_subida = [60, 120, 180, 240, 300];
idx_bajada = [360, 420, 480, 540];

% Extraer los valores correspondientes
duty_subida = duty(idx_subida);
temp_subida = temp(idx_subida);

duty_bajada = duty(idx_bajada);
temp_bajada = temp(idx_bajada);

% Graficar
figure;
hold on; grid on;

% Subida (azul)
plot(duty_subida, temp_subida, 'b-o', 'LineWidth', 1.5, 'MarkerSize', 6);

% Conectar el último punto azul con el primero rojo (inicio de bajada)
duty_bajada_full = [duty_subida(end); duty_bajada];
temp_bajada_full = [temp_subida(end); temp_bajada];

% Bajada (rojo)
plot(duty_bajada_full, temp_bajada_full, 'r-o', 'LineWidth', 1.5, 'MarkerSize', 6);

xlabel('Duty cycle [%]');
ylabel('Temperatura [°C]');
title('Curvas de temperatura de la planta (subida y bajada)');
legend('Subida','Bajada','Location','best');
