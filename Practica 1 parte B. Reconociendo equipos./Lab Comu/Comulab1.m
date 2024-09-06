% Datos de entrada
frecuencias = [200, 300, 400];  % Frecuencias en MHz
amplitudes_generadas = [0.5, 0.25, 0.125, 0.0625];  % Amplitudes generadas

% Amplitudes medidas en el osciloscopio para cada frecuencia (valores de ejemplo)
amplitudes_medidas_200MHz = [142.1e-3, 74.48e-3, 41.175e-3, 25.725e-3];  % Medidas para 200 MHz
amplitudes_medidas_300MHz = [77.175e-3, 43.12e-3, 23.4e-3, 9.62e-3]; % Medidas para 300 MHz
amplitudes_medidas_400MHz = [97.265e-3, 63.515e-3, 30.42e-3, 18.718e-3]; % Medidas para 400 MHz

% Crear una tabla para cada frecuencia y calcular el porcentaje
tabla_200MHz = [amplitudes_generadas', amplitudes_medidas_200MHz', ...
                (amplitudes_medidas_200MHz' ./ amplitudes_generadas') * 100];

tabla_300MHz = [amplitudes_generadas', amplitudes_medidas_300MHz', ...
                (amplitudes_medidas_300MHz' ./ amplitudes_generadas') * 100];

tabla_400MHz = [amplitudes_generadas', amplitudes_medidas_400MHz', ...
                (amplitudes_medidas_400MHz' ./ amplitudes_generadas') * 100];

% Mostrar las tablas con encabezados
disp('Tabla para 200 MHz:');
disp(array2table(tabla_200MHz, 'VariableNames', {'Amplitud_Generada', 'Amplitud_Medida', 'Porcentaje'}));

disp('Tabla para 300 MHz:');
disp(array2table(tabla_300MHz, 'VariableNames', {'Amplitud_Generada', 'Amplitud_Medida', 'Porcentaje'}));

disp('Tabla para 400 MHz:');
disp(array2table(tabla_400MHz, 'VariableNames', {'Amplitud_Generada', 'Amplitud_Medida', 'Porcentaje'}));

% Graficar amplitud generada vs amplitud medida para cada frecuencia
figure;
hold on;

plot(amplitudes_generadas, amplitudes_medidas_200MHz, '-o', 'DisplayName', '200 MHz');
plot(amplitudes_generadas, amplitudes_medidas_300MHz, '-s', 'DisplayName', '300 MHz');
plot(amplitudes_generadas, amplitudes_medidas_400MHz, '-d', 'DisplayName', '400 MHz');

xlabel('Amplitud Generada');
ylabel('Amplitud Medida');
title('Amplitud Generada vs Amplitud Medida para Diferentes Frecuencias');
legend;
grid on;
hold off;
