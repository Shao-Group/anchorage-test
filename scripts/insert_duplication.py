from sys import argv
import random

dupRate = 0.1

if(len(argv) == 3):
    numInserts = 1
else:
    numInserts = int(argv[3])

with open(argv[1], 'r') as f:
    names = []
    seqs = []
    seq = ""
    for l in f.readlines():
        if l.startswith('>'):
            names.append(l.strip())
            if seq != "":
                seqs.append(seq)
            seq = ""
        else:
            seq += l.strip()
    if seq != "":
        seqs.append(seq)
    assert(len(seqs) == len(names))

newseqs = []
for seq in seqs:
    duplen = int(len(seq) * dupRate)
    dupst = random.randint(0, len(seq) - duplen - 1)
    duped = dupst + duplen
    dupseq = seq[dupst: duped]
    newseq = seq
    for _ in range(numInserts):
        dupinsert = random.randint(0, len(newseq) - 1)
        newseq = newseq[:dupinsert] + dupseq + newseq[dupinsert:]
    newseqs.append(newseq)

with open(argv[2], 'w') as f:
    assert(len(names) == len(newseqs))
    for i in range(len(names)):
        f.write(names[i])
        f.write('\n')
        assert(len(newseqs[i]) > 0.99 * (1.0 + dupRate) * len(seqs[i]))
        f.write(newseqs[i])
        f.write('\n')