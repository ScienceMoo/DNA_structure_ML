function score = get_score(i, s, pwm, len_tf, strnd, start_matrix, codons)
    nukes = {'A', 'C', 'G', 'T'};
    score = 0;
    if strnd == 1
        for k=4:len_tf
            r = extractBetween(s,i+k,i+k);
            pos = find(nukes == r);
            score = score + pwm(pos, k);
        end
        
        start_codon = extractBetween(s,i+1,i+3);
        pos = find(codons == start_codon);
        start_matrix(pos, 1);
        score = score + start_matrix(pos, 1);
    else
        for k=1:len_tf-3
            r = extractBetween(s,i+k,i+k);
            pos = find(nukes == r);
            score = score + pwm(5-pos, len_tf-k+1);
        end
        
        start_codon = extractBetween(s,i+len_tf-2,i+len_tf);
        start_codon = reverse(start_codon);
        pos = find(codons == start_codon);
        score = score + start_matrix(pos, 1);
    end
end