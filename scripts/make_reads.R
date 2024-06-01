suppressPackageStartupMessages(library(polyester))
suppressPackageStartupMessages(library(Biostrings))

args <- commandArgs(TRUE)
fasta <- args[1]                      # fasta file
coverage <- as.numeric(args[2])    # coverage for low LoopSeq, mid Solo, high Solo
output_prefix <- args[3]
err_rate <- 0.005
if (length(args) >= 4) {
    err_rate = as.numeric(args[4])
}
print("Simulate reads:")
print(paste("fasta=", fasta, ", cov=", coverage, " output=", output_prefix, " err_rate=", err_rate, sep=""))



read_len   <- 110
num_sample <- 1
num_rep    <- rep(1, num_sample)                                           # One replicate per sample
seqObj     <- readDNAStringSet(fasta)                                      # Biostrings object
num_seq    <- length(seqObj)                                               # number of sequences
lengths    <- nchar(seqObj)                                                # length per sequence
read_of_seq  <- round(coverage * lengths / read_len / 2)                   # num_reads per sequence
fold_changes <- matrix(1, nrow = num_seq, ncol = num_sample)               # no FC

head(seqObj)
head(lengths)
head(read_of_seq)
for (i in read_of_seq){
	stopifnot(i < 2^31)
}
stopifnot(length(lengths) == num_seq)
stopifnot(length(read_of_seq) == num_seq)

simulate_experiment(fasta, reads_per_transcript = read_of_seq, 
    num_reps = num_rep, fold_changes = fold_changes,
    readlen = read_len, paired = TRUE, fraglen = 400, strand_specific = TRUE,
    bias = 'none', outdir = output_prefix, error_rate = err_rate)

print(paste("fasta=", fasta, ", cov=", coverage, " output=", output_prefix, sep=""))
print("Simulate reads completed!")
