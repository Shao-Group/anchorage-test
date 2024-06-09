# assembly

# make reference with repeats
#python ../scripts/insert_duplication.py  data/16S_ref.fasta  data/16S_ref_repeated.fasta
sh scripts/main_megahit.sh
sh scripts/main_spades.sh
sh scripts/main_anchorage.sh
