%%
% 2022秋
clear; clc;
n = 200;
colors = [
    "#0072BD";
    "#D95319";
    "#EDB120";
    "#7E2F8E";
    "#77AC30";
    "#4DBEEE";
    "#A2142F"
];

% plot3(0,0,0)

figure;
s = 20;

plot3(0,0,0)
k1 = 50; k2 = 50; k3 = 50;

% zの定義域
a = 0; b = 4;

span = floor((n+1)/length(colors));
% disp(span);
surp_size = n+1 - span*length(colors);
% disp(surp_size);
color_index = 1;

% 一区間の長さ
span = span + 1;
% カウンター
counter = 1;
surplus_counter = 0;
disp('start');


hold on;
% 底面塗る
r = 1;
theta = linspace(0, 2*pi, 100);
x = r * cos(theta) + 1;
y = r * sin(theta);
z = 0 * ones(100);
plot3(x, y, z, 'Color', '#0072DB', 'LineWidth', 0.05);
f = fill(x,y,[0.0 0.445 0.85]);
alpha(f, 0.3)

plot3([-10, 10], [0,0], [0,0], 'k');
plot3([0,0], [-10, 10], [0,0], 'k');
plot3([0,0], [0,0], [-10, 10], 'k');

hold off;

for i = 1:n+1
    if counter > span
        counter = 1;
        if surplus_counter ~= -1
            surplus_counter = surplus_counter + 1;
        end
        color_index = color_index + 1;
    end
    if surplus_counter == surp_size
        span = span - 1;
        surplus_counter = -1;
    end

    scolor = colors(color_index);

    z = (b - a) / n * (i-1) + a;

    hold on
    epsilon = 0;
    x1 = linspace(z/(2 - epsilon), sqrt(z)/(1+epsilon), k1);
    x2 = linspace(z/(2 - epsilon), 2-epsilon, k2);
    y1 = real(sqrt(z - x1.^2));
    y2 = sqrt(2*x2 - x2.^2);
    z1 = z * ones(k1);
    z2 = z * ones(k2);
    y3 = -y1;
    y4 = -y2;
    plot3(x1, y1, z1, 'Color', scolor);
    plot3(x2, y2, z2, 'Color', scolor);
    plot3(x1, y3, z1, 'Color', scolor);
    plot3(x2, y4, z2, 'Color', scolor);
    % surf？
    hold off
    counter = counter + 1;
end
% 軸とグリッドの設定
grid on;
axis on;
axis equal;
xlabel('X');
ylabel('Y');
zlabel('Z');
xlim([-0.5, 3]);
ylim([-2, 2]);
zlim([-0.5, 5]);

disp('draw');


%%
% x, y の値を生成
[x, y] = meshgrid(0:0.01:1, 0:0.01:1);

% 関数 z = x^2 + y^2 を計算
z = x.^2 + y.^2;

% プロット
figure;
surf(x, y, z);
title('Graph of z = x^2 + y^2');
xlabel('x');
ylabel('y');
zlabel('z');

%%
% x, y の値を生成
[x, y] = meshgrid(-1:0.01:1, -1:0.01:1);

% 条件を満たす点のみを選択
% validPoints = (x.^2 + y.^2) < 1;
% x = x(validPoints);
% y = y(validPoints);
% z = x.^2 + y.^2;

% メッシュグリッドを再構築
[X, Y] = meshgrid(-1:0.01:1, -1:0.01:1);
Z = X.^2 + Y.^2;

% 条件を満たさない部分を NaN に設定
Z(~((X.^2 + Y.^2) < 1)) = NaN;

% プロット
figure;
surf(X, Y, Z);
title('Graph of z = x^2 + y^2 in x^2 + y^2 < 1');
xlabel('x');
ylabel('y');
zlabel('z');
