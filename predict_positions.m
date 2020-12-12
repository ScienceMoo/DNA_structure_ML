function positions = predict_positions(chrm_sequence, chromosome_of_interest, pwm_matrix, TF_binding_length, threshold)
    regRegions = load("regRegions.mat");
    chromosome_names_row = regRegions.data(1,:);
    regRegions = regRegions.data(:, chromosome_names_row == chromosome_of_interest);
    regRegions = regRegions';

    positions = [];
    
    loading = waitbar(0,'Please wait...');
    
    numRegions = length(regRegions);
    numPos = 0;
    for i=1:numRegions
        r = i/numRegions;
        waitbar(r,loading,string(r));

        start = regRegions(i,2);
        stop = regRegions(i,3);
        start = str2double(start);
        stop = str2double(stop);

        region = extractBetween(chrm_sequence,start,stop);
        region = region{1};
        
        positions = [positions; get_positions(region, pwm_matrix, TF_binding_length, threshold, start)];
    end
    close(loading)
end

