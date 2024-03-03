% 2021春

clear; clc;
n = 50;
colors = {'r', 'g', 'b', 'y', 'm'};

% plot3(0,0,0)

figure;
s = 20;

plot3(0,0,0)
k1 = 50; k2 = 50; k3 = 50; k4 = 50;

% zの定義域
a = 0; b = 1;

for i = 0:n-1
    cindex = mod(i,5) + 1;
    scolor = 'k';
    z = (b-a) / n * (i) + a;
    hold on;
    x1 = linspace(0, 1 - z^2, k1);
    y1 = sqrt(x1 - x1.^2);
    z1 = z * ones(k1);
    plot3(x1, y1, z1, scolor);
    x2 = linspace(1 - z^2, sqrt(1-z^2), k2);
    y2 = sqrt(1 - z^2 - x2.^2);
    z2 = z * ones(k2);
    plot3(x2, y2, z2, scolor);
    x3 = linspace(0, sqrt(1-z^2), k3);
    y3 = 0 * ones(k3);
    z3 = z * ones(k3);
    plot3(x3, y3, z3, scolor);
    hold off;
end


hold on;
plot3([-10, 10], [0,0], [0,0], 'k');
plot3([0,0], [-10, 10], [0,0], 'k');
plot3([0,0], [0,0], [-10, 10], 'k');

hold off;
% 軸とグリッドの設定
grid on;
axis on;
axis equal;
xlabel('X');
ylabel('Y');
zlabel('Z');
xlim([-0.5, 1.5]);
ylim([-0.5, 1.5]);
zlim([-0.5, 1.5]);

