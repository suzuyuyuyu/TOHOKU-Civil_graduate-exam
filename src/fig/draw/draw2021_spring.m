% 2021春

clear; clc;
n = 100;
colors = [
    "#0072BD";
    "#D95319";
    "#EDB120";
    "#7E2F8E";
    "#77AC30";
    "#4DBEEE";
    "#A2142F"
];

figure;
s = 20;

plot3(0,0,0)
k1 = 50; k2 = 50; k3 = 50; k4 = 50;

% zの定義域
a = 0; b = 1;

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

    hold on;
    x1 = linspace(0, 1 - z^2, k1);
    y1 = sqrt(x1 - x1.^2);
    z1 = z * ones(k1);
    plot3(x1, y1, z1, 'Color', scolor);
    x2 = linspace(1 - z^2, sqrt(1-z^2), k2);
    y2 = real(sqrt(1 - z^2 - x2.^2));
    z2 = z * ones(k2);
    plot3(x2, y2, z2, 'Color', scolor);
    x3 = linspace(0, sqrt(1-z^2), k3);
    y3 = 0 * ones(k3);
    z3 = z * ones(k3);
    plot3(x3, y3, z3, 'Color', scolor);
    hold off;
    % disp([color_index counter]);
    counter = counter + 1;
end


hold on;
N = 100;
x = linspace(0, 1, N);
y = sqrt(x - x.^2);
z = sqrt(1 - x.^2 - y.^2);
plot3(x,y,z, 'Color', '#909090');
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

