% Line plot for box

%% Load data

boxd2s0 = [2171.9518, 511.9852, 6000, 0, 0.23385, 0.02824;
2134.9363, 552.6352, 800, 0, 2.6687, 0.69079;
1.7916e+03, 312.97, 1.0482e+04, 79.3494, 0.1709, 0.0299];

boxd2s5 = [1525.5851, 734.2099, 6000, 0, 0.256258, 0.1255;
1306.7351, 743.3901, 800, 0, 1.6334, 0.92924;
1466.76 425.47 18861.13 264.44 0.08 0.02];

boxd2s25 = [1463.0842, 712.9935, 6000, 0 ,0.2463, 0.12244;
1310.3656, 744.3436,800,0, 1.638, 0.93043;
1446.618 410.936 68359.52 1341.007 0.021 0.006];

boxd2s125 = [1416.1503, 744.9932, 6000, 0, 0.3567 0.068994;
1261.0018, 761.5869,800,0, 1.5763, 0.95198;
1360.542764 408.572986 319371.56 6213.854238 0.00426 0.001276;];

boxd10s10 = [1.3596e+03, 341.8681, 4400, 0, 0.30909, 0.0777;
929.5557, 380.6265,1200,0, 0.7746, 0.3172;
1574.89507 302.59329 210377.75 152.55324 0.00749 0.00144];

boxd10s0 = [1.6830e+03, 317.0247, 4400, 0, 0.38263, 0.07209 ;
1.3077e+03, 339.16, 1200, 0, 1.0898, 0.28266;
1542.95152 345.06822 210352.38 118.1579 0.00734 0.00164];

boxd50s0 = [400.7331, 152.3721,4080,0, 0.10021, 0.038103;
217.8248 119.6069 880 0 0.2723 0.1495;
1577.5063492 132.0246783 243449.46 197.5855994 0.0064798 0.0005427];

boxd50s10 = [341.2378, 134.679, 4080, 0, 0.085331, 0.033678;
191.0172, 107.2506, 880, 0, 0.23877, 0.13406;
1583.2399269 160.1264556 247625.57 239.541998 0.0063936 0.0006459];

boxd100s0 = [130.7401, 73.7892,4040,0, 0.032693, 0.018452;
85.6103, 46.9899, 840, 0, 0.1019142, 0.05594;
1566.5295766 104.1618411 478978.82 280.2057462 0.0032706 0.0002175];

boxd100s10 = [114.1189, 59.5151, 4040, 0, 0.028537, 0.014882;
89.8926, 48.8117, 840, 0, 0.107019, 0.058109;
1566.4721242 89.7448082 295062.61 314.4712701 0.0053089 0.0003038];

    
%% Plot dimension

width = 595; %700 for legend
height = 160;

int_ess_1_s0 = [boxd2s0(1,5), boxd10s0(1,5),  boxd50s0(1,5),  boxd100s0(1,5)];
int_ess_5_s0 = [boxd2s0(2,5), boxd10s0(2,5),  boxd50s0(2,5),  boxd100s0(2,5)];
exHMC_5_s0 = [boxd2s0(3,5), boxd10s0(3,5),  boxd50s0(3,5),  boxd100s0(3,5)];

std_int_ess_1_s0 = [boxd2s0(1,6), boxd10s0(1,6),  boxd50s0(1,6),  boxd100s0(1,6)];
std_int_ess_5_s0 = [boxd2s0(2,6), boxd10s0(2,6),  boxd50s0(2,6),  boxd100s0(2,6)];
std_exHMC_5_s0 = [boxd2s0(3,6), boxd10s0(3,6),  boxd50s0(3,6),  boxd100s0(3,6)];


figure
hold on
errorbar([2,10,50,100],int_ess_5_s0./exHMC_5_s0,std_int_ess_5_s0./exHMC_5_s0,'-x','color',[0/255,170/255,191/255],'LineWidth',2)
errorbar([2,10,50,100],int_ess_1_s0./exHMC_5_s0,std_int_ess_1_s0./exHMC_5_s0,'-o','color',[55/255,44/255,129/255],'LineWidth',2)
errorbar([2,10,50,100],exHMC_5_s0./exHMC_5_s0,std_exHMC_5_s0./exHMC_5_s0,'-^','color','red','LineWidth',2)
hold off
set(gcf,'units','points','position',[0,0,width,height])
ylabel('Eff. Samps / Fn evals')
xlabel('Dimension')
%lh = legend('Int ESS(5)','Int ESS(1)','Exact HMC')
%set(lh,'Location','BestOutside','Orientation','vertical')

print(gcf, '-dpdf', 'Dimension');
%clf
%% Plot shift

width = 690; %700 for legend

int_ess_1_d2 = [boxd2s0(1,5), boxd2s5(1,5),  boxd2s25(1,5),  boxd2s125(1,5)];
int_ess_5_d2 = [boxd2s0(2,5), boxd2s5(2,5),  boxd2s25(2,5),  boxd2s125(2,5)];
exHMC_5_d2 = [boxd2s0(3,5), boxd2s5(3,5),  boxd2s25(3,5),  boxd2s125(3,5)];

std_int_ess_1_d2 = [boxd2s0(1,6), boxd2s5(1,6),  boxd2s25(1,6),  boxd2s125(1,6)];
std_int_ess_5_d2 = [boxd2s0(2,6), boxd2s5(2,6),  boxd2s25(2,6),  boxd2s125(2,6)];
std_exHMC_5_d2 = [boxd2s0(3,6), boxd2s5(3,6),  boxd2s25(3,6),  boxd2s125(3,6)];

figure
hold on
errorbar([0,5,25,125],int_ess_5_d2./exHMC_5_d2,std_int_ess_5_d2./exHMC_5_d2,'-x','color',[0/255,170/255,191/255],'LineWidth',2)
errorbar([0,5,25,125],int_ess_1_d2./exHMC_5_d2,std_int_ess_1_d2./exHMC_5_d2,'-o','color',[55/255,44/255,129/255],'LineWidth',2)
errorbar([0,5,25,125],exHMC_5_d2./exHMC_5_d2,std_exHMC_5_d2./exHMC_5_d2,'-^','color','red','LineWidth',2)
hold off
set(gcf,'units','points','position',[0,0,width,height])
ylabel('Eff. Samps / Fn evals')
xlabel('Shift')
lh = legend('Ana EPESS(5)','Ana EPESS(1)','Exact HMC')
set(lh,'Location','BestOutside','Orientation','vertical')
set(gca,'yscale','log')
set(gca,'xscale','log')
axis([0,130,0,1000])

print(gcf, '-dpdf', 'Shift');
clf