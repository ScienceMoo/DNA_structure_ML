function [pwmatrix, bd_length] = getPWM(TF_OI)
    f = fopen('factorbookMotifPwm.txt','rt');
    thisline = fgetl(f);
    pwmatrix = [];
    bd_length = 0;
    while true
        if ~ischar(thisline); break; end  %end of file
        C = strsplit(thisline,"\t");

        TF = C(1,1);
        TF = string(TF{1});
        if TF == TF_OI
            bd_length = C(1,2);
            bd_length = bd_length{1};
            bd_length = str2double(bd_length);
            for i=3:6
                row = C(1,i);
                row = string(row{1});
                row = strsplit(row,",");
                pwmatrix = [pwmatrix; str2double(row(1:bd_length))];
            end
            break;
        end
        thisline = fgetl(f);
    end
    pwmatrix
    pwmatrix = pwmatrix + 0.001;
    pwmatrix = log(pwmatrix);
    fclose(f);
end