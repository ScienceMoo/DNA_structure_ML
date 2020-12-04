function [found,found_scores, not_found_scores] = check_found(chrm_sequence, positions,actual_positions, pwm_matrix, TF_binding_length, start_matrix, codons)
    found = 0;
    success = false;
    found_scores = [];
    not_found_scores = [];

    for i=1:length(actual_positions)
        for k=1:length(positions)
            if positions(k,2) == actual_positions(i, 2) && positions(k,3) == actual_positions(i, 3)
                found = found + 1;
                region = extractBetween(chrm_sequence,positions(k,2),positions(k,2) + TF_binding_length + 1);
                score = get_score(0, region, pwm_matrix, TF_binding_length, positions(k,3), start_matrix, codons);
                found_scores = [found_scores; score];
                success= true;
                break; 
            end
        end
        if success == false
            false;
            region = extractBetween(chrm_sequence,actual_positions(i, 2),actual_positions(i, 2) + TF_binding_length + 1);
            score = get_score(0, region, pwm_matrix, TF_binding_length, actual_positions(i, 3), start_matrix, codons);
            not_found_scores = [not_found_scores; score];
        end
        success = false;
    end
end

