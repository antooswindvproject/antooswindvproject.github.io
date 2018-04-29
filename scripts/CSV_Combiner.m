%by Anto Oswin
clear; close all; clc;
fid_out = fopen( 'temp.csv', 'w' );  % 2 
        for jj = 1 : 216                         % 3
            filename = strcat('01_01_2014-12_31_2014[',int2str(jj),'].csv');
            fid_in = fopen( filename, 'r' );           % 4 
            str = transpose( fread( fid_in, '*char' ) );   % 5 
            fclose( fid_in );                              % 6 
            if not( jj == 1 )                              % 7
                ix1 = regexp( str, '[\r\n]++', 'once' );   % 8 
                str = str(ix1:end);                        % 9
            end
            ix2 = regexp( str, '[\r\n]++$', 'once' );      % 10
            if not( isempty( ix2 ) )                       % 11
                str(ix2:end) = [];                         % 12
            end
            fwrite( fid_out, str, '*char' );               % 13 
        end
        fclose('all');                                     % 14       
    
%writetable(Z,'output.csv');