clc; clear all; close all;
set(0,'DefaultAxesFontSize',16);

%% IMPORT BRAIN DATA
[~, ~, raw] = xlsread('2005_Brain_Female.xlsx','Sheet1');
raw = raw(2:end,:);

%% Replace non-numeric cells with 0.0
R = cellfun(@(x) ~isnumeric(x) || isnan(x),raw); % Find non-numeric cells
raw(R) = {0.0}; % Replace non-numeric cells

%% Create output variable
Brain_Female_2005 = cell2mat(raw);

%% Clear temporary variables
clearvars raw R;

%% Import the data
[~, ~, raw] = xlsread('2006_Brain_Female.xlsx','Sheet1');
raw = raw(2:end,:);

%% Replace non-numeric cells with 0.0
R = cellfun(@(x) ~isnumeric(x) || isnan(x),raw); % Find non-numeric cells
raw(R) = {0.0}; % Replace non-numeric cells

%% Create output variable
Brain_Female_2006 = cell2mat(raw);

%% Clear temporary variables
clearvars raw R;

%% Import the data
[~, ~, raw] = xlsread('2007_Brain_Female.xlsx','Sheet1');
raw = raw(2:end,:);

%% Replace non-numeric cells with 0.0
R = cellfun(@(x) ~isnumeric(x) || isnan(x),raw); % Find non-numeric cells
raw(R) = {0.0}; % Replace non-numeric cells

%% Create output variable
Brain_Female_2007 = cell2mat(raw);

%% Clear temporary variables
clearvars raw R;

%% Import the data
[~, ~, raw] = xlsread('2008_Brain_Female.xlsx','Sheet1');
raw = raw(2:end,:);

%% Replace non-numeric cells with 0.0
R = cellfun(@(x) ~isnumeric(x) || isnan(x),raw); % Find non-numeric cells
raw(R) = {0.0}; % Replace non-numeric cells

%% Create output variable
Brain_Female_2008 = cell2mat(raw);

%% Clear temporary variables
clearvars raw R;

%% IMPORT BREAST DATA
[~, ~, raw] = xlsread('2005_FemaleBreast_Female.xlsx','Sheet1');
raw = raw(2:end,:);

%% Replace non-numeric cells with 0.0
R = cellfun(@(x) ~isnumeric(x) || isnan(x),raw); % Find non-numeric cells
raw(R) = {0.0}; % Replace non-numeric cells

%% Create output variable
FemaleBreast_Female_2005 = cell2mat(raw);

%% Clear temporary variables
clearvars raw R;

%% Import the data
[~, ~, raw] = xlsread('2006_FemaleBreast_Female.xlsx','Sheet1');
raw = raw(2:end,:);

%% Replace non-numeric cells with 0.0
R = cellfun(@(x) ~isnumeric(x) || isnan(x),raw); % Find non-numeric cells
raw(R) = {0.0}; % Replace non-numeric cells

%% Create output variable
FemaleBreast_Female_2006 = cell2mat(raw);

%% Clear temporary variables
clearvars raw R;

%% Import the data
[~, ~, raw] = xlsread('2007_FemaleBreast_Female.xlsx','Sheet1');
raw = raw(2:end,:);

%% Replace non-numeric cells with 0.0
R = cellfun(@(x) ~isnumeric(x) || isnan(x),raw); % Find non-numeric cells
raw(R) = {0.0}; % Replace non-numeric cells

%% Create output variable
FemaleBreast_Female_2007 = cell2mat(raw);

%% Clear temporary variables
clearvars raw R;

%% Import the data
[~, ~, raw] = xlsread('2008_FemaleBreast_Female.xlsx','Sheet1');
raw = raw(2:end,:);

%% Replace non-numeric cells with 0.0
R = cellfun(@(x) ~isnumeric(x) || isnan(x),raw); % Find non-numeric cells
raw(R) = {0.0}; % Replace non-numeric cells

%% Create output variable
FemaleBreast_Female_2008 = cell2mat(raw);

%% Clear temporary variables
clearvars raw R;

%Brain: NorthEast Region
year=[2005:2008];
whites_aggregate_incidence_counts_NE=sum([Brain_Female_2005(1:9,5) Brain_Female_2006(1:9,5) Brain_Female_2007(1:9,5) Brain_Female_2008(1:9,5)],1);
blacks_aggregate_incidence_counts_NE=sum([Brain_Female_2005(1:9,7) Brain_Female_2006(1:9,7) Brain_Female_2007(1:9,7) Brain_Female_2008(1:9,7)],1);
aggregate_incidence_counts_NE=whites_aggregate_incidence_counts_NE+blacks_aggregate_incidence_counts_NE;

%Brain: MidWest Region
year=[2005:2008];
whites_aggregate_incidence_counts_MW=sum([Brain_Female_2005(10:21,5) Brain_Female_2006(10:21,5) Brain_Female_2007(10:21,5) Brain_Female_2008(10:21,5)],1);
blacks_aggregate_incidence_counts_MW=sum([Brain_Female_2005(10:21,7) Brain_Female_2006(10:21,7) Brain_Female_2007(10:21,7) Brain_Female_2008(10:21,7)],1);
aggregate_incidence_counts_MW=whites_aggregate_incidence_counts_MW+blacks_aggregate_incidence_counts_MW;

%Brain: South Region
year=[2005:2008];
whites_aggregate_incidence_counts_S=sum([Brain_Female_2005(22:38,5) Brain_Female_2006(22:38,5) Brain_Female_2007(22:38,5) Brain_Female_2008(22:38,5)],1);
blacks_aggregate_incidence_counts_S=sum([Brain_Female_2005(22:38,7) Brain_Female_2006(22:38,7) Brain_Female_2007(22:38,7) Brain_Female_2008(22:38,7)],1);
aggregate_incidence_counts_S=whites_aggregate_incidence_counts_S+blacks_aggregate_incidence_counts_S;

%Brain: West Region
year=[2005:2008];
whites_aggregate_incidence_counts_W=sum([Brain_Female_2005(39:51,5) Brain_Female_2006(39:51,5) Brain_Female_2007(39:51,5) Brain_Female_2008(39:51,5)],1);
blacks_aggregate_incidence_counts_W=sum([Brain_Female_2005(39:51,7) Brain_Female_2006(39:51,7) Brain_Female_2007(39:51,7) Brain_Female_2008(39:51,7)],1);
aggregate_incidence_counts_W=whites_aggregate_incidence_counts_W+blacks_aggregate_incidence_counts_W;

figure(1)
plot(year,aggregate_incidence_counts_NE,'r',year,aggregate_incidence_counts_MW,'g',year,aggregate_incidence_counts_S,'m',year,aggregate_incidence_counts_W,'c','LineWidth',2)
hold on
plot(year,aggregate_incidence_counts_NE,'kd',year,aggregate_incidence_counts_MW,'k^',year,aggregate_incidence_counts_S,'k+',year,aggregate_incidence_counts_W,'kx','LineWidth',2)
title('Brain Cancer prevalence among females of all races in the entire US','FontSize',25,'FontWeight','bold')
legend('NorthEast','Midwest','South','West')
xlabel('Year','FontSize',25,'FontWeight','bold')
ylabel('Incidence counts','FontSize',25,'FontWeight','bold')


%Breast: NorthEast Region
year=[2005:2008];
whites_aggregate_incidence_counts_NE=sum([FemaleBreast_Female_2005(1:9,5) FemaleBreast_Female_2006(1:9,5) FemaleBreast_Female_2007(1:9,5) FemaleBreast_Female_2008(1:9,6)],1);
blacks_aggregate_incidence_counts_NE=sum([FemaleBreast_Female_2005(1:9,7) FemaleBreast_Female_2006(1:9,7) FemaleBreast_Female_2007(1:9,7) FemaleBreast_Female_2008(1:9,8)],1);
aggregate_incidence_counts_NE=whites_aggregate_incidence_counts_NE+blacks_aggregate_incidence_counts_NE;

%Breast: MidWest Region
year=[2005:2008];
whites_aggregate_incidence_counts_MW=sum([FemaleBreast_Female_2005(10:21,5) FemaleBreast_Female_2006(10:21,5) FemaleBreast_Female_2007(10:21,5) FemaleBreast_Female_2008(10:21,6)],1);
blacks_aggregate_incidence_counts_MW=sum([FemaleBreast_Female_2005(10:21,7) FemaleBreast_Female_2006(10:21,7) FemaleBreast_Female_2007(10:21,7) FemaleBreast_Female_2008(10:21,8)],1);
aggregate_incidence_counts_MW=whites_aggregate_incidence_counts_MW+blacks_aggregate_incidence_counts_MW;

%Breast: South Region
year=[2005:2008];
whites_aggregate_incidence_counts_S=sum([FemaleBreast_Female_2005(22:38,5) FemaleBreast_Female_2006(22:38,5) FemaleBreast_Female_2007(22:38,5) FemaleBreast_Female_2008(22:38,6)],1);
blacks_aggregate_incidence_counts_S=sum([FemaleBreast_Female_2005(22:38,7) FemaleBreast_Female_2006(22:38,7) FemaleBreast_Female_2007(22:38,7) FemaleBreast_Female_2008(22:38,8)],1);
aggregate_incidence_counts_S=whites_aggregate_incidence_counts_S+blacks_aggregate_incidence_counts_S;

%Breast: West Region
year=[2005:2008];
whites_aggregate_incidence_counts_W=sum([FemaleBreast_Female_2005(39:51,5) FemaleBreast_Female_2006(39:51,5) FemaleBreast_Female_2007(39:51,5) FemaleBreast_Female_2008(39:51,6)],1);
blacks_aggregate_incidence_counts_W=sum([FemaleBreast_Female_2005(39:51,7) FemaleBreast_Female_2006(39:51,7) FemaleBreast_Female_2007(39:51,7) FemaleBreast_Female_2008(39:51,8)],1);
aggregate_incidence_counts_W=whites_aggregate_incidence_counts_W+blacks_aggregate_incidence_counts_W;

figure(2)
plot(year,aggregate_incidence_counts_NE,'r',year,aggregate_incidence_counts_MW,'g',year,aggregate_incidence_counts_S,'m',year,aggregate_incidence_counts_W,'c','LineWidth',2)
hold on
plot(year,aggregate_incidence_counts_NE,'kd',year,aggregate_incidence_counts_MW,'k^',year,aggregate_incidence_counts_S,'k+',year,aggregate_incidence_counts_W,'kx','LineWidth',2)
title('Breast Cancer prevalence among females of all races in the entire US','FontSize',25,'FontWeight','bold')
legend('NorthEast','Midwest','South','West')
xlabel('Year','FontSize',25,'FontWeight','bold')
ylabel('Incidence counts','FontSize',25,'FontWeight','bold')