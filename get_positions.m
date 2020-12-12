function positions = get_positions(sequence, pwm, len_tf, thrshold, start)

    L = strlength(sequence);
    seq = string(sequence);

    max_i = L - len_tf;
    i=-1;
    positions = [];
    while i < max_i
        i = i + 1;
        score = get_score(i, seq, pwm, len_tf, 1);
        if score >= thrshold
            positions = [positions; start+i, 1, ceil(score)];
        end
        score = get_score(i, seq, pwm, len_tf, 0);
        if score >= thrshold
            positions = [positions; start+i, 0, ceil(score)];
        end
    end
end