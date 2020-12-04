function [counts, num_TFs] = get_start_matrix(TF_of_interest)
    counts = zeros(64, 1);
    current_chr = '';

    TF_pos_filename = strcat('factor_pos_separated/factorbookMotifPos.txt');
    TFbinding_sites_file = fopen(TF_pos_filename,'rt');

    thisline_TF = fgetl(TFbinding_sites_file);

    i = 0;
    x = 0;
    num_TFs = 0;
    loading = waitbar(0,'Please wait...');
    loading2 = waitbar(0,'Please wait...');
    while current_chr ~= "chrY"
    % for k=1:10
        r = x/24;
        waitbar(r,loading,string(r));
        x = x+1;

        if ~ischar(thisline_TF); break; end  %end of file

        C = strsplit(thisline_TF,"\t");
        chromosome = C(1,2);
        current_chr = string(chromosome{1});

        tic
        filename = strcat('Human Genome/', current_chr, '.fa');
        reads = fastaread(filename);
        current_sequence = reads.Sequence;
        fprintf("took %f seconds to read file", toc)
        current_sequence = upper(string(current_sequence));

        while true
            r = i/1000000;
            waitbar(r,loading2,string(r));
            i = i+1;

            name = C(1,5);
            name = name{1};

            if string(name) ~= TF_of_interest
                thisline_TF = fgetl(TFbinding_sites_file);
                C = strsplit(thisline_TF,"\t");
                continue;
            end

            num_TFs = num_TFs + 1;

            strand = C(1,6);
            strand = strand{1};
            start = C(1,3);
            stop = C(1,4);
            start = str2double(start{1});
            stop = str2double(stop{1});

            if strand == '+'
                start_codon = extractBetween(current_sequence,start+1,start+3);
                pos = find(codons == start_codon);
                counts(pos, 1) = counts(pos, 1) + 1;
            else 
                start_codon = extractBetween(current_sequence,stop - 2,stop);
                start_codon = reverse(start_codon);
                pos = find(codons == start_codon);
                counts(pos, 1) = counts(pos, 1) + 1;
            end

            thisline_TF = fgetl(TFbinding_sites_file);
            if ~ischar(thisline_TF); break; end  %end of file
            C = strsplit(thisline_TF,"\t");
            chromosome = C(1,2);
            if current_chr ~= chromosome{1}
                break;
            end
        end

    end
    i
    x
    num_TFs
    close(loading);
    close(loading2);
end

