function positions = predict_positions(chrm_sequence, chromosome_of_interest, pwm_matrix, TF_binding_length, threshold, stop_searching, start_matrix, codons)
    reg_file_name = strcat("RegTfbs/", chromosome_of_interest, "_regTfbs.txt");
    regulatory_regions_file = fopen(reg_file_name,'rt');
    thisline = fgetl(regulatory_regions_file);

    positions = [];
    for i=1:stop_searching
        thisline = fgetl(regulatory_regions_file);
        C = strsplit(thisline,"\t");
        start = C(1,1);
        stop = C(1,2);
        start = str2double(start{1});
        stop = str2double(stop{1});
        site_id = C(1,3);
        site_id = site_id{1};

        site_id_arr = strsplit(site_id,".");
        site_id_num = site_id_arr(1,2);
        site_id_num = str2double(site_id_num{1});

        region = extractBetween(chrm_sequence,start,stop);
        region = region{1};
        L = length(region);
        positions = [positions; get_positions(region, pwm_matrix, TF_binding_length, threshold, start, site_id_num, start_matrix, codons)];
    end
    fclose(regulatory_regions_file);
end

