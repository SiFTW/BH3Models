% Matlab script to plot data from virtual cell lines for grant application.
% Plotting the Bcl-2 protein expressions across the different cell lines.
% Ielyaas Cloete 04/08/21

close all
clear
clc

%% LOAD DATA FILE(S)

[v,T1,vT] = xlsread('Bcl2_exp_normt_mean.xls');
[u,T2,uT] = xlsread('Expression_sim_mean.xls');
[w,T3,wT] = xlsread('Bcl2_exp_norm.xls');
[r,T4,rT] = xlsread('Bcl2_exp_sim_norm.xls');
[s,T5,sT] = xlsread('Bcl2_dimer_exp_norm.xls');
[t,T6,tT] = xlsread('Bcl2_dimer_sim.xls');
[x,T7,xT] = xlsread('Bcl2_dim_sub_dat.xls');
[y,T8,yT] = xlsread('Bcl2_dim_sub_sim.xls');

%% DATA PREP

% Experimental data 1
Cell_lines_dat = T1(:,1);
Bcl2_dat = v(:,1);
BclxL_dat = v(:,2);
Mcl1_dat = v(:,3);
A1_dat = v(:,4);
BAK_dat = v(:,5);
BAX_dat = v(:,6);
Bim_dat = v(:,7);
Noxa_dat = v(:,8);
Puma_dat = v(:,9);

% Experimental data 2
Proteins_dat = T3(:,1);
RIVA_dat = w(:,1);
U2932_dat = w(:,2);
RCK8_dat = w(:,3);
SUDHL8_dat = w(:,4);
SUDHL10_dat = w(:,5);
U2946_dat = w(:,6);

% Experimental data 3
Dimers_dat = T5(:,1);
RIVA_dim_dat = s(:,1);
U2932_dim_dat = s(:,2);
RCK8_dim_dat = s(:,4);
SUDHL8_dim_dat = s(:,3);
SUDHL_dim_dat = s(:,5);
U2946_dim_dat = s(:,6);

% Experimental data 4 
Dim_dat = T7(:,1);
RIVA_dimer_dat = x(1:2,1);
U2932_dimer_dat = x(1:2,2);
RCK8_dimer_dat = x(3:5,3);
SUDHL8_dimer_dat = x(3:5,4);
SUDHL10_dimer_dat = x(6:end,5);
U2946_dimer_dat = x(6:end,6);

% Model simulations 1
Cell_lines_sim = T2(:,1);
Bcl2_sim = u(:,1);
BclxL_sim = u(:,2);
Mcl1_sim = u(:,3);
A1_sim = u(:,4);
BAK_sim = u(:,5);
BAX_sim = u(:,6);
Bim_sim = u(:,7);
Noxa_sim = u(:,8);
Puma_sim = u(:,9);

% Model simulations 2
Proteins_sim = T4(:,1);
RIVA_sim = r(:,1);
U2932_sim = r(:,2);
RCK8_sim = r(:,3);
RCK8exp_sim = r(:,4);
SUDHL8_sim = r(:,5);
SUDHL10_sim = r(:,6);
U2946_sim = r(:,7);

% Model simulations 3
Dimers_sim = T6(:,1);
U2932_dim = t(:,1);
SUDHL8_dim = t(:,2);

% Model simulations 4
Dim_sim = T8(:,1);
RIVA_dimer_sim = y(1:2,1);
U2932_dimer_sim = y(1:2,2);
RCK8exp_dimer_sim = y(3:5,3);
RCK8_dimer_sim = y(3:5,4);
SUDHL8_dimer_sim = y(3:5,5);
SUDHL10_dimer_sim = y(6:end,6);
U2946_dimer_sim = y(6:end,7);

%% PLOTS

cell = Cell_lines_dat;
Bcl2 = [Bcl2_dat Bcl2_sim];
BclxL = [BclxL_dat BclxL_sim];
Mcl1 = [Mcl1_dat Mcl1_sim];
A1 = [A1_dat A1_sim];
BAK = [BAK_dat BAK_sim];
BAX = [BAX_dat BAX_sim];
Bim = [Bim_dat Bim_sim];
Noxa = [Noxa_dat Noxa_sim];
Puma = [Puma_dat Puma_sim];

protein = Proteins_dat;
RIVA = [RIVA_dat RIVA_sim];
U2932 = [U2932_dat U2932_sim];
SUDHL8 = [SUDHL8_dat SUDHL8_sim];
SUDHL10 = [SUDHL10_dat SUDHL10_sim];
RCK8 = [RCK8_dat RCK8_sim];
RCK8exp = [RCK8_dat RCK8exp_sim];
U2946 = [U2946_dat U2946_sim];

dimers = Dimers_dat;
dim_U2932 = [U2932_dim_dat U2932_dim];
dim_SUDHL8 = [SUDHL8_dim_dat SUDHL8_dim];

dim = Dim_dat;
dimer_RIVA = [RIVA_dimer_dat RIVA_dimer_sim];
dimer_U2932 = [U2932_dimer_dat U2932_dimer_sim];
dimer_RCK8exp = [RCK8_dimer_dat RCK8exp_dimer_sim];
dimer_RCK8 = [RCK8_dimer_dat RCK8_dimer_sim];
dimer_SUDHL8 = [SUDHL8_dimer_dat SUDHL8_dimer_sim];
dimer_SUDHL10 = [SUDHL10_dimer_dat SUDHL10_dimer_sim];
dimer_U2946 = [U2946_dimer_dat U2946_dimer_sim];

RIVA_dim_dat_Bcl2 = [];
names_cell = {'RIVA'; 'U2932';'SUDHL8';'RC-K8';'SUDHL10';'U2946'};
names_protein = {'Bcl-2';'Bcl-x_L';'Mcl1';'A1';'BAK';...
                'BAX';'Bim';'Noxa';'Puma'};
names_dimers_1 = {'BAX+Bcl-2';'Bim+Bcl-2'};  
names_dimers_2 = {'BAX+Bcl-x_L';'BAK+Bcl-x_L';...
                'Bim+Bcl-x_L'};
names_dimers_3 = {'BAX+Mcl1';'BAK+Mcl1';...
                'Bim+Mcl1';'Noxa+Mcl1'};
            
names_dim_sub = {'Data';'Simulation'};

% figure(1)
% t1 = tiledlayout(2,4,'TileSpacing','Compact');
% 
% nexttile
% bar(Bcl2);
% title('Bcl-2','FontSize',25)
% set(gca,'xtick',[1:6],'xticklabel',names_cell)
% xtickangle(90)
% ax=gca;
% set(ax,'Linewidth',1)
% ax.FontSize=20;
% 
% nexttile
% bar(BclxL);
% title('Bcl-x_L','FontSize',25)
% set(gca,'xtick',[1:6],'xticklabel',names_cell)
% xtickangle(90)
% ax=gca;
% set(ax,'Linewidth',1)
% ax.FontSize=20;
% 
% nexttile
% bar(Mcl1);
% title('Mcl1','FontSize',25)
% set(gca,'xtick',[1:6],'xticklabel',names_cell)
% xtickangle(90)
% ax=gca;
% set(ax,'Linewidth',1)
% ax.FontSize=20;
% 
% % nexttile
% % bar(A1);
% % title('A1','FontSize',25)
% % set(gca,'xtick',[1:6],'xticklabel',names_cell)
% % xtickangle(90)
% % ax=gca;
% % set(ax,'Linewidth',1)
% % ax.FontSize=20;
% 
% nexttile
% bar(BAK);
% title('BAK','FontSize',25)
% set(gca,'xtick',[1:6],'xticklabel',names_cell)
% xtickangle(90)
% ax=gca;
% set(ax,'Linewidth',1)
% ax.FontSize=20;
% 
% nexttile
% bar(BAX);
% title('BAX','FontSize',25)
% set(gca,'xtick',[1:6],'xticklabel',names_cell)
% xtickangle(90)
% ax=gca;
% set(ax,'Linewidth',1)
% ax.FontSize=20;
% 
% nexttile
% bar(Bim);
% title('Bim','FontSize',25)
% set(gca,'xtick',[1:6],'xticklabel',names_cell)
% xtickangle(90)
% ax=gca;
% set(ax,'Linewidth',1)
% ax.FontSize=20;
% 
% nexttile
% bar(Noxa);
% title('Noxa','FontSize',25)
% set(gca,'xtick',[1:6],'xticklabel',names_cell)
% xtickangle(90)
% ax=gca;
% set(ax,'Linewidth',1)
% ax.FontSize=20;
% 
% nexttile
% bar(Puma);
% title('Puma','FontSize',25)
% set(gca,'xtick',[1:6],'xticklabel',names_cell)
% xtickangle(90)
% ax=gca;
% set(ax,'Linewidth',1)
% ax.FontSize=20;
% 
% % nexttile
% % lh =legend('Data','Sim','Location','southeastOutside',...
% %     'Orientation','Horizontal','FontSize',20);
% % lh.Layout.Tile = 'South';
% 
% lh =legend({'Data: Smith et al. 2020', 'Simulation'},...
%     'NumColumns',1,'Location','southeastOutside',...
%     'Orientation','Horizontal','FontSize',25);
% lh.Layout.Tile = 'south';
% 
% % title(t,'Size vs. Distance')
% xlabel(t1,'Cell lines','FontSize',30)
% ylabel(t1,'Relative protein abundance','FontSize',30)
% 
% set(gcf,'position',[10,10,2000,1400]) %[xpos, ypos, Width, Height]
% % saveas(gcf,'By_cell_line','epsc')

% figure(2)
% t2 = tiledlayout(1,1,'TileSpacing','Compact');
% 
% nexttile
% b1 = bar(RIVA,'FaceColor','flat');
% % title('RIVA','FontSize',50)
% set(gca,'xtick',[1:9],'xticklabel',names_protein)
% xtickangle(90)
% ax=gca;
% set(ax,'Linewidth',1)
% ax.FontSize=50;
% b1(1).FaceColor = [66 135 245]./255;
% b1(2).FaceColor = [245 135 66]./255;
% 
% nexttile
% b4 = bar(RCK8,'FaceColor','flat');
% % title('RC-K8','FontSize',20)
% set(gca,'xtick',[1:9],'xticklabel',names_protein)
% xtickangle(90)
% ax=gca;
% set(ax,'Linewidth',1)
% ax.FontSize=50;
% b4(1).FaceColor = [66 135 245]./255;
% b4(2).FaceColor = [245 135 66]./255;
% 
% % nexttile
% % b4 = bar(RCK8exp,'FaceColor','flat');
% % title('RC-K8','FontSize',50)
% % set(gca,'xtick',[1:9],'xticklabel',names_protein)
% % xtickangle(90)
% % ax=gca;
% % set(ax,'Linewidth',1)
% % ax.FontSize=50;
% % b4(1).FaceColor = [0.2 0.6 0.5];
% % b4(2).FaceColor = [0.6350 0.0780 0.1840];
% 
% nexttile
% b5 = bar(SUDHL10,'FaceColor','flat');
% % title('SUDHL10','FontSize',20)
% set(gca,'xtick',[1:9],'xticklabel',names_protein)
% xtickangle(90)
% ax=gca;
% set(ax,'Linewidth',1)
% ax.FontSize=50;
% b5(1).FaceColor = [66 135 245]./255;
% b5(2).FaceColor = [245 135 66]./255;
% % 
% nexttile
% b2 = bar(U2932,'FaceColor','flat');
% % title('U2932','FontSize',20)
% set(gca,'xtick',[1:9],'xticklabel',names_protein)
% xtickangle(90)
% ax=gca;
% set(ax,'Linewidth',1)
% ax.FontSize=50;
% b2(1).FaceColor = [66 135 245]./255;
% b2(2).FaceColor = [245 135 66]./255; 
% 
% nexttile
% b3 = bar(SUDHL8,'FaceColor','flat');
% % title('SUDHL8','FontSize',20)
% set(gca,'xtick',[1:9],'xticklabel',names_protein)
% xtickangle(90)
% ax=gca;
% set(ax,'Linewidth',1)
% ax.FontSize=50;
% b3(1).FaceColor = [66 135 245]./255;
% b3(2).FaceColor = [245 135 66]./255;
% 
% nexttile
% b6 = bar(U2946,'FaceColor','flat');
% % title('U2946','FontSize',20)
% set(gca,'xtick',[1:9],'xticklabel',names_protein)
% xtickangle(90)
% ax=gca;
% set(ax,'Linewidth',1)
% ax.FontSize=50;
% b6(1).FaceColor = [66 135 245]./255;
% b6(2).FaceColor = [245 135 66]./255;
% 
% % nexttile
% % lh =legend('Data','Sim','Location','southeastOutside',...
% %     'Orientation','Horizontal','FontSize',20);
% % lh.Layout.Tile = 'South';
% 
% % lh =legend({'Data: Smith et al. 2020', 'Simulation'},...
% %     'NumColumns',1,'Location','southeastOutside',...
% %     'Orientation','Horizontal','FontSize',20);
% % lh.Layout.Tile = 'South';
% 
% % title(t,'Size vs. Distance')
% xlabel(t2,'Proteins','FontSize',40)
% ylabel(t2,'Relative protein abundance','FontSize',40)
% 
% set(gcf,'position',[10,10,1400,1000]) %[xpos, ypos, Width, Height]
% saveas(gcf,'U2946_protein','epsc')

figure(3)
t2 = tiledlayout(1,1,'TileSpacing','Compact');
% 
% nexttile
% b1 = bar(dimer_RIVA','stacked','FaceColor','flat');
% title('RIVA','FontSize',50)
% set(gca,'xtick',[1:2],'xticklabel',names_dim_sub)
% ylim([0 1.1])
% xtickangle(0)
% ax=gca;
% set(ax,'Linewidth',1)
% ax.FontSize=50;
% b1(1).FaceColor = [4 79 31]./255;
% b1(2).FaceColor = [18 9 133]./255;
% 
% nexttile
% b2 = bar(dimer_RCK8','stacked','FaceColor','flat');
% title('RCK8','FontSize',50)
% set(gca,'xtick',[1:2],'xticklabel',names_dim_sub)
% ylim([0 1.1])
% xtickangle(0)
% ax=gca;
% set(ax,'Linewidth',1)
% ax.FontSize=50;
% b2(1).FaceColor = [4 79 31]./255;
% b2(2).FaceColor = [79 219 130]./255;
% b2(3).FaceColor = [18 9 133]./255;
% 
% % nexttile
% % b2 = bar(dimer_RCK8exp,'FaceColor','flat');
% % title('RC-K8','FontSize',50)
% % set(gca,'xtick',[1:10],'xticklabel',names_dimers_2)
% % xtickangle(45)
% % ax=gca;
% % set(ax,'Linewidth',1)
% % ax.FontSize=40;
% % b2(1).FaceColor = [0.5020    0.5020    0.5020];
% % b2(2).FaceColor = [0.7176    0.2745    1.0000];
% 
% nexttile
% b3 = bar(dimer_SUDHL10','stacked','FaceColor','flat');
% title('SUDHL10','FontSize',50)
% set(gca,'xtick',[1:2],'xticklabel',names_dim_sub)
% ylim([0 1.1])
% xtickangle(0)
% ax=gca;
% set(ax,'Linewidth',1)
% ax.FontSize=50;
% b3(1).FaceColor = [4 79 31]./255;
% b3(2).FaceColor = [79 219 130]./255;
% b3(3).FaceColor = [18 9 133]./255;
% b3(4).FaceColor = [90 81 219]./255;
% 
% nexttile
% b4 = bar(dimer_U2932','stacked','FaceColor','flat');
% title('U2932','FontSize',50)
% set(gca,'xtick',[1:2],'xticklabel',names_dim_sub)
% ylim([0 1.1])
% xtickangle(0)
% ax=gca;
% set(ax,'Linewidth',1)
% ax.FontSize=50;
% b4(1).FaceColor = [4 79 31]./255;
% b4(2).FaceColor = [18 9 133]./255;
% 
% nexttile
% b5 = bar(dimer_SUDHL8','stacked','FaceColor','flat');
% title('SUDHL8','FontSize',50)
% set(gca,'xtick',[1:2],'xticklabel',names_dim_sub)
% ylim([0 1.1])
% xtickangle(0)
% ax=gca;
% set(ax,'Linewidth',1)
% ax.FontSize=50;
% b5(1).FaceColor = [4 79 31]./255;
% b5(2).FaceColor = [79 219 130]./255;
% b5(3).FaceColor = [18 9 133]./255;
% 
% nexttile
% b6 = bar(dimer_U2946','stacked','FaceColor','flat');
% title('U2946','FontSize',50)
% set(gca,'xtick',[1:2],'xticklabel',names_dim_sub)
% ylim([0 1.1])
% xtickangle(0)
% ax=gca;
% set(ax,'Linewidth',1)
% ax.FontSize=50;
% b6(1).FaceColor = [4 79 31]./255;
% b6(2).FaceColor = [79 219 130]./255;
% b6(3).FaceColor = [18 9 133]./255;
% b6(4).FaceColor = [90 81 219]./255;
% % 
% % 
% % % nexttile
% % lh =legend({'Data: Smith et al. 2020', 'Simulation'},...
% %     'NumColumns',1,'Location','southeastOutside',...
% %     'Orientation','Horizontal','FontSize',20);
% % lh.Layout.Tile = 'South';
% 
% % title(t,'Size vs. Distance')
% xlabel(t2,'Dimers','FontSize',40)
% ylabel(t2,{'Relative anti-apoptotic';'heterodimer abundance'},'FontSize',40)
% 
set(gcf,'position',[10,10,1400,1000]) %[xpos, ypos, Width, Height]
saveas(gcf,'RIVA_dimer','epsc')