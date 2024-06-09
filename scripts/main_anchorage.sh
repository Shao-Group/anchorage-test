# real data
ulimit -n 2048 # for kmc on MacOS

MUST_ASSEMBLE=true
reads_dir="data/control-solo"
index_list="data/control-solo.UMIs"
anchor_start="CGCAGAGTACAT"
anchor_end="TTGGAGTTAAAG"
anchorage="python ./programs/anchorage/src/python/anchorage.py"

results_dir="results-solo-anchorage"
if [ -d "$results_dir" ]; then
    rm -r "$results_dir"
    mkdir $results_dir
else
    mkdir $results_dir
fi

for index in $(cat $index_list)
do
    echo "Executing analysis for index $index"
    read1="$reads_dir"/"$index"_R1.fastq
    read2="$reads_dir"/"$index"_R2.fastq
    # assembly
    out_postfix=$index
    anchorage_out_prefix=$results_dir/"anchorage_contig"_$out_postfix
    $anchorage  \
        -s1 $anchor_start -s2 $anchor_end \
        -r1 $read1 -r2 $read2 \
        -o $anchorage_out_prefix \
        --contig_barcode_len 8
done 

echo "Solo test completed!"

# sim w/o artifacts
MUST_SIMULATE=false
ref_fasta="data/16S_ref.fasta"
anchor_start="CGCAGAGTACAT"
anchor_end="TTGGAGTTAAAG"

dir_intm="data-sim"
results_dir="results-sim-anchorage"

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
        anchorage_out_prefix=$results_dir/"anchorage_contig"_$out_postfix
        $anchorage  \
            -s1 $anchor_start -s2 $anchor_end \
            -r1 $read1 -r2 $read2 \
            -o $anchorage_out_prefix \
            --no-trim_barcode \
            --contig_barcode_len 0
    done
done

echo "Simulation test completed!"

# read throughs
MUST_SIMULATE=false
ref_fasta="data/16S_ref.fasta"
anchor_start="CGCAGAGTACAT"
anchor_end="TTGGAGTTAAAG"

dir_intm="data-sim-readthru"
results_dir="results-simthru-anchorage"

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
        
        anchorage_out_prefix=$results_dir/"anchorage_contig"_$out_postfix
        $anchorage  \
            -s1 $anchor_start -s2 $anchor_end \
            -r1 $read1 -r2 $read2 \
            -o $anchorage_out_prefix \
            --no-trim_barcode \
            --contig_barcode_len 0 
    done
done

echo "Simulation of read-throughs completed!"

# repeats simulation
ref_fasta="data/16S_ref_repeated.fasta"
anchor_start="CGCAGAGTACAT"
anchor_end="TTGGAGTTAAAG"

dir_intm="data-sim-repeated"
results_dir="results-simrepeat-anchorage"

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

        anchorage_out_prefix=$results_dir/"anchorage_contig"_$out_postfix
        $anchorage  \
            -s1 $anchor_start -s2 $anchor_end \
            -r1 $read1 -r2 $read2 \
            -o $anchorage_out_prefix \
            --no-trim_barcode \
            --contig_barcode_len 0
    done
done

echo "Simulation with repeats completed!"