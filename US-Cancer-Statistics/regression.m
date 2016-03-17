clear all; close all; clc
set(0,'DefaultAxesFontSize',16);

%% Import data from spreadsheet
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

%North-East Region
year=[2005:2008];
whites_aggregate_incidence_counts_NE=sum([Brain_Female_2005(1:9,5) Brain_Female_2006(1:9,5) Brain_Female_2007(1:9,5) Brain_Female_2008(1:9,5)],1);
blacks_aggregate_incidence_counts_NE=sum([Brain_Female_2005(1:9,7) Brain_Female_2006(1:9,7) Brain_Female_2007(1:9,7) Brain_Female_2008(1:9,7)],1);

figure(1)
plot(year,whites_aggregate_incidence_counts_NE,'r*','LineWidth',2)
hold on
plot(year,blacks_aggregate_incidence_counts_NE,'g*','LineWidth',2)

p9 = polyfit(year,whites_aggregate_incidence_counts_NE,1);
y1 = polyval(p9,2005:2009);
plot(2005:2009,y1,'LineWidth',2);

p4 = polyfit(year,blacks_aggregate_incidence_counts_NE,1);
y2 = polyval(p4,2005:2009);
plot(2005:2009,y2,'LineWidth',2);

title('Brain & Nervous System Related Cancer among females in the North-East region of US','FontSize',20,'FontWeight','bold')
legend('whites','blacks')
xlabel('Year','FontSize',25,'FontWeight','bold')
ylabel('Incidence counts','FontSize',25,'FontWeight','bold')

%Mid-West Region
year=[2005:2008];
whites_aggregate_incidence_counts_MW=sum([Brain_Female_2005(10:21,5) Brain_Female_2006(10:21,5) Brain_Female_2007(10:21,5) Brain_Female_2008(10:21,5)],1);
blacks_aggregate_incidence_counts_MW=sum([Brain_Female_2005(10:21,7) Brain_Female_2006(10:21,7) Brain_Female_2007(10:21,7) Brain_Female_2008(10:21,7)],1);

figure(2)
plot(year,whites_aggregate_incidence_counts_MW,'r*','LineWidth',2)
hold on
plot(year,blacks_aggregate_incidence_counts_MW,'g*','LineWidth',2)

p9 = polyfit(year,whites_aggregate_incidence_counts_MW,1);
y1 = polyval(p9,2005:2009);
plot(2005:2009,y1,'LineWidth',2);

p4 = polyfit(year,blacks_aggregate_incidence_counts_MW,1);
y2 = polyval(p4,2005:2009);
plot(2005:2009,y2,'LineWidth',2);

title('Brain & Nervous System Related Cancer among females in the Mid-West region of US','FontSize',20,'FontWeight','bold')
legend('whites','blacks')
xlabel('Year','FontSize',25,'FontWeight','bold')
ylabel('Incidence counts','FontSize',25,'FontWeight','bold')

%South Region
year=[2005:2008];
whites_aggregate_incidence_counts_S=sum([Brain_Female_2005(22:38,5) Brain_Female_2006(22:38,5) Brain_Female_2007(22:38,5) Brain_Female_2008(22:38,5)],1);
blacks_aggregate_incidence_counts_S=sum([Brain_Female_2005(22:38,7) Brain_Female_2006(22:38,7) Brain_Female_2007(22:38,7) Brain_Female_2008(22:38,7)],1);

figure(3)
plot(year,whites_aggregate_incidence_counts_S,'r*','LineWidth',2)
hold on
plot(year,blacks_aggregate_incidence_counts_S,'g*','LineWidth',2)

p9 = polyfit(year,whites_aggregate_incidence_counts_S,1);
y1 = polyval(p9,2005:2009);
plot(2005:2009,y1,'LineWidth',2);

p10 = polyfit(year,blacks_aggregate_incidence_counts_S,1);
y2 = polyval(p10,2005:2009);
plot(2005:2009,y2,'LineWidth',2);

title('Brain & Nervous System Related Cancer among females in the South region of US','FontSize',20,'FontWeight','bold')
legend('whites','blacks')
xlabel('Year','FontSize',25,'FontWeight','bold')
ylabel('Incidence counts','FontSize',25,'FontWeight','bold')

%West Region
year=[2005:2008];
whites_aggregate_incidence_counts_W=sum([Brain_Female_2005(39:51,5) Brain_Female_2006(39:51,5) Brain_Female_2007(39:51,5) Brain_Female_2008(39:51,5)],1);
blacks_aggregate_incidence_counts_W=sum([Brain_Female_2005(39:51,7) Brain_Female_2006(39:51,7) Brain_Female_2007(39:51,7) Brain_Female_2008(39:51,7)],1);

figure(4)
plot(year,whites_aggregate_incidence_counts_W,'r*','LineWidth',2)
hold on
plot(year,blacks_aggregate_incidence_counts_W,'g*','LineWidth',2)

p9 = polyfit(year,whites_aggregate_incidence_counts_W,1);
y1 = polyval(p9,2005:2009);
plot(2005:2009,y1,'LineWidth',2);

p10 = polyfit(year,blacks_aggregate_incidence_counts_W,1);
y2 = polyval(p10,2005:2009);
plot(2005:2009,y2,'LineWidth',2);

title('Brain & Nervous System Related Cancer among females in the West region of US','FontSize',20,'FontWeight','bold')
legend('whites','blacks')
xlabel('Year','FontSize',25,'FontWeight','bold')
ylabel('Incidence counts','FontSize',25,'FontWeight','bold')

%Entire US
year=[2005:2008];
whites_aggregate_incidence_counts=sum([whites_aggregate_incidence_counts_NE; whites_aggregate_incidence_counts_MW; whites_aggregate_incidence_counts_S; whites_aggregate_incidence_counts_W],1);
blacks_aggregate_incidence_counts=sum([blacks_aggregate_incidence_counts_NE; blacks_aggregate_incidence_counts_MW; blacks_aggregate_incidence_counts_S; blacks_aggregate_incidence_counts_W],1);

figure(5)
plot(year,whites_aggregate_incidence_counts,'r*','LineWidth',2)
hold on
plot(year,blacks_aggregate_incidence_counts,'g*','LineWidth',2)

p9 = polyfit(year,whites_aggregate_incidence_counts,1);
y1 = polyval(p9,2005:2009);
plot(2005:2009,y1,'LineWidth',2);

p10 = polyfit(year,blacks_aggregate_incidence_counts,1);
y2 = polyval(p10,2005:2009);
plot(2005:2009,y2,'LineWidth',2);

title('Brain & Nervous System Related Cancer among females in the entire US','FontSize',20,'FontWeight','bold')
legend('whites','blacks')
xlabel('Year','FontSize',25,'FontWeight','bold')
ylabel('Incidence counts','FontSize',25,'FontWeight','bold')

%Summary graph - Entire US
year=[2005:2008];
whites_aggregate_incidence_counts_US=sum([Brain_Female_2005(1:end,5),Brain_Female_2006(1:end,5),Brain_Female_2007(1:end,5),Brain_Female_2008(1:end,5)],1);
whites_aggregate_death_counts_US=sum([Brain_Female_2005(1:end,6),Brain_Female_2006(1:end,6),Brain_Female_2007(1:end,6),Brain_Female_2008(1:end,6)],1);
blacks_aggregate_incidence_counts_US=sum([Brain_Female_2005(1:end,7),Brain_Female_2006(1:end,7),Brain_Female_2007(1:end,7),Brain_Female_2008(1:end,7)],1);
blacks_aggregate_death_counts_US=sum([Brain_Female_2005(1:end,8),Brain_Female_2006(1:end,8),Brain_Female_2007(1:end,8),Brain_Female_2008(1:end,8)],1);

aggregate_incidence_counts_US=whites_aggregate_incidence_counts_US+blacks_aggregate_incidence_counts_US;
aggregate_death_counts_US=whites_aggregate_death_counts_US+blacks_aggregate_death_counts_US;

figure(6)
plot(year,aggregate_incidence_counts_US,'g*','LineWidth',2)
hold on
plot(year,aggregate_death_counts_US,'m*','LineWidth',2)

p9 = polyfit(year,aggregate_incidence_counts_US,1);
y1 = polyval(p9,2005:2009);
plot(2005:2009,y1,'LineWidth',2);

p10 = polyfit(year,aggregate_death_counts_US,1);
y2 = polyval(p10,2005:2009);
plot(2005:2009,y2,'LineWidth',2);

title('Brain & Nervous System Related Cancer - Incidence/Death counts among females in the entire US','FontSize',20,'FontWeight','bold')
legend('Incidence','Deaths')
xlabel('Year','FontSize',25,'FontWeight','bold')
ylabel('Incidence/Death counts','FontSize',25,'FontWeight','bold')