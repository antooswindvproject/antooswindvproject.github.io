%by Anto Oswin
clear; close all; clc;
X = 0;
for user = 1:216 %max number of users
    filename = strcat('01_01_2014-12_31_2014[',int2str(user),']');
   Data = readtable(char(strcat(filename,'.csv')));
   disp(strcat("Reading : ",filename,'.csv'));
    if X == 0
    	Z = Data(:,[1 6 7 9]);
        X = 1;
    else
    	Z = [Z;Data(:,[1 6 7 9])]; % combining values for all users into Z
    end
    
end
Z = sortrows(Z,[2 3 4],'descend') 
writetable(Z,'Combined_Data_2.csv');