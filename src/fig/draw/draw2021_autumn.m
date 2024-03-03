%%
% 2021秋
clear; clc;
n = 50;
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

a = 0; b = 1;

plot3(0,0,0)
k1 = 50; k2 = 50; k3 = 50; k4 = 50;

span = floor((n+1)/length(colors));
% disp(span);
% 1だけ多い区間数
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
    % 一周期終わったらcounterをリセット・1だけ多い区間のカウントを増やす
    if counter > span
        counter = 1;
        if surplus_counter ~= -1
            surplus_counter = surplus_counter + 1;
        end
        color_index = color_index + 1;
        % disp('chipi chapa');
    end
    % ちょっと多い区間を終える
    if surplus_counter == surp_size
        span = span - 1;
        surplus_counter = -1;
        % disp('-')
    end

    scolor = colors(color_index);

    z = (b - a) / n * (i-1) + a;
    hold on;
    if z < 1/2
        x1 = linspace(0, z, k1);
        y1 = sqrt((1-z)^2 - x1.^2);
        z1 = z * ones(k1);
        plot3(x1, y1, z1, 'Color',scolor);
        x2 = 0 * ones(k2);
        y2 = linspace(0, 1-z, k2);
        z2 = z * ones(k2);
        plot3(x2, y2, z2, 'Color',scolor);
        x3 = z * ones(k3);
        y3 = linspace(0,sqrt(1-2*z),k3);
        z3 = z * ones(k3);
        plot3(x3, y3, z3, 'Color',scolor);
        x4 = linspace(0,z, k4);
        y4 = 0 * ones(k4);
        z4 = z * ones(k4);
        plot3(x4, y4, z4, 'Color',scolor);
    else
        x1 = linspace(0,1-z, k1);
        y1 = sqrt((1-z)^2 - x1.^2);
        z1 = z * ones(k1);
        plot3(x1, y1, z1, 'Color',scolor);
        x2 = 0 * ones(k2);
        y2 = linspace(0, 1-z, k2);
        z2 = z * ones(k2);
        plot3(x2, y2, z2, 'Color',scolor);
        x3 = linspace(0,1-z, k3);
        y3 = 0 * ones(k3);
        z3 = z * ones(k3);
        plot3(x3, y3, z3, 'Color',scolor);
    end
    hold off;
    % disp([color_index counter]);
    counter = counter + 1;
end
% 外側
% for i = 0:floor(n/5)
%     hold on;
%     xout2 = 0 * ones(k2);
%     yout2 = linspace(0, 1-z, k2);
%     zout2 = z * ones(k2);
%     plot3(xout2, yout2, zout2, 'Color',[0.5 0.5 0.5]);
%     xout3 = linspace(0,1-z, k3);
%     yout3 = 0 * ones(k3);
%     zout3 = z * ones(k3);
%     plot3(xout3,yout3,zout3, 'Color',[0.5 0.5 0.5])
%     hold off;
% end



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
%%
