%%
% 2023春
clear; clc;
n = 70;

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

a = 0; b = 2;

span = floor((n+1)/length(colors));
disp(span);
% 1だけ多い区間数
surp_size = n+1 - span*length(colors);
disp(surp_size);
color_index = 1;

% 一区間の長さ
span = span + 1;
% カウンター
counter = 1;
surplus_counter = 0;
disp('start');

for i = 1:(n+1)
    % 一周期終わったらcounterをリセット・1だけ多い区間のカウントを増やす
    if counter > span
        counter = 1;
        if surplus_counter ~= -1
            surplus_counter = surplus_counter + 1;
        end
        color_index = color_index + 1;
        disp('chipi chapa');
    end
    % ちょっと多い区間を終える
    if surplus_counter == surp_size
        span = span - 1;
        surplus_counter = -1;
        disp('-')
    end

    scolor = colors(color_index);

    z = (b-a) / (n) * (i-1) + a;
    hold on;
    x1 = z^2/4 * ones(k1);
    x2 = linspace(z^2/4, 1, k2);
    x3 = linspace(z^2/4, 1, k3);
    y1 = linspace(0,sqrt((z^2/4) - (z^2/4)^2), k1);
    y2 = 0 * ones(k2);
    y3 = sqrt(x3 - x3.^2);
    z1 = z * ones(k1);
    z2 = z * ones(k2);
    z3 = z * ones(k3);
    plot3(x1, y1, z1, 'Color',scolor);
    plot3(x2, y2, z2, 'Color',scolor);
    plot3(x3, y3, z3, 'Color',scolor);
    hold off

    disp([color_index counter]);
    counter = counter + 1;
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
zlim([-0.5, 3]);

%%
clear; clc;
n = 100;
m = 12;
result = divideApproximately(n, m);
disp(result);
%%
clear; clc;
n = 8;
m = 7;
displayDividedNumbers(n, m);


%%
function result = divideApproximately(n, m)
    % nをm等分する

    % m等分する各部分のサイズを計算
    sizeEachPart = floor(n / m);

    % m等分した後の余りを計算
    remainder = n - sizeEachPart * m;

    % 結果を格納する配列の初期化
    result = zeros(1, m);

    % 各部分にサイズを割り当てる
    for i = 1:m
        % 各部分にプラスマイナス1を適用する
        result(i) = sizeEachPart + sign(remainder);

        % 余りを更新
        remainder = remainder - sign(remainder);
    end
end


function result = displayDividedNumbers(n, m)
    % 1からnまでの数値を大体m等分して表示

    % divideApproximately関数を使用して数値をm等分
    dividedNumbers = divideApproximately(n, m);

    % 結果を格納する配列の初期化
    result = [];

    % 各部分に対応する数字を生成
    for i = 1:m
        result = [result, i*ones(1, dividedNumbers(i))];
    end

    % 結果を表示
    disp(result);
end
