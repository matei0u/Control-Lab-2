filename = 'escalonlab2.txt'; 
data = readmatrix(filename);

% Separar columnas
tiempo = data(:,1);
voltaje = data(:,2);
rpm = data(:,3);

% --- Graficar las señales ---
figure;
yyaxis left
plot(tiempo, voltaje, 'b-', 'LineWidth', 1.5);
ylabel('Rpm (Duty Cicle)');

yyaxis right
plot(tiempo, rpm, 'r-', 'LineWidth', 1.5);
ylabel('Temperatura [°C]');

xlabel('Tiempo [s]');
title('Respuesta del motor ante un escalón de voltaje');
legend('Voltaje de entrada', 'Respuesta en temperatura', 'Location', 'best');
grid on;

% --- Crear objeto de identificación de sistema ---
Ts = mean(diff(tiempo));        % tiempo de muestreo aproximado
datos_id = iddata(rpm, voltaje, Ts); % salida, entrada, Ts

% --- Ajustar modelo de primer orden ---
orden = 1; % puedes probar con 2 si el modelo no ajusta bien
modelo_tf = tfest(datos_id, orden);

% Mostrar la función de transferencia obtenida
disp('=== Función de transferencia estimada ===');
modelo_tf

% --- Comparar modelo con datos reales ---
figure;
compare(datos_id, modelo_tf);
title('Comparación entre modelo estimado y datos reales');
