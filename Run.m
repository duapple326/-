clc

plot( Y )
xlim([0 1826])
ylim([0 inf])
legend('BIT')

y_h_adf = adftest(Y)
y_h_kpss = kpsstest(Y)
Yd1 = diff(Y);
yd1_h_adf = adftest(Yd1)
yd1_h_kpss = kpsstest(Yd1)

figure
subplot(211),autocorr( Y );
subplot(212),parcorr( Y );
figure
dy = diff( Y );
subplot(211),autocorr( dy );
subplot(212),parcorr( dy );


data = Y; %如果要替换数据，将此处data替换即可。
forData1 = zeros(1,1865); %全部初始化为0
for i = 20:1826
    forData1(i+1) = Fun_ARIMA_Forecast(data(1:i),1,2,2,'off');
end

figure()
plot(21:1826,data(21:1826))
hold on
plot(21:1826,forData1(21:1826))
legend('Raw Data','Predictive Value')
