# pre and post-fix anchors to reference sequence
anchor_start=$1
anchor_end=$2
ref_fasta=$3
cat $ref_fasta | seqkit replace -sp '^' -r $anchor_start | seqkit replace -sp '$' -r $anchor_end

