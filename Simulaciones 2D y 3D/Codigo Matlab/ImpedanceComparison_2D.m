close all;
clear all;


%% Measured S2P Files to read  Originals%%

Sa81_1400   = sparameters('A81_04_1500.s2p');
Za81_1400   = s2z(Sa81_1400.Parameters);
Z0          = 1;

S11_1400    = reshape(Sa81_1400.Parameters(1,1,:),[],1);

[Zin]       = S2p_to_Zin(Sa81_1400);
Zin         = reshape(Zin,[],1).';


%% Plot 2D measure 
 IDT_Y=load('30XY_LINBO_81_40_1400_2D_Q1200.txt');
 IDT_Y2=load('30XY_LINBO_81_40_1400_2D_Q1200.txt');
 IDT_Y3=load('30XY_LINBO_81_40_1400_3D_Q1200.txt');
createfigure(Sa81_1400.Frequencies./1e6,20*log10(abs(Zin)),IDT_Y(:,1)./1E6,44.9482/28.2106.*IDT_Y(:,2),IDT_Y2(:,1),45.0678/50.262.*IDT_Y2(:,2),IDT_Y3(:,1),45.0678/47.5348*IDT_Y3(:,2))

hold on 

%% Section to put max and minims
[y,x]= findpeaks(IDT_Y2(:,2));
[y1,x1]= findpeaks(-IDT_Y2(:,2));
K2=(pi^2/8)*((IDT_Y2(x(3),1).^2)-(IDT_Y2(x1(3),1).^2))/(IDT_Y2(x1(3),1).^2);
% # show X and Y coordinate
hold on
text(IDT_Y2(x(2),1)/1E6,y(2),strcat('[',num2str(IDT_Y2(x(2),1)/1E6),',',num2str(y(2),4),']'),'horiz','center','vert','bottom')
text(IDT_Y2(x1(1),1)/1E6,-y1(1),strcat('[',num2str(IDT_Y2(x1(1),1)/1E6),',',num2str(-y1(1),4),']'),'horiz','center','vert','bottom')

