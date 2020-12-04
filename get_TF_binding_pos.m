function TF_binding_pos = get_TF_binding_pos(chromosome_of_interest,TF_of_interest, stop_searching)
    TF_binding_pos = [];
    TF_pos_filename = strcat('factor_pos_separated/', chromosome_of_interest, '_TF_pos.txt');
    TFbinding_sites_file = fopen(TF_pos_filename,'rt');

    % Regulatory regions 
    reg_file_name = strcat("RegTfbs/", chromosome_of_interest, "_regTfbs.txt");
    regulatory_regions_file = fopen(reg_file_name,'rt');

    thisline_TF = fgetl(TFbinding_sites_file);
    thisline_TF = fgetl(TFbinding_sites_file);
    thisline_Reg = fgetl(regulatory_regions_file);
    thisline_Reg = fgetl(regulatory_regions_file);

    x = 0; % number of regulatory regions covered
    loading = waitbar(0,'Please wait...');
    while x < stop_searching
        r = x/stop_searching;
        progress = round(r,2);
        waitbar(progress,loading,string(progress));
        if ~ischar(thisline_TF); break; end  %end of file

        if ~ischar(thisline_Reg); break; end  %end of file

        C1 = strsplit(thisline_TF,"\t");
        C2 = strsplit(thisline_Reg,"\t");
        strand = C1(1,4);
        strand = strand{1};
        strand = strsplit(strand," ");
        strand = strand(1,2);
        strand = strand{1};

        start1 = C1(1,1);
        stop1 = C1(1,2);
        name = C1(1,3);
        name = name{1};
        name = strsplit(name," ");
        name = name(1,2);
        name = name{1};

        if string(name) ~= TF_of_interest
            thisline_TF = fgetl(TFbinding_sites_file);
            continue;
        end

        start2 = C2(1,1);
        stop2 = C2(1,2);
        site_id = C2(1,3);
        site_id = site_id{1};

        site_id_arr = strsplit(site_id,".");
        site_id_num = site_id_arr(1,2);
        site_id_num = str2double(site_id_num{1});
        
        start1 = str2double(start1{1});
        start2 = str2double(start2{1});
        stop1 = str2double(stop1{1});
        stop2 = str2double(stop2{1});
        
        if start2 > start1
            thisline_TF = fgetl(TFbinding_sites_file);
        elseif start1 > stop2
            thisline_Reg = fgetl(regulatory_regions_file);
            x = x + 1;
        elseif start1 > start2 && stop1 < stop2
            if string(strand) == '+'
                TF_binding_pos = [TF_binding_pos; site_id_num, start1 , 1];
            else
                TF_binding_pos = [TF_binding_pos; site_id_num, start1 , 0];
            end
            thisline_TF = fgetl(TFbinding_sites_file);
        else
            thisline_TF = fgetl(TFbinding_sites_file);
            thisline_Reg = fgetl(regulatory_regions_file);
            x = x + 1;
        end
    end
end

