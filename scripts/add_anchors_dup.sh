# pre and post-fix anchors to reference sequence
anchor_start=$1
anchor_end=$2
ref_fasta=$3

# name
cat $ref_fasta | head -1
# duplicated anchored seq
cat $ref_fasta | seqkit replace -sp '^' -r $anchor_start | seqkit replace -sp '$' -r $anchor_end | seqkit duplicate -n 5 | grep -v "^>"

