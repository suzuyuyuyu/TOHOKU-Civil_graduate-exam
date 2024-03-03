%% 
% 2022秋
clear; clc;
n = 50;
colors = {'r', 'g', 'b', 'y', 'm'};

% plot3(0,0,0)

figure;
s = 20;

plot3(0,0,0)
k1 = 50; k2 = 50; k3 = 50;

for i = 0:n-1
    cindex = mod(i,5) + 1;
    % scolor = colors{cindex};
    scolor = 'k';
    % disp(scolor);
    z = 4 / n * i;
    hold on
    epsilon = 0.00000000001;
    x1 = linspace(z/(2 - epsilon), sqrt(z)/(1+epsilon), k1);
    x2 = linspace(z/(2 - epsilon), 2-epsilon, k2);
    y1 = sqrt(z - x1.^2);
    y2 = sqrt(2*x2 - x2.^2);
    z1 = z * ones(k1);
    z2 = z * ones(k2);
    y3 = -y1;
    y4 = -y2;
    plot3(x1, y1, z1, scolor);
    plot3(x2, y2, z2, scolor);
    plot3(x1, y3, z1, scolor);
    plot3(x2, y4, z2, scolor);
    % x = linspace(0,2,100);
    % y = sqrt(2*x - x.^2);
    % zz = x.^2+ y.^2;
    % plot3(x,y,zz);
    % 底面塗る
    % surfで曲面描く？
    hold off
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
xlim([-0.5, 3]);
ylim([-2, 2]);
zlim([-0.5, 5]);
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


