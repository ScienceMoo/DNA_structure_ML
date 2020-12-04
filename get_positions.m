function positions = get_positions(sequence, pwm, len_tf, thrshold, start, reg_site, start_matrix, codons)
    
    L = length(sequence);
    seq = string(sequence);

    max_i = L - len_tf;
    i=-1;
    positions = [];
    while i < max_i
        i = i + 1;
        score = get_score(i, seq, pwm, len_tf, 1, start_matrix, codons);
        if score >= thrshold
            positions = [positions; reg_site, start+i, 1, ceil(score)];
        end
        score = get_score(i, seq, pwm, len_tf, 0, start_matrix, codons);
        if score >= thrshold
            positions = [positions; reg_site, start+i, 0, ceil(score)];
        end
    end
end

