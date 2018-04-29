%by Anto Oswin
clear; close all; clc;
fid = fopen('Json_40_ID_Tag1.txt','wt');
fprintf(fid, "[[");
Data = readtable('output.csv');
quote = char(34);
for i = 1:size(Data,1) %max number of users
    for j = 1:size(Data,2)
        if(j==1)
            fprintf(fid, strcat(string(table2cell(Data(i,j))),", ["));
        else
            l = strsplit(string(table2cell(Data(i,j))));
            for k = 1:size(l,2)
                if l(k)~= ""
                    fprintf(fid, strcat(quote, l(k),quote));
                end    
                if k == size(l,2) && i == size(Data,1)   
                    fprintf(fid, "]]]");
                elseif k == size(l,2) 
                    fprintf(fid, "]], [");
                elseif l(k)~= ""
                    fprintf(fid, ", ");
                end    
            end
        end    
    end
%disp(X);    
end
fclose(fid);

