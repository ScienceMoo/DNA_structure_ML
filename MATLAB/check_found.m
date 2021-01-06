function [found,found_scores, not_found_scores] = check_found(chrm_sequence, positions,actual_positions, pwm_matrix, TF_binding_length)
    found = 0;
    success = false;
    found_scores = [];
    not_found_scores = [];

    for i=1:length(actual_positions)
        for k=1:length(positions)
            if positions(k,1) == actual_positions(i, 1) && positions(k,2) == actual_positions(i, 2)
                found = found + 1;
                region = extractBetween(chrm_sequence,positions(k,1),positions(k,1) + TF_binding_length + 1);
                score = get_score(0, region, pwm_matrix, TF_binding_length, positions(k,2));
                found_scores = [found_scores; score];
                success= true;
                break; 
            end
        end
        if success == false
            region = extractBetween(chrm_sequence,actual_positions(i, 1),actual_positions(i, 1) + TF_binding_length + 1);
            score = get_score(0, region, pwm_matrix, TF_binding_length, actual_positions(i, 2));
            not_found_scores = [not_found_scores; score];
        end
        success = false;
    end
end

