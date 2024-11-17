clc;clear;
Stress = 255:25:480;
for i = 1:length(Stress)
    u_top = readmatrix([num2str(Stress(i)), '-Fod.txt']);
    Step = readmatrix('Step-F.txt');
    P_Y = Step(i,2);
    Y_D(i) = u_top(P_Y,2);
end

Y1 = 0.001499; 
Y2 = 0.01071;
dx = 250:1:500;
Y = Y1.*dx+Y2;

figure(1)
hold on
F11 = plot(Stress,Y_D, 'ok', 'linewidth', 2, 'MarkerSize', 8);
F13 = plot(dx,Y, '--k', 'linewidth', 1.5);
xlabel('Material yielding stress (MPa)');
ylabel('Tower top displacement (m)');
box on;
title('Pushover results')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 15)
