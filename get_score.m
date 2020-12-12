function score = get_score(i, s, pwm, len_tf, strnd)
    nukes = {'A', 'C', 'G', 'T'};
    score = 0;
    if strnd == 1
        for k=1:len_tf
            r = extractBetween(s,i+k,i+k);
            pos = find(nukes == r);
            if pos
                score = score + pwm(pos, k);
            else
                score = score - 100;
            end
        end
    else
        for k=1:len_tf
            r = extractBetween(s,i+k,i+k);
            pos = find(nukes == r);
            if pos
                score = score + pwm(5-pos, len_tf-k+1);
            else
                score = score - 100;
            end
        end
    end
end