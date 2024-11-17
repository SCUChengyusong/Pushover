clc;clear;
Stress = 255:25:480;
for i = 1:length(Stress)
    u_top = readmatrix([num2str(Stress(i)), '_u.txt']);
    f1_base = readmatrix([num2str(Stress(i)), '_f1.txt']);
    f2_base = readmatrix([num2str(Stress(i)), '_f2.txt']);
    Step = readmatrix('Step.txt');
    P_Y = Step(i,2);
    Result = [u_top,(f1_base(:,2)+2*f2_base(:,2))./1e6];
    [Value, P_B] = min(Result(:,3));
    Y_D(i) = Result(P_Y,2);
    B_D(i) = Result(P_B(1),2);
end

Y1 = 0.003032; 
Y2 = 0.1284;
B1 = 0.003791;
B2 = 0.8912;
dx = 250:1:500;
Y = Y1.*dx+Y2;
B = B1.*dx+B2;

figure(1)
hold on
F11 = plot(Stress,Y_D, 'ok', 'linewidth', 2, 'MarkerSize', 8);
F12 = plot(Stress,B_D, 'or', 'linewidth', 2, 'MarkerSize', 8);
F13 = plot(dx,Y, '--k', 'linewidth', 1.5);
F14 = plot(dx,B, '--r', 'linewidth', 1.5);
xlabel('Material yielding stress (MPa)');
ylabel('Tower top displacement (m)');
box on;
title('Pushover results')
L1 = legend('Yielding', 'Buckling','y = 0.003836*x + 0.1172','y = 0.005324*x + 0.8635');
set(L1, 'box', 'off', 'FontSize',15);
set(gca, 'FontName', 'Times New Roman', 'FontSize', 15)


stress = 355;
u_top = readmatrix([num2str(stress), '_u.txt']);
f1_base = readmatrix([num2str(stress), '_f1.txt']);
f2_base = readmatrix([num2str(stress), '_f2.txt']);
Result = [u_top,(f1_base(:,2)+2*f2_base(:,2))./1e6];
[px, py] = max(abs(Result(:,3)));
figure(2)
hold on
plot(Result(1:end,2), -Result(1:end,3), '-k', 'linewidth', 2);
plot(Result(31,2), -Result(31,3), 'or', 'MarkerFaceColor', 'r', 'MarkerSize', 8);
plot(Result(py,2), -Result(py,3), 'or', 'MarkerFaceColor', 'r', 'MarkerSize', 8);
xlabel('Tower top displacement (m)');
ylabel('Base reaction force (MN)');
title('Yielding stress = 355 MPa')
box on;
set(gca, 'FontName', 'Times New Roman', 'FontSize', 15)


