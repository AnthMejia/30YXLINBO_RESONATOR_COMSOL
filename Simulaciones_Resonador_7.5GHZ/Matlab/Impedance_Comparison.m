close all;
clear all;


%% Measured S2P Files to read  Originals%%

Sa81_1400   = sparameters('A81_04_1500.s2p');
Za81_1400   = s2z(Sa81_1400.Parameters);
Z0          = 1;

S11_1400    = reshape(Sa81_1400.Parameters(1,1,:),[],1);

[Zin]       = S2p_to_Zin(Sa81_1400);
Zin         = reshape(Zin,[],1).';


%% Measure 1D Simulation
% fileID = 'D:\TFM\Comsol_Files\Simulation_Grafics\Simulacion_1D\Smith\1500_Smith_CU_L.txt';
% IDT_Y=load('30XY_LINBO_81_40_1400_2D_Q1200.txt');
% IDT_Y = importdata(fileID);
% IDT_Y=IDT_Y.data;
% IDT_Y2=load('30XY_LINBO_81_40_1400_2D_Q1200.txt');
% IDT_Y3=load('30XY_LINBO_81_40_1400_3D_Q1200.txt');\Mason\1500_Mason_CU_L.txt
% fileID2 = 'D:\TFM\Comsol_Files\Simulation_Grafics\Simulacion_1D\Mason\1500_Mason_81_G_L.txt';
% IDT_Y2 = importdata(fileID2);
% IDT_Y2=IDT_Y2.data;

IDT_YJN=load('30XY_LINOI_7.5GHZ_2D_PML_SiO2_Last.txt');
IDT_YJ=load('30XY_LINOI_7.5GHZ_3D_PML_SiO2_603_CU.txt');%celda unitaria
%% Measure 2D and 3D simulation 

%  Sim_1400_2D = load('30XY_LINBO_81_40_1500_2D_Q1200.txt');
%  Sim_1400_3D= load('30XY_LINBO_81_40_1500_3D_Q1200.txt');


% Plot Measure curve
% hold on;
% plot(Sa81_1400.Frequencies./1e6, 20*log10(abs(Zin)),'Color','#808080','LineWidth',1)
% hold on;
% xlim([1090 1800])
% ylim([10 80])
% xticks(1090:100:1800)
% yticks(10:10:80)
% 
%% Plot 1D measure 
%  createfigure(Sa81_1400.Frequencies./1e6,20*log10(abs(Zin)),IDT_YJ(:,1)./1E6,IDT_YJ(:,2),IDT_YJN(:,1)./1E6,IDT_YJN(:,2))
hold on
plot(IDT_YJ(:,1),24.43/34.29.* IDT_YJ(:,2),'DisplayName','\lambda=575.91 nm 81f40g.','Color','g','LineWidth',1)
xlim([7200 8300])
ylim([-10 60])
hold on 
grid on
plot(IDT_YJN(:,1), IDT_YJN(:,2),'r','LineWidth',1.6)
 legend('3D FEM CU (SiO2=121.86 nm) ','3D FEM 81 (SiO2=121.86 nm) ','FontName','Times','Location','southeast')  
% createfigure(Sa81_1400.Frequencies./1e6,20*log10(abs(Zin)),IDT_Y(:,1)./1E6,44.9482/28.2106.*IDT_Y(:,2),IDT_Y2(:,1),45.0678/50.262.*IDT_Y2(:,2),IDT_Y3(:,1),45.0678/47.5348*IDT_Y3(:,2))
%% Section to put max and minims
[y,x]= findpeaks(IDT_Y2(:,2));
[y1,x1]= findpeaks(-IDT_Y2(:,2));
% K2=(pi/2)*(IDT_Y(x(2),1)/IDT_Y(x1(1),1))*tan((pi/2)*(IDT_Y(x(2),1)-IDT_Y(x1(1),1))/IDT_Y(x(2),1));
 K2=(pi^2/8)*((IDT_Y2(x(3),1).^2)-(IDT_Y2(x1(3),1).^2))/(IDT_Y2(x1(3),1).^2);
% # show X and Y coordinate
hold on
text(IDT_Y2(x(2),1)/1E6,y(2),strcat('[',num2str(IDT_Y2(x(2),1)/1E6),',',num2str(y(2),4),']'),'horiz','center','vert','bottom')
text(IDT_Y2(x1(1),1)/1E6,-y1(1),strcat('[',num2str(IDT_Y2(x1(1),1)/1E6),',',num2str(-y1(1),4),']'),'horiz','center','vert','bottom')
%  plot(IDT_Y(:,1), 40.53/45.27*IDT_Y(:,2),'b','LineWidth',1.6);
% legend('Meas.','1D MASON (\lambda=1500 \mum)' ,'FontName','Times','Location','southeast')  
% xlabel('Frequency(MHz)','FontName','Times')
% ylabel('Electrical Impedance (dB\Omega)','FontName','Times')
% grid on 
%% Plot 2D and 3D simulation
% hold on;
%  plot(Sim_1400_2D(:,1), 40.53/45.27*Sim_1400_2D(:,2),'b','LineWidth',1.6);%40.53/72.1017.*

%  plot(Sim_1400_3D(:,1),40.53/42.45.*Sim_1400_3D(:,2),'r','LineWidth',1.6) % 45.3/50.4.* 45.0678/50.9368.* 44.5831/86.5295.*
% %   legend('Meas.','2D FEM (\lambda=1400 \mum) ','Meas.','2D FEM (\lambda=1450 \mum) ', 'Meas.','2D FEM (\lambda=1500 \mum) ','FontName','Times','Location','southeast')
% legend('Meas.','2D FEM (\lambda=1400 \mum) ','3D FEM (\lambda=1400 \mum) ','FontName','Times','Location','southeast')  
% xlabel('Frequency(MHz)','FontName','Times')
%   ylabel('Electrical Impedance (dB\Omega)','FontName','Times')
%   title('Basic Cell','FontName','Times')
%   grid on  



% 
%   % get current axes  MSE
% ax = gca;
% % find object
% h = findall(ax)
% % get Y data of green and blue lines 
% GreenLineX = h(4).XData%Gren
% GreenLineY = h(4).YData
% BlueLineX = h(5).XData
% BlueLineY = h(5).YData%Blue 3
% % eliminate NaN
% BlueLineX = rmmissing(BlueLineX(1100:1800));
% BlueLineY = rmmissing(BlueLineY(1100:1800));
% % interpolation
% GreenLineY_interp = interp1(GreenLineX(201:401),GreenLineY(201:401),BlueLineX,'spline'); 
% % MSE
% MeanSquaredError = mean((GreenLineY_interp - BlueLineY).^2);
% figure
% plot(GreenLineX,GreenLineY,'-g');
% hold on
% plot(BlueLineX,BlueLineY,'-b');

% 
% ER=100*(GreenLineY_interp - BlueLineY)/(GreenLineY_interp);