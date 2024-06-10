# real 
chmod a+x programs/assembler_for_solo.py
ulimit -n 2048 # for kmc on MacOS

MUST_ASSEMBLE=true
reads_dir="data/control-solo"
index_list="data/control-solo.UMIs"
anchor_start="CGCAGAGTACAT"
anchor_end="TTGGAGTTAAAG"
solocontigbarcodes='TTACCGAC,TCGTCTGA,TTCCAGGT,TACGGTCT,AAGACCGT,CAGGTTCA,TAGGAGCT,TACTCCAG,AGTGACCT,AGCCTATC,TCATCTCC,CCAGTATC,TTGCGAGA,GAACGAAG,CGAATTGC,GGAAGAGA,TCGGATTC,CTGTACCA,GAGAGTAC,TCTACGCA,GCAATTCC,CTCAGAAG,GTCCTAAG,GCGTTAGA,CAAGGTAC,AGACCTTG,GTCGTTAC,GTAACCGA,GAATCCGT,CATGAGCA,CTTAGGAC,ATCTGACC,TCCTCATG,AGGATAGC,GGAGGAAT,GACGTCAT,CCGCTTAA,GACGAACT,TCCACGTT,AACCAGAG,GTCAGTCA,CCTTCCAT,AGGAACAC,CTTACAGC,TACCTGCA,AGACGCTA,CAACACAG,GTACCACA,CGAATACG,GTCCTTGA,CAGTGCTT,TCCATTGC,GTCGATTG,ATAACGCC,GCCTTAAC,GGTATAGG,TCTAGGAG,TGCGTAAC,CTTGCTAG,AGCGAGAT,TATGGCAC,GAATCACC,GTAAGGTG,CGAGAGAA,CGCAACTA,CACAGACT,TGGAAGCA,CAATAGCC,CTCGAACA,GGCAAGTT,AGCTACCA,CAGCATAC,CGTATCTC,TTACGTGC,AGCTAAGC,AAGACACC,CAACTCCA,GATCTTGC,CTTCACTG,CTCGACTT,GTACACCT,CCAAGGTT,GAACGGTT,CCAGTTGA,GTCATCGT,CAATGCGA,GGTTGAAC,CTTCGGTT,CGGCATTA,CACGCAAT,GGAATGTC,TGGTGAAG,GGACATCA,GGTGTACA,GATAGCCA,CCACAACA,CACTGTAG,GTGCACGA,ATGTTCCT,CATTATGG,TCTTGTTT,GGCTTACT,ACGATATG,ATCCGCAG,AAGCGACT,TGATAGGC,AACACCAC,ACCTCTTC,GTCCGATC,GAGGACCA,CGCTCTTA,CTGAGCTC,ACGAATCC,GTCTGAGT,CCTAAACT,TGTCACAC,GATATGAA,AAGTGTGG,GTTGGCGT,TAGCTGGC,ATTACCCA,GACTTGTG,CAGGTAAG,AAGGAGAC,AGTCAGGT,ACCGTAAG,TATGACGT,TTGGGTAC,TTCAATAG,GTTTGCTC,AGAAGCCT,CTAGGTTG,TGTGTCAG,AGAACCAG,ATTGGACA,ACCCGTTG,ACCGGAGT,CTTGACGA,GCCACGAC,TCTGGAAC,CACTAGAC,TTGCGTTA,CCTATGCA,CAACCGAG,TGTTCGCC,ACAAGGCA,TCAGCGCC,AGTCACAT,CCTTTCAC,CTTTCCCT,GACAATTC,ACACGACT,CCTGTCAA,CCATCCGC,GGTGTGAG,CTTGCATA,GCCAATCC,ATGCCGGT,CATACCGT,ATCAGAGC,ATGGCTGT,AAGGCGTA,ACGAGGAG,TAATCTCG,TACGGCAG,TGCCCATC,CAGCAGTC,TACCGGCT,AGGTAGGA,TCGCGCAA,CTCGAAAT,CTCACAAC,GTAACCAC,CATATCCA,CGCTAATC,CTTCCAAC,AAGGAAGG,GCACACAA,GTCAGTAT,ATTCGAGC,CACCTGTA,CCGACTCT,TTGCTGGA,CAGCTTCG,TCCCACGA,ACCAACAG,CCTCGGGT,TAGCACCT,TGAGGACT,TTCCCGAA,GAGTCGAT,TACCTGTG,TGTCGTAG,CAATCATA,GTTCTTAT,GATGCGAC,GAAGAGGG,TAGTAATC,GTGTGGAG,ACGTTGTA,GCGCTAAT,AGAGCTGC,CATACTTA,TTGCACCG,GCGGGATA,GAAGTGAA,CTGTTTAC,GAGCACTC,TTGTTGCA,CCACACTT,CCCGTTTG,ATGCTCCC,GCTCAATA,GTAGTTCG,CGAGAACC,GCCATGTA,TTTCTCTA,CCAGCGAT,TGGGAGTG,CCCTCGTA,CGATATGG,TTGTGCCC,TGTCCTCT,GTATAGTC,TTTGGGAT,CACCAAGC,CGGAGAGG,TATTTACC,TATATGGA,GTTAACAT,CGTCTTGG,CGTAGCGA,TAGTCACA,AGAAGTGG,CGTGGATT,GTAGATGC,TACCGCTC,CGAACCAC,TATTGTTC,GTTGTGTG,AAAGCTAA,TGGAGATT,AATTAGAC,ACTTTGGG,CGGACGGA,GCAGAGCC,GCATGATC,TCGACCTA,ACCCTGAC,GTTGAAGG,GCACGGGA,CGTATAAA,AGAGACGG,TACAAGTC,TGAATCTT,GCAACTTG,ACGACGTC,GTATGACG,TACAGCAA,CAGCAGGG,GATAAATG,GCATCAAG,CGATACAT,AACCCTAT,ACGTCGAG,TGACTAGA,TAGACGGG,CTCTTCTA,TACGTCCC,GATGGAAA,GTTCGTCG,GAGACCAA,ACGTGAAC,TTCCCTTT,GACGCTCG,CTCACGTC,CTGCCAAG,ACGCCGCA,CGCCAGTC,CTAAACAA,TATACCTC,CTCTTGAT,ACTCTTAG,GAGCAACA,CAGTGACG,AAGATTGA,GTGTGTTT,CGTCCGAC,ACTTCTGC,TTAAGCAG,ATCAAATC,TTTGAGTC,AAATCCTC,TACAGATG,TAAGCGCA,CAACGGAA,AGCCTGGA,GAGGACAG,CTATCGAA,TCACTAAC,TCGATAAG,CTTTATTC,CTGCCTTC,ACAACCAA,GCAATGGG,CTGGACAC,AAGTATGC,TCCGATGG,GACAACGG,TAGCTTTA,AAACAGTC,ACCTCACT,GACATTAA,ATGTACGT,ATGACAAA,CCACCTAC,TGCTGTTG,CATTTCAG,CGTCCCTA,TACGATTA,AAAGATCG,GTGAGCTA,AACGCGGG,CTTGTGCT,GCTTACCC,AGTAAACA,CGATGTAA,CCTAGTCG,AGTAGTAA,TACTAAGG,CATTCGGA,AATCGTCA,GCTGATTT,CGCGAAAG,TTGCCACT,TTCGTGGA,AGTCCCGG,TCCTGGAC,CTACATGA,CCGGATAG,AACCCGCC,CGAACGTG,CCGTAGAA,CATCTACT,AGTCTGCT,GCCGAATC,ACTATGAT,CCCTATCT,CGTTGTCC,TGGAACGG,CCCTTCGG,TGTCCAAA,AGTACAAG,TACTGTGA,CCGGAATT,TCGCTCGG,AGTGCGGA,GCTTCACA,CCGATCGT,CCGTAAGC,AGTTGGAT,TAACACGC,AGACTCAC,CAGAGTGT,ACATTACG,ATTACTAC,TGGACCCT,CGCTTGCA,GTTGCCTT,CCAATGAA,ATCAGTTG,ACATACAC,CTCCATAT,GCTTAAGT,ACACGTAT,CAAGAAGT,TATCAGTA,CGAGTCAG,TTTCCATC,CTTTAACT,GCCTCTAT,CCTCCTTT,CAGTTCCC,TACCTTGT'
solobarcodes='CGTATTCG,TCAAGGAC,AAGCACTG,GCAATGGA,CAATCGAC,GGCGTTAT,GTTAAGGC,CCTATACC,CTCCTAGA,GTTACGCA,CTAGCAAG,ATCTCGCT,GTGCCATA,GGTGATTC,CACCTTAC,TTCTCTCG,TAGTTGCG,AGTCTGTG,TGCTTCCA,GGCTATTG,TGTTCGAG,AACTTGCC,TGGTAGCT,GTATGCTG,GAGATACG,GCACGTAA,GCTTAGCT,GGTGTCTT,TGGAGTTG,GCAAGATC,CAGTGAAG,AAGTCGAG,AGGTGTAC,AACCTTGG,AACCGTTC,TCAACTGG,ACGATGAC,TCGCATTG,GTTCAACC,AACCGAAG,TAATGCCG,ATTGCGTG,GACATTCC,CTTCACCA,TGATGTCC,TGTACACC,TGGCTATC,TGTTGTGG,GTCGGTAA,TCAGACGA,ACCTGGAA,AGACCGTA,ACGGTCTT,TGAACCTG,AGCTCCTA,CTGGAGTA,AGGTCACT,GATAGGCT,GGAGATGA,GATACTGG,TCTCGCAA,CTTCGTTC,GCAATTCG,TCTCTTCC,GAATCCGA,TGGTACAG,GTACTCTC,TGCGTAGA,GGAATTGC,CTTCTGAG,CTTAGGAC,TCTAACGC,GTACCTTG,CAAGGTCT,GTAACGAC,TCGGTTAC,ACGGATTC,TGCTCATG,GTCCTAAG,GGTCAGAT,CATGAGGA,GCTATCCT,ATTCCTCC,ATGACGTC,TTAAGCGG,AGTTCGTC,AACGTGGA,CTCTGGTT,TGACTGAC,ATGGAAGG,GTGTTCCT,GCTGTAAG,TGCAGGTA,TAGCGTCT,CTGTGTTG,TGTGGTAC,AGTCGCTT,GCCTATCA,GGCGCTGA,ATGTGACT,GTGAAAGG,AGGGAAAG,GAATTGTC,AGTCGTGT,GGATTCGT,ACTCAGAC,CTCACACC,TATGCAAG,GGATTGGC,ACCGGCAT,ACGGTATG,GCTCTGAT,TGGGTAAT,CACAAGTC,CTCCTCGT,CGAGATTA,CTGCCGTA,GATGGGCA,GACTGCTG,AGCCGGTA,CTACAGTG,TCGTGCAC,ATTTCGAG,GTTGTGAG,GTGGTTAC,TGGATATG,GATTAGCG,GTTGGAAG,TCGTGGGA,CTGTTGGT,ATACTGAC,GCTCGAAT,TACAGGTG,AGAGTCGG,TCCAGCAA,CGAAGCTG,CCTTCCTT,TTGTGTGC,ACCCGAGG,AGGTGCTA,AGTCCTCA,TTCGGGAA,ATCGACTC,CACAGGTA,TCCTACCT,TTGCGCGA,AGGAACAT,CCATAATG,AAACAAGA,AGTAAGCC,CATATCGT,CTGCGGAT,ACAGCCAT,TACGCCTT,GTGGTGTT,GAAGAGGT,GATCGGAC,TGGTCCTC,TAAGAGCG,GAGCTCAG,TTGACAGG,GCGGATGG,AGTTTAGG,GTGTGACA,TTCATATC,CCACACTT,ACGCCAAC,GCCAGCTA,GGCGAACA,TGCCTTGT,CTTACCTG,GTCTCCTT,ACCTGACT,CTTACGGT,ACGTCATA,GTACCCAA,ACTCCGGT,TCGTCAAG,AGGCTTCT,CAACCTAG,CTGACACA,CTGGTTCT,TGTCCAAT,CAACGGGT,CTATTGAA,GAGCAAAC,GTCGTGGC,GTTCCAGA,GTCTAGTG,TAACGCAA,TGCATAGG,CTCGGTTG,TTAGCTTT,AATCTCCA,GTCTAATT,CCCAAAGT,TCCGTCCG,GGCTCTGC,GATCATGC,TAGGTCGA,GTCAGGGT,CCTTCAAC,TCCCGTGC,TTTATACG,CCGTCTCT,GACTTGTA,AAGATTCA,CAAGTTGC,GACGTCGT,CGTCATAC,TTGCTGTA,CCCTGCTG,CATTTATC,CTTGATGC,ATGTATCG,ATAGGGTT,CTCGACGT,TCTAGTCA,CCCGTCTA,TAGAAGAG,GGGACGTA,TTTCCATC,CGACGAAC,TTGGTCTC,GTTCACGT,AAAGGGAA,CGAGCGTC,GACGTGAG,CTTGGCAG,TGCGGCGT,GACTGGCG,TTGTTTAG,GAGGTATA,ATCAAGAG,CTAAGAGT,TGTTGCTC,CGTCACTG,TCAATCTT,AAACACAC,GTCGGACG,CTACGACA,TATGATTG,ATAAGAAC,GTCGCATC,CCCTCTTC,GATTACTA,CTCCACAC,TACAACGT,ATTAGCGC,GCAGCTCT,TAAGTATG,CGGTGCAA,TATCCCGC,TTCACTTC,GTAAACAG,GAGTGCTC,TGCAACAA,AAGTGTGG,CAAACGGG,GGGAGCAT,TATTGAGC,CGAACTAC,GGTTCTCG,TACATGGC,TAGAGAAA,ATCGCTGG,CACTCCCA,TACGAGGG,CCATATCG,GGGCACAA,AGAGGACA,GACTATAC,ATCCCAAA,GCTTGGTG,CCTCTCCG,GGTAAATA,TCCATATA,ATGTTAAC,CCAAGACG,TCGCTACG,TGTGACTA,CCACTTCT,AATCCACG,GCATCTAC,GAGCGGTA,GTGGTTCG,GAACAATA,CACACAAC,CCGGGACT,GTCCAGGA,TCATGTAG,CTATCCGG,GGCGGGTT,CACGTTCG,TTCTACGG,AGTAGATG,AGCAGACT,GATTCGGC,ATCATAGT,AGATAGGG,GGACAACG,CCGTTCCA,CCGAAGGG,TTTGGACA,CTTGTACT,TCACAGTA,AATTCCGG,CCGAGCGA,TCCGCACT,TGTGAAGC,ACGATCGG,GCTTACGG,ATCCAACT,GCGTGTTA,GTGAGTCT,ACACTCTG,CGTAATGT,GTAGTAAT,AGGGTCCA,TGCAAGCG,AAGGCAAC,TTCATTGG,CAACTGAT,GTGTATGT,ATATGGAG,ACTTAAGC,ATACGTGT,ACTTCTTG,TACTGATA,CTGACTCG,GATGGAAA,AGTTAAAG,ATAGAGGC,AAAGGAGG,GGGAACTG,ACAAGGTA,GCAGAAGT,CTGCTTAA,GATTTGAT,GACTCAAA,GAGGATTT,CATCTGTA,TGCGCTTA,TTCCGTTG,TCCAGGCT,CTGTCCTC,TTCGATAG,GTTAGTGA,CTTATCGA,GAATAAAG,GAAGGCAG,TTGGTTGT,CCCATTGC,GTGTCCAG,GCATACTT,CCATCGGA,CCGTTGTC,TAAAGCTA,GACTGTTT,AGTGAGGT,TTAATGTC,ACGTACAT,TTTGTCAT,GTAGGTGG,CAACAGCA,CTGAAATG,TAGGGACG,TAATCGTA,CGATCTTT,TAGCTCAC,CCCGCGTT,AGCACAAG,GGGTAAGC,TGTTTACT,TTACATCG,CGACTAGG,TTACTACT,CCTTAGTA,TCCGAATG,TGACGATT,AAATCAGC,CTTTCGCG,AGTGGCAA,TCCACGAA'

results_dir="results-solo-spades"
if [ -d "$results_dir" ]; then
    rm -r "$results_dir"
    mkdir $results_dir
else
    mkdir $results_dir
fi

out_postfix="solo"
spades_prefix=$results_dir/"spades_alln"_$out_postfix
if [ ! -d "$spades_prefix" ]; then
        mkdir $spades_prefix
else
        rm -r $spades_prefix
        mkdir $spades_prefix
fi
cd $spades_prefix
../../programs/assembler_for_solo.py \
    --solo-contig-barcodes $solocontigbarcodes \
    --solo-barcodes $solobarcodes \
    --sampling-target 50000000000000 \
    --r1-orientation "forward" \
    --threads 8 \
    --pcr-primer CAGACACUCACACUAATACUCG \
    --anchor-start $anchor_start \
    --anchor-end $anchor_end \
    --algorithm spades \
    ../../$reads_dir \
    spades_alln
cd ../../

spades_prefix=$results_dir/"spades_500n"_$out_postfix
if [ ! -d "$spades_prefix" ]; then
        mkdir $spades_prefix
else
        rm -r $spades_prefix
        mkdir $spades_prefix
fi
cd $spades_prefix
../../programs/assembler_for_solo.py \
    --solo-contig-barcodes $solocontigbarcodes \
    --solo-barcodes $solobarcodes \
    --sampling-target 500 \
    --r1-orientation "forward" \
    --threads 8 \
    --pcr-primer CAGACACUCACACUAATACUCG \
    --anchor-start $anchor_start \
    --anchor-end $anchor_end \
    --algorithm spades \
    ../../$reads_dir \
    spades_500n
cd ../../

echo "Solo test completed!"

# sim w/o artifacts
MUST_SIMULATE=false
ref_fasta="data/16S_ref.fasta"
anchor_start="CGCAGAGTACAT"
anchor_end="TTGGAGTTAAAG"

dir_intm="data-sim"
results_dir="results-sim-spades"

if [ -d "$dir_intm" ]; then
    if [ "$MUST_SIMULATE" = "true" ]; then
      rm -r "$dir_intm"
      mkdir $dir_intm
    fi
else
    mkdir $dir_intm
fi

if [ -d "$results_dir" ]; then
   rm -r "$results_dir"
   mkdir $results_dir
else
   mkdir $results_dir
fi


# split ref
cd $dir_intm
mkdir split_ref
cd split_ref
awk '/^>/ {OUT=substr($0,2) ".fa"}; OUT{print >OUT}' ../../$ref_fasta
cd ../../

for i in `ls $dir_intm/split_ref/*`
do
    namebase=$(basename "$i" .fa)
    # Simulate reads
    ref_seq=$i
    anchored_ref="$dir_intm/$namebase.anchored.fasta"
    reads_dir_prefix=$dir_intm/$namebase".reads_cov"
    sh scripts/add_anchors.sh $anchor_start $anchor_end $ref_seq > $anchored_ref
    for cov in 50 100 500 3000
    do
        reads_dir="$reads_dir_prefix"_"$cov"
        if [ "$MUST_SIMULATE" = "true" ] || [ ! -d "$reads_dir" ]; then
            Rscript scripts/make_reads.R $anchored_ref $cov $reads_dir
        fi
    done

    for cov in 50 100 500 3000
    do
        reads_dir="$reads_dir_prefix"_"$cov"
        read1=$reads_dir/sample_01_1.fasta
        read2=$reads_dir/sample_01_2.fasta
        out_postfix=$namebase."cov_"$cov

        spades_prefix=$results_dir/"spades_500n"_$out_postfix
        if [ ! -d "$spades_prefix" ]; then
             mkdir $spades_prefix
        else
             rm -r $spades_prefix
             mkdir $spades_prefix
        fi
        cd $spades_prefix
        ../../programs/assembler_for_solo.py \
            --sampling-target 500 \
            --r1-orientation "forward" \
            --threads 8 \
            --anchor-start $anchor_start \
            --anchor-end $anchor_end \
            --algorithm spades \
            ../../$reads_dir \
            spades_500n
        cd ../../

        spades_prefix=$results_dir/"spades_alln"_$out_postfix
        if [ ! -d "$spades_prefix" ]; then
             mkdir $spades_prefix
        else
             rm -r $spades_prefix
             mkdir $spades_prefix
        fi
        cd $spades_prefix
        ../../programs/assembler_for_solo.py \
            --sampling-target 50000000000000 \
            --r1-orientation "forward" \
            --threads 8 \
            --anchor-start $anchor_start \
            --anchor-end $anchor_end \
            --algorithm spades \
            ../../$reads_dir \
            spades_alln &
        cd ../../
    done
done

echo "Simulation test completed!"

# read throughs
MUST_SIMULATE=false
ref_fasta="data/16S_ref.fasta"
anchor_start="CGCAGAGTACAT"
anchor_end="TTGGAGTTAAAG"

dir_intm="data-sim-readthru"
results_dir="results-simthru-spades"

if [ -d "$dir_intm" ]; then
    if [ "$MUST_SIMULATE" = "true" ]; then
      rm -r "$dir_intm"
      mkdir $dir_intm
    fi
else
    mkdir $dir_intm
fi
if [ -d "$results_dir" ]; then
    rm -r "$results_dir"
    mkdir $results_dir
else
    mkdir $results_dir
fi

for i in `ls $dir_intm/split_ref/*`
do
    namebase=$(basename "$i" .fa)
    # Simulate reads
    ref_seq=$i
    anchored_ref="$dir_intm/$namebase.anchored.fasta"
    reads_dir_prefix=$dir_intm/$namebase".reads_cov"
    sh scripts/add_anchors_dup.sh $anchor_start $anchor_end $ref_seq > $anchored_ref
    for cov in 50 100 500 3000
    do
        reads_dir="$reads_dir_prefix"_"$cov"
        if [ "$MUST_SIMULATE" = "true" ] || [ ! -d "$reads_dir" ]; then
            Rscript scripts/make_reads.R $anchored_ref $cov $reads_dir
        fi
    done

    # run assembly tools
    for cov in 50 100 500 3000
    do
        reads_dir="$reads_dir_prefix"_"$cov"
        read1=$reads_dir/sample_01_1.fasta
        read2=$reads_dir/sample_01_2.fasta
        out_postfix=$namebase."cov_"$cov

        spades_prefix=$results_dir/"spades_alln"_$out_postfix
        if [ ! -d "$spades_prefix" ]; then
             mkdir $spades_prefix
        else
             rm -r $spades_prefix
             mkdir $spades_prefix
        fi
        cd $spades_prefix
        ../../programs/assembler_for_solo.py \
            --sampling-target 50000000000000 \
            --r1-orientation "forward" \
            --threads 8 \
            --anchor-start $anchor_start \
            --anchor-end $anchor_end \
            --algorithm spades \
            ../../$reads_dir \
            spades_alln &
        cd ../../

        spades_prefix=$results_dir/"spades_500n"_$out_postfix
        if [ ! -d "$spades_prefix" ]; then
             mkdir $spades_prefix
        else
             rm -r $spades_prefix
             mkdir $spades_prefix
        fi
        cd $spades_prefix
        ../../programs/assembler_for_solo.py \
            --sampling-target 500 \
            --r1-orientation "forward" \
            --threads 8 \
            --anchor-start $anchor_start \
            --anchor-end $anchor_end \
            --algorithm spades \
            ../../$reads_dir \
            spades_500n &
        cd ../../

    done
done

echo "Simulation of read-throughs completed!"

# repeats simulation
ref_fasta="data/16S_ref_repeated.fasta"
anchor_start="CGCAGAGTACAT"
anchor_end="TTGGAGTTAAAG"

dir_intm="data-sim-repeated"
results_dir="results-simrepeat-spades"

if [ -d "$dir_intm" ]; then
    if [ "$MUST_SIMULATE" = "true" ]; then
    rm -r "$dir_intm"
    mkdir $dir_intm
    fi
else
    mkdir $dir_intm
fi
if [ -d "$results_dir" ]; then
    rm -r "$results_dir"
    mkdir $results_dir
else
    mkdir $results_dir
fi

# split ref
cd $dir_intm
mkdir split_ref
cd split_ref
awk '/^>/ {OUT=substr($0,2) ".fa"}; OUT{print >OUT}' ../../$ref_fasta
cd ../../

for i in `ls $dir_intm/split_ref/*`
do
    namebase=$(basename "$i" .fa)
    # Simulate reads
    ref_seq=$i
    anchored_ref="$dir_intm/$namebase.anchored.fasta"
    reads_dir_prefix=$dir_intm/$namebase".reads_cov"
    sh scripts/add_anchors_dup.sh $anchor_start $anchor_end $ref_seq > $anchored_ref
    for cov in 50 100 500 3000
    do
        reads_dir="$reads_dir_prefix"_"$cov"
        if [ "$MUST_SIMULATE" = "true" ] || [ ! -d "$reads_dir" ]; then
            Rscript scripts/make_reads.R $anchored_ref $cov $reads_dir
        fi
    done

    # run assembly tools
    for cov in 50 100 500 3000
    do
        reads_dir="$reads_dir_prefix"_"$cov"
        read1=$reads_dir/sample_01_1.fasta
        read2=$reads_dir/sample_01_2.fasta
        out_postfix=$namebase."cov_"$cov

        spades_prefix=$results_dir/"spades_500n"_$out_postfix
        if [ ! -d "$spades_prefix" ]; then
            mkdir $spades_prefix
        else
            rm -r $spades_prefix
            mkdir $spades_prefix
        fi
        cd $spades_prefix
        ../../programs/assembler_for_solo.py \
            --sampling-target 500 \
            --r1-orientation "forward" \
            --threads 8 \
            --anchor-start $anchor_start \
            --anchor-end $anchor_end \
            --algorithm spades \
            ../../$reads_dir \
            spades_500n &
        cd ../../
        spades_prefix=$results_dir/"spades_alln"_$out_postfix
        if [ ! -d "$spades_prefix" ]; then
            mkdir $spades_prefix
        else
            rm -r $spades_prefix
            mkdir $spades_prefix
        fi
        cd $spades_prefix
        ../../programs/assembler_for_solo.py \
            --sampling-target 50000000000000 \
            --r1-orientation "forward" \
            --threads 8 \
            --anchor-start $anchor_start \
            --anchor-end $anchor_end \
            --algorithm spades \
            ../../$reads_dir \
            spades_alln &
        cd ../../

    done
done

echo "Simulation with repeats completed!"

