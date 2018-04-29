%by Anto Oswin
clear; close all; clc;
X = "[[";
Data = readtable('test.csv');
quote = char(34);
for i = 1:size(Data,1) %max number of users
    for j = 1:size(Data,2)
        if(j==1)
            X = strcat(X, string(table2cell(Data(i,j))),", [");
            
        else
            l = strsplit(string(table2cell(Data(i,j))));
            for k = 1:size(l,2)
                if l(k)~= ""
                    X = strcat(X,quote, l(k),quote);
                end    
                if k == size(l,2)-1 && i == size(Data,1)   
                    X = strcat(X, "]]]");
                elseif k == size(l,2)-1
                    X = strcat(X, "]], [");
                elseif l(k)~= ""
                    X = strcat(X,", ");
                end    
            end
        end    
    end
disp(X);    
end
fid = fopen('test.txt','wt');
fprintf(fid, X);
fclose(fid);

