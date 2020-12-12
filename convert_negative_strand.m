function seq2 = convert_negative_strand(seq1)
    seq2 = strrep(seq1,'A','B');
    seq2 = strrep(seq2,'T','A');
    seq2 = strrep(seq2,'B','T');
    seq2 = strrep(seq2,'C','D');
    seq2 = strrep(seq2,'G','C');
    seq2 = strrep(seq2,'D','G');
end
